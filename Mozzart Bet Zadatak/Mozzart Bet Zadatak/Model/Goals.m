//
//  Goals.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "Goals.h"

@implementation Goals

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {

        self.home_team = [decoder decodeObjectForKey:@"home_team"];
        self.guest_team = [decoder decodeObjectForKey:@"guest_team"];
        self.by_time = [decoder decodeObjectForKey:@"by_time"];
 
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.guest_team forKey:@"guest_team"];
    [encoder encodeObject:self.home_team forKey:@"home_team"];
    [encoder encodeObject:self.by_time forKey:@"by_time"];
    
}


@end
