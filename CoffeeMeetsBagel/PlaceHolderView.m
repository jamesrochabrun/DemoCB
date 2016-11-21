//
//  PlaceHolderView.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/20/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "PlaceHolderView.h"
#import "UILabel+Addition.h"
#import "Common.h"
#import "CommonUI.h"
#import "UIFont+Additions.h"

@implementation PlaceHolderView

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorRGB(kColorWhite);
        _imageView = [UIImageView new];
        _imageView.clipsToBounds = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.image = [UIImage imageNamed:@"CBLogo.png"];
        [self addSubview:_imageView];
        
        _label = [UILabel labelWithText:@"No favorites selected" withFont:[UIFont lightFont:kGeomH1Size] inView:self]
        ;
        [self addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect frame = _imageView.frame;
    frame.size.width = width(self) * 0.7;
    frame.size.height = frame.size.width;
    frame.origin.x = (width(self) - frame.size.width) /2;
    frame.origin.y = (height(self) - frame.size.height) /2;
    _imageView.frame = frame;
    
    [_label sizeToFit];
    frame = _label.frame;
    frame.origin.x = (width(self) - width(_label)) /2;
    frame.origin.y = CGRectGetMaxY(_imageView.frame) + kGeomPaddingBig;
    _label.frame = frame;
    
}








@end
