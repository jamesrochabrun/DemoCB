//
//  SectionReusableView.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/19/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "SectionReusableView.h"
#import "Common.h"
#import "CommonUI.h"
#import "UILabel+Addition.h"
#import "UIFont+Additions.h"

@implementation SectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        _label = [UILabel labelWithRect:frame withFont:[UIFont regularFont:kGeomH1Size] withText:@"" inView:self];
        [self addSubview:_label];
    }
    return self;
}


- (void)configureHeaderWithTitle:(NSString *)title {
    _label.text = title;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [_label sizeToFit];
    CGRect frame = _label.frame;
    frame.origin.x = (width(self) - width(_label)) /2;
    frame.origin.y = (height(self) - height(_label)) /2;
    _label.frame = frame;
}

@end
