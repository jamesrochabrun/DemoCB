//
//  UITextView+Additions.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/18/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "UITextView+Additions.h"
#import "CommonUI.h"
#import "Common.h"
#import "UIFont+Additions.h"

@implementation UITextView (Additions)

+ (UITextView *)textViewWithText:(NSString *)text withFontSize:(int)size inView:(UIView *)view {
    
    UITextView *textView = [UITextView new];
    textView.scrollEnabled = NO;
    textView.backgroundColor = [UIColor clearColor];
    textView.font = [UIFont regularFont:kGeomH3Size];
    textView.textColor = UIColorRGB(kColorText);
    textView.userInteractionEnabled = NO;
    textView.editable = NO;
    textView.text = text;
    [view addSubview:textView];
    return textView;
    
}

+ (void)textViewDidChange:(UITextView *)textView inView:(UIView *)view addTOriginY:(CGRect)rect {
    
    CGFloat fixedWidth = width(view) * 0.8;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    newFrame.origin.x = (width(view) - fixedWidth) /2;
    newFrame.origin.y = CGRectGetMaxY(rect) + ((IS_IPHONE)? kGeomPaddingMedium:kGeomPaddingIpad);
    textView.frame = newFrame;
}


@end
