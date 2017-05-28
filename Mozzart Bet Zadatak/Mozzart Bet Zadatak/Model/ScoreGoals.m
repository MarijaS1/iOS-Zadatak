//
//  ScoreGoals.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ScoreGoals.h"

@implementation ScoreGoals

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
        
        self.home_team = [decoder decodeIntegerForKey:@"home_team"];
        self.guest_team = [decoder decodeIntegerForKey:@"guest_team"];

    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeInteger:self.guest_team forKey:@"guest_team"];
    [encoder encodeInteger:self.home_team forKey:@"home_team"];
}


@end
