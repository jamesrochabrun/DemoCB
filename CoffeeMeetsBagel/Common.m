//
//  Common.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "Common.h"

NSString * parseStringOrNullFromServer (id object) {
    
    if  (object && [object isKindOfClass:[NSString class]]) {
        return  (NSString *)object;
    }
    return nil;
}

@implementation Common

@end
