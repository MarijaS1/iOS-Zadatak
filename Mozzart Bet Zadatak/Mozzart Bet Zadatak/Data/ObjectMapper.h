//
//  ObjectMapper.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface ObjectMapper : NSObject

+ (RKObjectMapping *)mapResponseWithObjectMapping:(RKObjectMapping *)objectMapping
                              andWithPropertyName:(NSString *)propertyName;
+ (RKObjectMapping *)mapResponseWithObjectMappings:(NSArray *)objectMappings
                              andWithPropertyNames:(NSArray *)propertyNames;

+ (RKObjectMapping *)mapError;
+ (RKObjectMapping *)mapMatchTeam;
+ (RKObjectMapping *)mapTeamData;
+ (RKObjectMapping *)mapScore;
+ (RKObjectMapping *)mapGoals;
+ (RKObjectMapping *)mapScoreGoals;
+ (RKObjectMapping *)mapCardData;
+ (RKObjectMapping *)mapCards;
+ (RKObjectMapping *)mapLivescoreResponse;
+ (RKObjectMapping *)mapLivescores;


@end
