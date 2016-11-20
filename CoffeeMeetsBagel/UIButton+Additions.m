//
//  UIButton+Additions.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/20/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UIButton+Additions.h"
#import "CommonUI.h"

@implementation UIButton (Additions)
+ (UIButton *)buttonWithText:(NSString *)text withTitleColor:(NSInteger)color withFont:(UIFont *)font target:(id)target action:(SEL)selector inView:(UIView *)view {
    
    UIButton *button = [UIButton new];
    [button addTarget:target  action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:text forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitleColor:UIColorRGB(color) forState:UIControlStateNormal];
    return button;
}
@end
