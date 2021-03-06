//
//  Common.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Common.h"
#import <CoreImage/CoreImage.h>
#import "CommonUI.h"


NSString * parseStringOrNullFromServer (id object) {
    
    if  (object && [object isKindOfClass:[NSString class]]) {
        return  (NSString *)object;
    }
    return nil;
}


@implementation Common

+ (void)addBorderTo:(UIView *)view withColor:(NSUInteger)color width:(CGFloat)width {
    
    if (!color) {
        color = kColorCoffeeBlue;
    }
    view.layer.borderColor = UIColorRGBA(color).CGColor;
    view.layer.borderWidth = (IS_IPHONE)? width: width * 3;
}

+ (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}





@end
