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
+ (RKObjectMapping *)mapMetaData;


@end
