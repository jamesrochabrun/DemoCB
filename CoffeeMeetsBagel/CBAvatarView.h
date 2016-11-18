//
//  CBAvatarView.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBTeamMember;
@interface CBAvatarView : UIView
@property (nonatomic, strong) UIImageView *avatarImageview;
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIImageView *backgroundWall;
@property (nonatomic, strong) UIView *overLay;
@property (nonatomic, strong) CBTeamMember *teamMember;

@end
