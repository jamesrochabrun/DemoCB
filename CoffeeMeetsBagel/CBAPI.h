//
//  CBAPI.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBAPI : NSObject
+ (void)getDataFromPathWithSucces:(void (^)(id responseObject))success;
@end
