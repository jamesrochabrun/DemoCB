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
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor blackColor];
    //_scrollView.clipsToBounds = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    float minimumScale = 1.0;//This is the minimum scale, set it to whatever you want. 1.0 = default
    _scrollView.maximumZoomScale = 3.0;
    _scrollView.minimumZoomScale = minimumScale;
    _scrollView.zoomScale = minimumScale;
    [_scrollView setContentMode:UIViewContentModeScaleAspectFit];
    _scrollView.decelerationRate = UIScrollViewDecelerationRateFast;
    [self.view addSubview:_scrollView];
    
    _avatarImageView = [UIImageView new];
    _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    _avatarImageView.clipsToBounds = YES;
    _avatarImageView.userInteractionEnabled = YES;
    _avatarImageView.autoresizingMask = ( UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin);
    [_scrollView addSubview:_avatarImageView];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    
    [doubleTap setNumberOfTapsRequired:2];
    [_avatarImageView addGestureRecognizer:doubleTap];
    
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
        [weakSelf.avatarImageView setImageWithURL:urlStr placeholderImage:[UIImage imageNamed:@""]];
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

- (void)handleDoubleTap:(UIGestureRecognizer *)gestureRecognizer {
    float newScale = [_scrollView zoomScale] * 1.3;//ZOOM_STEP;
    

    if (newScale > self.scrollView.maximumZoomScale){
        newScale = self.scrollView.minimumZoomScale;
        CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
        
        [_scrollView zoomToRect:zoomRect animated:YES];
    }
    else{    // zoom in

        newScale = self.scrollView.maximumZoomScale;
        CGRect zoomRect = [self zoomRectForScale:newScale withCenter:[gestureRecognizer locationInView:gestureRecognizer.view]];
        [_scrollView zoomToRect:zoomRect animated:YES];
    }
}

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates.
    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [_scrollView frame].size.height / scale;
    zoomRect.size.width  = [_scrollView frame].size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y = _scrollView.frame.origin.y;//center.y - (zoomRect.size.height / 2.0);
    return zoomRect;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _avatarImageView;
}


@end
