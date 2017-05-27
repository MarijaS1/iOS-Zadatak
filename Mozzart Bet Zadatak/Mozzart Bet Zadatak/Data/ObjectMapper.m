//
//  ObjectMapper.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ObjectMapper.h"
#import "MetaData.h"
#import "MatchTeam.h"
#import "Score.h"
#import "ScoreGoals.h"
#import "Cards.h"
#import "CardData.h"
#import "Livescores.h"
#import "LivescoreResponse.h"
#import "Goals.h"
#import "TeamData.h"
#import "MozzartError.h"


@implementation ObjectMapper

+ (RKObjectMapping *)mapResponseWithObjectMapping:(RKObjectMapping *)objectMapping
                              andWithPropertyName:(NSString *)propertyName {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
    RKObjectMapping *metaDataMapping = [ObjectMapper mapMetaData];
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"metaData"
                                                                                    toKeyPath:@"metaData"
                                                                                  withMapping:metaDataMapping]];
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:propertyName
                                                                                    toKeyPath:propertyName
                                                                                  withMapping:objectMapping]];
    
    return responseMapping;
}

+ (RKObjectMapping *)mapResponseWithObjectMappings:(NSArray *)objectMappings
                              andWithPropertyNames:(NSArray *)propertyNames {
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
    RKObjectMapping *dataMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
    RKObjectMapping *metaDataMapping = [ObjectMapper mapMetaData];
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"meta"
                                                                                    toKeyPath:@"meta"
                                                                                  withMapping:metaDataMapping]];
    [responseMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"response"
                                                                                    toKeyPath:@"response"
                                                                                  withMapping:dataMapping]];
    if (objectMappings.count == propertyNames.count) {
        for (int i = 0; i < objectMappings.count; i++) {
            RKObjectMapping *mapping = [objectMappings objectAtIndex:i];
            NSString *property = [propertyNames objectAtIndex:i];
            [dataMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:property
                                                                                        toKeyPath:property
                                                                                      withMapping:mapping]];
        }
    }
    
    return responseMapping;
}

+ (RKObjectMapping *)mapError {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[MozzartError class]];
    [objectMapping addAttributeMappingsFromArray:@[@"code", @"codeMessage"]];
    
    return objectMapping;
}

+ (RKObjectMapping *)mapMetaData {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[MetaData class]];
    [objectMapping addAttributeMappingsFromArray:@[@"code", @"message", @"totalResults", @"offset", @"limit", @"prev", @"next"]];
    
    return objectMapping;
}


+ (RKObjectMapping *)mapMatchTeam{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[MatchTeam class]];
    [objectMapping addAttributeMappingsFromArray:@[@"team_id", @"name"]];
    
    return objectMapping;
}

+ (RKObjectMapping *)mapTeamData{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[TeamData class]];
    [objectMapping addAttributeMappingsFromArray:@[@"player", @"time", @"team", @"score"]];
    
    return objectMapping;
}


+ (RKObjectMapping *)mapScoreGoals{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[ScoreGoals class]];
    [objectMapping addAttributeMappingsFromArray:@[@"home_team", @"guest_team"]];
    
    return objectMapping;
}

+ (RKObjectMapping *)mapScore{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Score class]];
    RKObjectMapping* scoreGoalsMapper = [self mapScoreGoals];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"current" mapping:scoreGoalsMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"half_time" mapping:scoreGoalsMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"normal_time" mapping:scoreGoalsMapper];
    
    return objectMapping;
}
    

+ (RKObjectMapping *)mapGoals{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Goals class]];
    RKObjectMapping* teamDataMapper = [self mapTeamData];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"guest_team" mapping:teamDataMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"home_team" mapping:teamDataMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"by_time" mapping:teamDataMapper];
    
    return objectMapping;
}

+ (RKObjectMapping *)mapCardData{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[CardData class]];
    RKObjectMapping* teamDataMapper = [self mapTeamData];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"yellow" mapping:teamDataMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"red" mapping:teamDataMapper];
    
    return objectMapping;
}
+ (RKObjectMapping *)mapCards{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Cards class]];
    RKObjectMapping* cardDataMapper = [self mapCardData];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"home_team" mapping:cardDataMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"guest_team" mapping:cardDataMapper];
    
    return objectMapping;
}
+ (RKObjectMapping *)mapLivescores{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[Livescores class]];
    [objectMapping addAttributeMappingsFromArray:@[
                                                   @"category_id",
                                                   @"tournament_id",
                                                   @"match_id",
                                                   @"tournament_name",
                                                   @"category_name",
                                                   @"winner",
                                                   @"started",
                                                   @"period_started",
                                                   @"match_current_time",
                                                   @"match_time",
                                                   @"status",
                                                   @"status_code",
                                                   @"matchcast"]];
    
    
    
    RKObjectMapping* matchTeamMapper = [self mapMatchTeam];

    [objectMapping addRelationshipMappingWithSourceKeyPath:@"home_team" mapping:matchTeamMapper];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"guest_team" mapping:matchTeamMapper];
    
    RKObjectMapping* scoreMapper = [self mapScore];
//    [objectMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"score" toKeyPath:@"score" withMapping:scoreMapper]];
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"score" mapping:scoreMapper];
    
    RKObjectMapping* goalsMapper = [self mapGoals];
    [objectMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"goals" toKeyPath:@"goals" withMapping:goalsMapper]];
//    [objectMapping addRelationshipMappingWithSourceKeyPath:@"goals" mapping:goalsMapper];
    
    RKObjectMapping* cardsMapper = [self mapCards];
     [objectMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"cards" toKeyPath:@"cards" withMapping:cardsMapper]];
//    [objectMapping addRelationshipMappingWithSourceKeyPath:@"cards" mapping:cardsMapper];
    
 return objectMapping;
}

+ (RKObjectMapping *)mapLivescoreResponse{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[LivescoreResponse class]];
    [objectMapping addAttributeMappingsFromArray:@[@"delta"]];
    
    RKObjectMapping* livescoresMapper = [self mapLivescores];
    
    [objectMapping addRelationshipMappingWithSourceKeyPath:@"livescores" mapping:livescoresMapper];
    
    return objectMapping;
}



@end
