//
//  CBAvatarView.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CBAvatarView.h"
#import "Common.h"
#import "CommonUI.h"
#import "CBTeamMember.h"
#import "UIImageView+AFNetworking.h"


@implementation CBAvatarView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        _backgroundWall = [UIImageView new];
        _backgroundWall.layer.masksToBounds = YES;
        _backgroundWall.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_backgroundWall];
        
        _overLay = [UIView new];
        _overLay.backgroundColor = UIColorRGBOverlay(kColorGrayLight, 0.7);
        [self addSubview:_overLay];
        
        _avatarImageview = [UIImageView new];
        _avatarImageview.layer.masksToBounds = YES;
        _avatarImageview.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageview.clipsToBounds = YES;
        _avatarImageview.userInteractionEnabled = YES;
        _avatarImageview.backgroundColor = UIColorRGB(kColorWhite);
    
        //[Common addBorderTo:_avatarImageview withColor:kColorCoffeePink width:2];
        [self addSubview:_avatarImageview];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        [tap setNumberOfTapsRequired:1];
        
        //Adding gesture recognizer
        [_avatarImageview addGestureRecognizer:tap];
        
        _likeIndicatorImageView = [UIImageView new];
        _likeIndicatorImageView.layer.masksToBounds = YES;
        _likeIndicatorImageView.contentMode = UIViewContentModeScaleAspectFit;
        _likeIndicatorImageView.clipsToBounds = YES;
        _likeIndicatorImageView.userInteractionEnabled = YES;
        [self addSubview:_likeIndicatorImageView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(teamMemberDidLiked:)
                                                     name:kNotificationLiked
                                                   object:nil];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = _backgroundWall.frame;
    frame.size.height = height(self);
    frame.size.width = width(self);
    frame.origin.x = 0;
    frame.origin.y = 0;
    _backgroundWall.frame = frame;
    _overLay.frame = _backgroundWall.frame;
    
    //change the multiplier to adjust the size dinamically
    CGFloat avatarSize = height(self) * 0.8;
    
    frame = _avatarImageview.frame;
    frame.size.height = avatarSize;
    frame.size.width = avatarSize;
    frame.origin.x = (width(self) - frame.size.width) /2;
    frame.origin.y = (height(self) - frame.size.height) /2;
    _avatarImageview.frame = frame;
    _avatarImageview.layer.cornerRadius = frame.size.width / 2;
    
    frame = _likeIndicatorImageView.frame;
    frame.size.height = height(_avatarImageview) * 0.3;
    frame.size.width = width(_avatarImageview) * 0.3;
    frame.origin.x = CGRectGetMaxX(_avatarImageview.frame) - frame.size.width;
    frame.origin.y = CGRectGetMaxY(_avatarImageview.frame) - frame.size.height;
    _likeIndicatorImageView.frame = frame;
    _likeIndicatorImageView.layer.cornerRadius = frame.size.width / 2;
    
    [self performAnimation];
}

- (void)setTeamMember:(CBTeamMember *)teamMember {
    
    _teamMember = teamMember;
    
    __weak CBAvatarView *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL *urlStr = [NSURL URLWithString:_teamMember.avatar];
        [weakSelf.avatarImageview setImageWithURL:urlStr placeholderImage:[UIImage imageNamed:@"CBLogo.png"]];
        weakSelf.backgroundWall.image = [UIImage imageNamed:@"wall.png"];
        
        _isBagel = [_teamMember.isBagel boolValue];
        if (_isBagel) {
             [_likeIndicatorImageView setImage:[UIImage imageNamed:@"loveSelected.png"]];
            _likeIndicatorImageView.hidden = NO;
        } else {
            _likeIndicatorImageView.hidden = YES;
        }
    });
}

- (void)performAnimation {
    
    _avatarImageview.transform = CGAffineTransformMakeScale(0,0);
    _likeIndicatorImageView.transform = CGAffineTransformMakeScale(0,0);
    
    [UIView animateWithDuration:0.7 animations:^{
        _avatarImageview.alpha = 1;
        _avatarImageview.transform = CGAffineTransformMakeScale(1,1);
    }];
    
    [UIView animateWithDuration:0.7 animations:^{
        _likeIndicatorImageView.alpha = 1;
        _likeIndicatorImageView.transform = CGAffineTransformMakeScale(1,1);
    }];
}

- (void)handleDoubleTap:(UIGestureRecognizer *)sender {
    [self.delegate zoom:sender];
}

- (void)teamMemberDidLiked:(NSNotification *)notification {
    
    _isBagel = [_teamMember.isBagel boolValue];

    if (_isBagel) {
        [_likeIndicatorImageView setImage:[UIImage imageNamed:@"loveSelected.png"]];
        _likeIndicatorImageView.hidden = NO;
    } else {
        _likeIndicatorImageView.hidden = YES;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationLiked object:nil];
}






@end
