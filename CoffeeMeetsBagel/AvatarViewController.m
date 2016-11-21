//
//  AvatarViewController.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/19/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "AvatarViewController.h"
#import "UIImageView+AFNetworking.h"
#import "CBTeamMember.h"
#import "Common.h"
#import "CommonUI.h"

@interface AvatarViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UIButton *dismissButton;
@end

@implementation AvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _scrollView = [UIScrollView new];
    _scrollView.bouncesZoom = YES;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [_scrollView setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:_scrollView];
    
    _avatarImageView = [UIImageView new];
    _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.userInteractionEnabled = YES;
    [_scrollView addSubview:_avatarImageView];
    
    UISwipeGestureRecognizer *swipeGestureUP = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeGestureUP.direction = UISwipeGestureRecognizerDirectionUp;
    [_avatarImageView addGestureRecognizer:swipeGestureUP];
    
    UISwipeGestureRecognizer *swipeGestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeGestureDown.direction = UISwipeGestureRecognizerDirectionDown;
    [_avatarImageView addGestureRecognizer:swipeGestureDown];
    
    _dismissButton = [UIButton new];
    [_dismissButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setImage:[UIImage imageNamed:@"dismiss"] forState:UIControlStateNormal];
    _dismissButton.alpha = 0;
    [self.view addSubview:_dismissButton];
    
}

- (void)setTeamMember:(CBTeamMember *)teamMember {
    _teamMember = teamMember;
    
    NSURL *urlStr = [NSURL URLWithString:teamMember.avatar];
    __weak AvatarViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.avatarImageView setImageWithURL:urlStr placeholderImage:[UIImage imageNamed:@"CBLogo.png"]];
    });
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
    frame.origin.x = kGeomMinX;
    frame.origin.y = [UIApplication sharedApplication].statusBarFrame.size.height;
    frame.size.height = height(self.view) - frame.origin.y;
    frame.size.width = width(self.view);
    _scrollView.frame = frame;
    
    frame = _avatarImageView.frame;
    frame.size.width = width(self.view);
    frame.size.height = frame.size.width;
    frame.origin.x = kGeomMinX;
    frame.origin.y = (height(_scrollView) - frame.size.height) /2;
    _avatarImageView.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    _dismissButton.alpha =
    _avatarImageView.alpha = 0;
    [UIView animateWithDuration:0.75 animations:^{
        _dismissButton.alpha =
        _avatarImageView.alpha = 1;
    }];
}

- (void)didSwipe:(UISwipeGestureRecognizer *)gesture {
    
    if (gesture.direction == UISwipeGestureRecognizerDirectionUp) {
        [UIView animateWithDuration:0.4 animations:^{
            
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0,-200);
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            _avatarImageView.transform = transform;
            _avatarImageView.alpha = 0;
            _dismissButton.alpha = 0;
            
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    } else if (gesture.direction == UISwipeGestureRecognizerDirectionDown) {
    
        [UIView animateWithDuration:0.4 animations:^{
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0, 200);
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            _avatarImageView.transform = transform;
            _avatarImageView.alpha = 0;
            _dismissButton.alpha = 0;

        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}







@end
