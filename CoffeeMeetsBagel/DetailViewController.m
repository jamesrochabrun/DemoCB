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

@interface DetailViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *dismissButton;
@property (nonatomic, strong) UIView *triangleView;
@property (nonatomic, strong) CBAvatarView *avatarView;
@property (nonatomic, strong) DetailInfoView *detailView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITextView *bioTextView;
@property (nonatomic, strong) UIImageView *footerView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [UIScrollView new];
    _scrollView.delegate = self;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.scrollEnabled = YES;
    [self.view addSubview:_scrollView];
    //_scrollView.backgroundColor = UIColorRGB(kColorCoffeeBlue);
    
    _triangleView = [UIView new];
   // _triangleView.backgroundColor  = UIColorRGkColorCoffeeRedRed);
    [self.view addSubview:_triangleView];
    
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:(CGPoint){CGRectGetMaxX(self.view.frame), 0}];
    [path addLineToPoint:(CGPoint){0, CGRectGetMaxY(self.view.frame)}];
    [path addLineToPoint:(CGPoint){CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame)}];
    [path addLineToPoint:(CGPoint){CGRectGetMaxX(self.view.frame), 0}];
    
    // Create a CAShapeLayer with this triangular path
    // Same size as the original imageView
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = _triangleView.bounds;
    mask.path = path.CGPath;
    
    // Mask the imageView's layer with this shape
    _triangleView.layer.mask = mask;

    _avatarView = [CBAvatarView new];
    _avatarView.teamMember = _teamMember;
    [_scrollView addSubview:_avatarView];
    
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
    _detailView.alpha = 0;

    [UIView animateWithDuration:1 animations:^{
        _dismissButton.alpha =
        _bioTextView.alpha =
        _footerView.alpha =
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
    frame.origin.y = kGeomSpace;
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
    
    frame = _detailView.frame;
    frame.size.height = (IS_IPHONE)? 100:200;
    frame.size.width = width(self.view);
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(_avatarView.frame);
    _detailView.frame = frame;
    
    [UITextView textViewDidChange:_bioTextView inView:self.view addTOriginY:_detailView.frame];
    
    frame = _footerView.frame;
    frame.size.height = 150;
    frame.size.width = width(self.view);
    frame.origin.x = 0;
    frame.origin.y = CGRectGetMaxY(_bioTextView.frame) + kGeomPaddingBig;
    _footerView.frame = frame;
    
    _scrollView.contentSize = CGSizeMake(width(self.view), CGRectGetMaxY(_footerView.frame) + 200);


}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
