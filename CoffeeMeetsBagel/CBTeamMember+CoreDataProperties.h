//
//  CBTeamMember+CoreDataProperties.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CBTeamMember.h"

@class CBCoredataStack;
NS_ASSUME_NONNULL_BEGIN

@interface CBTeamMember (CoreDataProperties)

+ (NSFetchRequest<CBTeamMember *> *)fetchRequest;
+ (CBTeamMember *)memberFromDict:(NSDictionary *)memberData inCoreDataStack:(CBCoredataStack *)coreDataStack;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *bio;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSString *avatar;
@property (nullable, nonatomic, copy) NSString *teamID;
@property (nullable, nonatomic, copy) NSNumber *isBagel;

@property (nonatomic, readonly) NSString *sectionName;


@end

NS_ASSUME_NONNULL_END
