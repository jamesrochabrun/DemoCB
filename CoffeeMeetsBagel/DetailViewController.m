//
//  DetailViewController.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "DetailViewController.h"
#import "CommonUI.h"
#import "Common.h"
#import "CBTeamMember.h"
#import "UIImageView+AFNetworking.h"
#import "CBAvatarView.h"
#import "DetailInfoView.h"
#import "UITextView+Additions.h"
#import "CBCoredataStack.h"
#import "AvatarViewController.h"
#import "UIButton+Additions.h"
#import "UIFont+Additions.h"

@interface DetailViewController ()<UIScrollViewDelegate, CBAvatarDelegate, UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) UIButton *dismissButton;
@property (nonatomic, strong) CBAvatarView *avatarView;
@property (nonatomic, strong) DetailInfoView *detailView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITextView *bioTextView;
@property (nonatomic, strong) UIImageView *footerView;
@property (nonatomic, strong) UIButton *likeButton;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [UIScrollView new];
    _scrollView.scrollEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    _avatarView = [CBAvatarView new];
    _avatarView.teamMember = _teamMember;
    _avatarView.delegate = self;
    [_scrollView addSubview:_avatarView];
    
    _likeButton = [UIButton buttonWithText:@"LIKE" withTitleColor:kColorWhite withFont:[UIFont regularFont:kGeomH2Size] target:self action:@selector(like:) inView:self.view];
    [_likeButton setTitleColor:UIColorRGB(kColorCoffeeBlue) forState:UIControlStateSelected];
    [_likeButton setTitle:@"LIKED" forState:UIControlStateSelected];
    [Common addBorderTo:_likeButton withColor:kColorCoffeeBlue width:2];
    [_scrollView addSubview:_likeButton];
    
    BOOL isBagel = [_teamMember.isBagel boolValue];
    if (isBagel) {
        [_likeButton setSelected:YES];
        _likeButton.backgroundColor = UIColorRGB(kColorWhite);
    } else {
        [_likeButton setSelected:NO];
        _likeButton.backgroundColor = UIColorRGB(kColorCoffeeBlue);
    }
    
    _detailView = [DetailInfoView new];
    _detailView.teamMember = _teamMember;
    _detailView.alpha = 0;
    [_scrollView addSubview:_detailView];
    
    _bioTextView = [UITextView textViewWithText:_teamMember.bio withFontSize:20 inView:_scrollView];
    
    _footerView = [UIImageView new];
    _footerView.clipsToBounds = YES;
    _footerView.image = [UIImage imageNamed:@"CBfooter"];
    _footerView.contentMode = UIViewContentModeScaleAspectFill;
    [_scrollView addSubview:_footerView];
    
    _dismissButton = [UIButton new];
    [_dismissButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setImage:[UIImage imageNamed:@"dismiss"] forState:UIControlStateNormal];
    _dismissButton.alpha = 0;
    [self.view addSubview:_dismissButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _dismissButton.alpha =
    _bioTextView.alpha =
    _footerView.alpha =
    _likeButton.alpha =
    _detailView.alpha = 0;

    [UIView animateWithDuration:1 animations:^{
        _dismissButton.alpha =
        _bioTextView.alpha =
        _footerView.alpha =
        _likeButton.alpha =
        _detailView.alpha = 1;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = _dismissButton.frame;
    frame.size.height = (IS_IPHONE)? kGeomButtonSize: kGeomButtonSizeBig;
    frame.size.width = (IS_IPHONE)? kGeomButtonSize: kGeomButtonSizeBig;
    frame.origin.x = kGeomSpace;
    frame.origin.y = kGeomSpace + [UIApplication sharedApplication].statusBarFrame.size.height;
    _dismissButton.frame = frame;
    
    frame = _scrollView.frame;
    frame.origin.x = CGRectGetMinX(self.view.frame);
    frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
    frame.size.width = width(self.view);
    frame.size.height = height(self.view);
    _scrollView.frame = frame;
    
    frame = _avatarView.frame;
    frame.size.height = width(self.view) * ((IS_IPHONE)? 0.6:0.5);
    frame.size.width = width(self.view);
    frame.origin.x = 0;
    frame.origin.y = 0;
    _avatarView.frame = frame;
    
    frame = _likeButton.frame;
    frame.size.height = (IS_IPHONE)? kGeomLikeButtonHeight:kGeomLikeButtonHeightIpad;
    frame.size.width = width(self.view) * 0.5;
    frame.origin.y = CGRectGetMaxY(_avatarView.frame) + ((IS_IPHONE)? kGeomPaddingBig:kGeomPaddingIpad);
    frame.origin.x = (width(self.view) - frame.size.width) /2;
    _likeButton.frame = frame;
    
    frame = _detailView.frame;
    frame.size.height = (IS_IPHONE)? kGeomDetailViewHeight:kGeomDetailViewHeightIpad;
    frame.size.width = width(self.view);
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(_likeButton.frame);
    _detailView.frame = frame;
    
    [UITextView textViewDidChange:_bioTextView inView:self.view addTOriginY:_detailView.frame];
    
    frame = _footerView.frame;
    frame.size.height = kGeomFooterHeight;
    frame.size.width = width(self.view);
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(_bioTextView.frame) + kGeomPaddingBig;
    _footerView.frame = frame;
    
    _scrollView.contentSize = CGSizeMake(width(self.view), CGRectGetMaxY(_footerView.frame) + kGeomPaddingBig);

}

- (void)zoom:(UIGestureRecognizer *)gestureRecognizer {
    
    AvatarViewController *vc = [[AvatarViewController alloc] init];
    vc.teamMember = _teamMember;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    vc.transitioningDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)like:(id)sender {
    
    BOOL isFavorite = [self.teamMember.isBagel boolValue];
    if (!isFavorite) {
        [self.likeButton setSelected:YES];
        _likeButton.backgroundColor = UIColorRGB(kColorWhite);
        [self changingIsFavoriteToTrue];
    } else {
        [self.likeButton setSelected:NO];
        _likeButton.backgroundColor = UIColorRGB(kColorCoffeeBlue);
        [self changingIsFavoriteToFalse];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationLiked
                                                        object:self];
}

- (void)changingIsFavoriteToTrue {
    
    BOOL myBool = YES;
    self.teamMember.isBagel = [NSNumber numberWithBool:myBool];
    
    CBCoredataStack *coreDataStack = [CBCoredataStack defaultStack];
    [coreDataStack saveContext];
    
    __weak DetailViewController *weakSelf = self;
    UIAlertController *alertSaved = [UIAlertController alertControllerWithTitle:@"test" message:@"test" preferredStyle:UIAlertControllerStyleAlert];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf presentViewController:alertSaved animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertSaved dismissViewControllerAnimated:YES completion:nil];
        });
    });
}

- (void)changingIsFavoriteToFalse {
    
    BOOL myBool = NO;
    self.teamMember.isBagel = [NSNumber numberWithBool:myBool];
    CBCoredataStack *coreDataStack = [CBCoredataStack defaultStack];
    [coreDataStack saveContext];
}









@end
