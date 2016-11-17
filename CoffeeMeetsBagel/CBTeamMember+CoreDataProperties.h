//
//  CBTeamMember+CoreDataProperties.h
//  CoffeeMeetsBagel
//
//  Created by James Rochabrun on 11/17/16.
//  Copyright © 2016 James Rochabrun. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "CBTeamMember.h"


NS_ASSUME_NONNULL_BEGIN

@interface CBTeamMember (CoreDataProperties)

+ (NSFetchRequest<CBTeamMember *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *bio;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSString *avatar;
@property (nonatomic) int32_t teamID;

@property (nonatomic, readonly) NSString *sectionName;


@end

NS_ASSUME_NONNULL_END
