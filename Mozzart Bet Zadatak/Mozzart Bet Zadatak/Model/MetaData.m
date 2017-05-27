//
//  MetaData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "MetaData.h"

@implementation MetaData

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.code = [decoder decodeInt32ForKey:@"code"];
        self.message = [decoder decodeObjectForKey:@"message"];
        self.query = [decoder decodeObjectForKey:@"query"];
        self.totalResults = [decoder decodeInt32ForKey:@"totalResults"];
        self.offset = [decoder decodeInt32ForKey:@"offset"];
        self.limit = [decoder decodeInt32ForKey:@"limit"];
        self.prev = [decoder decodeObjectForKey:@"prev"];
        self.next = [decoder decodeObjectForKey:@"next"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeInt64:self.code forKey:@"code"];
    [encoder encodeObject:self.message forKey:@"message"];
    [encoder encodeObject:self.query forKey:@"query"];
    [encoder encodeInt64:self.totalResults forKey:@"totalResults"];
    [encoder encodeInt64:self.offset forKey:@"offset"];
    [encoder encodeInt64:self.limit forKey:@"limit"];
    [encoder encodeObject:self.prev forKey:@"prev"];
    [encoder encodeObject:self.next forKey:@"next"];
}

@end
