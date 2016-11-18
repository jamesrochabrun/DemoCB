//
//  GridCollectionViewCell.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBTeamMember;
@interface GridCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;
- (void)configureCellWithTeamData:(CBTeamMember *)teamMember;

@end
