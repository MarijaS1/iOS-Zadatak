//
//  MetaData.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MetaData : NSObject<NSCoding>

@property (nonatomic) long code;
@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *query;
@property (nonatomic) long totalResults;
@property (nonatomic) long offset;
@property (nonatomic) long limit;
@property (strong, nonatomic) NSString *prev;
@property (strong, nonatomic) NSString *next;

@end
