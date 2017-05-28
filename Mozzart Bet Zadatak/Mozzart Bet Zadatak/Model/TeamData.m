//
//  TeamData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "TeamData.h"

@implementation TeamData

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
        self.player = [decoder decodeObjectForKey:@"player"];
        self.time = [decoder decodeIntegerForKey:@"time"];
        self.team = [decoder decodeObjectForKey:@"team"];
        self.score = [decoder decodeObjectForKey:@"score"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.player forKey:@"player"];   
    [encoder encodeInteger:self.time forKey:@"time"];
    [encoder encodeObject:self.team forKey:@"team"];
    [encoder encodeObject:self.score forKey:@"score"];
    
}


@end
