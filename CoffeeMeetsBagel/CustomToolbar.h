//
//  CustomToolbar.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomToolBarDelegate

- (void)goToFavorites;
- (void)goToHome;

@end

@interface CustomToolbar : UIToolbar
@property (nonatomic, strong) UIButton *coffeeButton;
@property (nonatomic, strong) UIButton *bagelButton;
@property (nonatomic, strong) UIBarButtonItem *coffeeBarButton;
@property (nonatomic, strong) UIBarButtonItem *bagelBarButton;
@property (nonatomic, strong) UIBarButtonItem *spacer;
@property (nonatomic, weak) id<CustomToolBarDelegate>del;
@property (nonatomic, assign) BOOL favoritesSelected;


@end
