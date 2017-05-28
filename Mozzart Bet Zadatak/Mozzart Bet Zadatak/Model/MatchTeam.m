//
//  HomeTeam.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "MatchTeam.h"

@implementation MatchTeam

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
        
        self.team_id = [decoder decodeIntegerForKey:@"team_id"];
        self.name = [decoder decodeObjectForKey:@"name"];
           }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    
    [encoder encodeInteger:self.team_id forKey:@"team_id"];
    [encoder encodeObject:self.name forKey:@"name"];
    }


@end
