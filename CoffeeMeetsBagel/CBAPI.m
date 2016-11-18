//
//  CBAPI.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//

#import "CBAPI.h"
#import "CommonUI.h"

@implementation CBAPI

+ (void)getDataFromPathWithSucces:(void (^)(id responseObject))success {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:kFileName ofType:kTypeFile];
    NSData *content = [[NSData alloc] initWithContentsOfFile:filePath];
    NSArray *json = [NSJSONSerialization JSONObjectWithData:content options:kNilOptions error:nil];
    success(json);
}

@end
