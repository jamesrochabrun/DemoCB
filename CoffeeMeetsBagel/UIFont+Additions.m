//
//  UIFont+Additions.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UIFont+Additions.h"
#import "CommonUI.h"

@implementation UIFont (Additions)

+ (UIFont *)lightFont:(int)size {
    return [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:(IS_IPHONE)? size:size*2];
}

+ (UIFont*)regularFont:(int)size {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:(IS_IPHONE)? size:size*2];
}

+ (UIFont*)mediumFont:(int)size {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:(IS_IPHONE)? size:size*2];
}

@end
