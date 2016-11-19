//
//  GridCollectionViewCell.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBTeamMember;
@class CBAvatarView;

@interface GridCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CBAvatarView *avatarView;
- (void)configureCellWithTeamData:(CBTeamMember *)teamMember;

@end
