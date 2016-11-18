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
        //[Common addBorderTo:_avatarImageview withColor:kColorCoffeePink width:2];
        [self addSubview:_avatarImageview];
        
        _logoView = [UIImageView new];
        _logoView.layer.masksToBounds = YES;
        _logoView.contentMode = UIViewContentModeScaleAspectFit;
        [Common addBorderTo:_logoView withColor:kColorCoffeeRed width:1];
        [self addSubview:_logoView];
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
    
    frame = _logoView.frame;
    frame.size.height = height(_avatarImageview) * 0.3;
    frame.size.width = width(_avatarImageview) * 0.3;
    frame.origin.x = CGRectGetMaxX(_avatarImageview.frame) - frame.size.width;
    frame.origin.y = CGRectGetMaxY(_avatarImageview.frame) - frame.size.height;
    _logoView.frame = frame;
    _logoView.layer.cornerRadius = frame.size.width / 2;
}

- (void)setTeamMember:(CBTeamMember *)teamMember {
    
    _teamMember = teamMember;
    
    __weak CBAvatarView *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        NSURL *urlStr = [NSURL URLWithString:_teamMember.avatar];
        [weakSelf.avatarImageview setImageWithURL:urlStr placeholderImage:[UIImage imageNamed:@""]];
        weakSelf.backgroundWall.image = [UIImage imageNamed:@"wall.png"];
        weakSelf.logoView.image = [UIImage imageNamed:@"CBLogo.png"];
    });
    
}







@end