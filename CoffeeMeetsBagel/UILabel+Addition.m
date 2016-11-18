//
//  UILabel+Addition.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UILabel+Addition.h"

@implementation UILabel (Addition)

+ (UILabel *)labelWithText:(NSString *)text withSize:(int)size inView:(UIView *)view {
    
    UILabel *label = [UILabel new];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    //[label setFont:[UIFont regularFont:size]];
    [label setTextColor:[UIColor whiteColor]];
    label.text = text;
    [view addSubview:label];
    return label;
}

@end
