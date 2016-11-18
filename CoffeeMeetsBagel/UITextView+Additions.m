//
//  UITextView+Additions.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UITextView+Additions.h"

@implementation UITextView (Additions)

+ (UITextView *)textViewWithText:(NSString *)text withFontSize:(int)size inView:(UIView *)view {
    
    UITextView *textView = [UITextView new];
    textView.scrollEnabled = NO;
   // _textView.font = [UIFont regularFont:14];
    //textView.textColor = [UIColor customTextColor];
    textView.userInteractionEnabled = NO;
    textView.text = text;
    [view addSubview:textView];
    return textView;
    
}


@end
