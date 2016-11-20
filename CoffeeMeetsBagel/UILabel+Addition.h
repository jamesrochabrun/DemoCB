//
//  UILabel+Addition.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Addition)
+ (UILabel *)labelWithRect:(CGRect)rect withFont:(UIFont *)font withText:(NSString *)text inView:(UIView *)view ;
+ (UILabel *)labelWithText:(NSString *)text withFont:(UIFont *)font inView:(UIView *)view;
@end
