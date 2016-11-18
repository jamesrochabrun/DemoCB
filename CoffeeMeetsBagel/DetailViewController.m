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


@interface DetailViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *dismissButton;
@property (nonatomic, strong) UIView *triangleView;
@property (nonatomic, strong) CBAvatarView *avatarView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [UIScrollView new];
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.showsVerticalScrollIndicator = NO;
    
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
    _avatarView.backgroundColor = [UIColor grayColor];
    [_scrollView addSubview:_avatarView];
    
    _dismissButton = [UIButton new];
    [_dismissButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchUpInside];
    [_dismissButton setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:_dismissButton];
    
    [self displayContent:_teamMember];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    _avatarView.alpha = 0;
//    _avatarView.transform = CGAffineTransformMakeScale(0,0);
//
//    [UIView animateWithDuration:1 animations:^{
//        _avatarView.alpha = 1;
//        _avatarView.transform = CGAffineTransformMakeScale(1,1);
//    }];
}

- (void)displayContent:(CBTeamMember *)teamMember {
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGRect frame = _dismissButton.frame;
    frame.size.height = kGeomButtonSize;
    frame.size.width = kGeomButtonSize;
    frame.origin.x = 20;
    frame.origin.y = 20;
    _dismissButton.frame = frame;
    
    frame = _scrollView.frame;
    frame.origin.x = CGRectGetMinX(self.view.frame);
    frame.origin.y = 20;
    frame.size.width = width(self.view);
    frame.size.height = height(self.view);
    _scrollView.frame = frame;
    
    frame = _avatarView.frame;
    frame.size.height = width(self.view) * 0.6;
    frame.size.width = width(self.view);
    frame.origin.x = 0;//(width(self.view) - frame.size.width) /2;
    frame.origin.y = 0;
    _avatarView.frame = frame;
    
    frame = _triangleView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    frame.size.height = height(self.view);
    frame.size.width = width(self.view);
    _triangleView.frame = frame;

}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
