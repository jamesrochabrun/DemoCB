//
//  CBTeamMember+CoreDataProperties.m
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CBTeamMember+CoreDataProperties.h"
#import "CBTeamMember.h"
#import "CommonUI.h"
#import "CBCoredataStack.h"
#import "Common.h"

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

+ (CBTeamMember *)memberFromDict:(NSDictionary *)memberData inCoreDataStack:(CBCoredataStack *)coreDataStack {
    
    CBTeamMember *teamMember = [NSEntityDescription insertNewObjectForEntityForName:kTeamMember inManagedObjectContext:coreDataStack.managedObjectContext];
    teamMember.firstName = parseStringOrNullFromServer(memberData[kMemberfirstName]);
    teamMember.lastName = parseStringOrNullFromServer(memberData[kMemberLastName]);
    teamMember.bio = parseStringOrNullFromServer(memberData[kMemberBio]);
    teamMember.teamID = parseStringOrNullFromServer(memberData[kMemberID]);
    teamMember.avatar = parseStringOrNullFromServer(memberData[kMemberAvatar]);
    teamMember.title = parseStringOrNullFromServer(memberData[kMemberTitle]);
    return teamMember;
    
}

@end
