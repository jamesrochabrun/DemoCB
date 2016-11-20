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
        [_coffeeButton setImage:[UIImage imageNamed:@"teamSelected.png"] forState:UIControlStateSelected];
        [_coffeeButton setImage:[UIImage imageNamed:@"team.png"] forState:UIControlStateNormal];        _coffeeBarButton = [[UIBarButtonItem alloc] initWithCustomView:_coffeeButton];
        
        _bagelButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kGeomToolBarButtonSize, kGeomToolBarButtonSize)];
        [_bagelButton addTarget:self action:@selector(goToFavorites) forControlEvents:UIControlEventTouchUpInside];
        [_bagelButton setImage:[UIImage imageNamed:@"loveSelected.png"] forState:UIControlStateSelected];
        [_bagelButton setImage:[UIImage imageNamed:@"love.png"] forState:UIControlStateNormal];
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
    [self.del goToHome];
    [_coffeeButton setSelected:YES];
    [_bagelButton setSelected:NO];
}

- (void)goToFavorites {
    
    [self.del goToFavorites];
    [_bagelButton setSelected:YES];
    [_coffeeButton setSelected:NO];
}

@end
