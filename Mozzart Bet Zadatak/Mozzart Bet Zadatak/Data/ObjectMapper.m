//
//  ObjectMapper.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ObjectMapper.h"
#import "MetaData.h"


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

+ (RKObjectMapping *)mapMetaData {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[MetaData class]];
    [objectMapping addAttributeMappingsFromArray:@[@"code", @"message", @"totalResults", @"offset", @"limit", @"prev", @"next"]];
    
    return objectMapping;
}


@end
