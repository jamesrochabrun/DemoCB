//
//  UIButton+Additions.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/20/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Additions)
+ (UIButton *)buttonWithText:(NSString *)text withTitleColor:(NSInteger)color withFont:(UIFont *)font target:(id)target action:(SEL)selector inView:(UIView *)view;

@end
