//
//  CommonUI.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AppDelegate;
// Convenience Macros
#define UIColorRGB(rgbValue) [UIColor colorWithRed:(255&(rgbValue>> 16))/255.0f \
green:(255&(rgbValue >> 8))/255.0 \
blue:(255&rgbValue)/255.0 alpha:1.0]

#define UIColorRGBA(rgbValue) [UIColor colorWithRed:(255&(rgbValue>> 16))/255.0f \
green:(255&(rgbValue >> 8))/255.0f \
blue:(255&rgbValue)/255.0f \
alpha:(rgbValue >> 24)/255.0f]

#define UIColorRGBOverlay(rgbValue, alphaValue) [UIColor colorWithRed:(255&(rgbValue>> 16))/255.0f \
green:(255&(rgbValue >> 8))/255.0f \
blue:(255&rgbValue)/255.0f \
alpha:alphaValue]

#define IS_IPHONE4  ( [UIScreen  mainScreen].bounds.size.height <= 480)

//KGeomValues
static CGFloat kGeomToolBarButtonSize = 40.0;
static CGFloat kGeomHeightToolBar = 49.0;
static CGFloat kGeomButtonSize = 40.0;
//horizontal
static CGFloat kGeomMinimunInterCellSpacing = 4.0;
//vertical

//KConstants
extern NSString *const kReuseIdentifierGridCell;
extern NSString *const kTeamMember;
extern NSString *const kTeamMember;
extern NSString *const kMemberfirstName;
extern NSString *const kMemberLastName;
extern NSString *const kMemberBio;
extern NSString *const kMemberID;
extern NSString *const kMemberAvatar;
extern NSString *const kMemberTitle;
extern NSString *const kFileName;
extern NSString *const kTypeFile;




