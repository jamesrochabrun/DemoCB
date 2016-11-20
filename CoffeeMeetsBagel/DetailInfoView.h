//
//  DetailInfoView.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBTeamMember;
@interface DetailInfoView : UIView
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UITextView *bioTextView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) CBTeamMember *teamMember;

@end
