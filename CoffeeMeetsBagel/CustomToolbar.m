//
//  CustomToolbar.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CustomToolbar.h"
#import "CommonUI.h"


@implementation CustomToolbar

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
        [self setBarTintColor:[UIColor whiteColor]];
        
        _coffeeButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kGeomToolBarButtonSize, kGeomToolBarButtonSize)];
        [_coffeeButton addTarget:self action:@selector(goToHome) forControlEvents:UIControlEventTouchUpInside];
        _coffeeButton.backgroundColor = [UIColor greenColor];
        _coffeeBarButton = [[UIBarButtonItem alloc] initWithCustomView:_coffeeButton];
        
        _bagelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kGeomToolBarButtonSize, kGeomToolBarButtonSize)];
        [_bagelButton addTarget:self action:@selector(goToFavorites) forControlEvents:UIControlEventTouchUpInside];
        _bagelButton.backgroundColor = [UIColor redColor];
        _bagelBarButton = [[UIBarButtonItem alloc] initWithCustomView:_bagelButton];

        _spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        NSArray *buttonItems = [NSArray arrayWithObjects:_spacer, _coffeeBarButton, _spacer, _bagelBarButton, _spacer, nil];
        [self setItems:buttonItems];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGRect frame = self.frame;
    frame.origin.x = 0;
    frame.origin.y =  [[UIScreen mainScreen] bounds].size.height - kGeomHeightToolBar;
    frame.size.width = [[UIScreen mainScreen] bounds].size.width;
    frame.size.height = kGeomHeightToolBar;
    self.frame = frame;
}

- (void)goToHome {
    
}

- (void)goToFavorites {
    
}

@end
