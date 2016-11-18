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

#define IS_IPHONE  ( [UIScreen  mainScreen].bounds.size.height <= 750)
//Color palette
static NSUInteger kColorCoffeeBlue = 0xFF0085da;
static NSUInteger kColorCoffeeRed = 0xFFfe368e;
static NSUInteger kColorCoffeePink = 0xFFf1906f;
static const NSUInteger kColorGrayLight = 0xFFB2B2B2;
static const NSUInteger kColorGrayMiddle = 0xFF53585F;
static const NSUInteger kColorWhite = 0xFFFFFFFF;
static const NSUInteger kColorBlack = 0xFF000000;
static const NSUInteger kColorClear = 0x00000000;
static const NSUInteger kColorYellow = 0xFFffc01b;


//KGeomValues
static CGFloat kGeomToolBarButtonSize = 40.0;
static CGFloat kGeomHeightToolBar = 49.0;
static CGFloat kGeomButtonSize = 40.0;
static CGFloat kGeomButtonSizeBig = 70;
static CGFloat kGeomSpace = 25;
static CGFloat kGeomLabelHeight = 30;
static CGFloat kGeomPaddingBig = 10;
static CGFloat kGeomPaddingMedium = 7;
static CGFloat kGeomPaddingSmall = 4;
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




