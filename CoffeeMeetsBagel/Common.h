//
//  Common.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


static inline CGFloat width(UIView *view) { return view.bounds.size.width; }
static inline CGFloat height(UIView *view) { return view.bounds.size.height; }
static inline CGFloat originY(UIView *view) {return view.frame.origin.y; }
static inline CGFloat originX(UIView *view) {return view.frame.origin.x; }

extern NSString * parseStringOrNullFromServer (id object);

@interface Common : NSObject
+ (void)addBorderTo:(UIView *)view withColor:(NSUInteger)color width:(CGFloat)width;

@end
