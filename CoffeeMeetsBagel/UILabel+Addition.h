//
//  UILabel+Addition.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Addition)
+ (UILabel *)labelWithText:(NSString *)text withSize:(int)size inView:(UIView *)view;

@end
