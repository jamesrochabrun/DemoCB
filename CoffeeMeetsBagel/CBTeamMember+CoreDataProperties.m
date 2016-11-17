//
//  CBTeamMember+CoreDataProperties.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CBTeamMember+CoreDataProperties.h"

@implementation CBTeamMember (CoreDataProperties)

+ (NSFetchRequest<CBTeamMember *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"CBTeamMember"];
}

@dynamic title;
@dynamic bio;
@dynamic firstName;
@dynamic lastName;
@dynamic avatar;
@dynamic teamID;

- (NSString *)sectionName {
    
    NSString *str = @"section";
    return str;
}

@end
