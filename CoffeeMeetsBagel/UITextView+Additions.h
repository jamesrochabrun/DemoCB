//
//  UITextView+Additions.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Additions)
+ (UITextView *)textViewWithText:(NSString *)text withFontSize:(int)size inView:(UIView *)view;
@end
