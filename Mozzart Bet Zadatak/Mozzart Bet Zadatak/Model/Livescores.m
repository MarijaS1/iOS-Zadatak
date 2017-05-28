//
//  LivescoreData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "Livescores.h"

@implementation Livescores
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
   
        self.category_id = [decoder decodeObjectForKey:@"category_id"];
        self.tournament_id = [decoder decodeObjectForKey:@"tournament_id"];
        self.match_id = [decoder decodeObjectForKey:@"match_id"];
        self.home_team = [decoder decodeObjectForKey:@"home_team"];
        self.guest_team = [decoder decodeObjectForKey:@"guest_team"];
        self.match_current_time = [decoder decodeIntegerForKey:@"match_current_time"];
        self.tournament_name = [decoder decodeObjectForKey:@"tournament_name"];
        self.category_name = [decoder decodeObjectForKey:@"category_name"];
        self.winner = [decoder decodeObjectForKey:@"winner"];
        self.started = [decoder decodeIntegerForKey:@"started"];
        self.period_started = [decoder decodeIntegerForKey:@"period_started"];
        self.match_time = [decoder decodeObjectForKey:@"match_time"];
       
        self.status = [decoder decodeObjectForKey:@"status"];
        self.status_code = [decoder decodeIntegerForKey:@"status_code"];
        self.score = [decoder decodeObjectForKey:@"score"];
        self.goals = [decoder decodeObjectForKey:@"goals"];
        self.cards = [decoder decodeObjectForKey:@"cards"];
        self.matchcast = [decoder decodeObjectForKey:@"matchcast"];
        self.isFavourite = [decoder decodeBoolForKey:@"isFavourite"];


        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.category_id forKey:@"category_id"];
    [encoder encodeObject:self.tournament_id forKey:@"tournament_id"];
    [encoder encodeObject:self.match_id forKey:@"match_id"];
    [encoder encodeObject:self.guest_team forKey:@"guest_team"];
    [encoder encodeObject:self.home_team forKey:@"home_team"];
    [encoder encodeInteger:self.match_current_time forKey:@"match_current_time"];
    [encoder encodeObject:self.tournament_name forKey:@"tournament_name"];
    [encoder encodeObject:self.category_name forKey:@"category_name"];
    [encoder encodeObject:self.winner forKey:@"winner"];
    [encoder encodeInteger:self.started forKey:@"started"];
    [encoder encodeInteger:self.period_started forKey:@"period_started"];
    [encoder encodeObject:self.match_time forKey:@"match_time"];
    
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeInteger:self.status_code forKey:@"status_code"];
    [encoder encodeObject:self.score forKey:@"score"];
    [encoder encodeObject:self.goals forKey:@"goals"];
    [encoder encodeObject:self.cards forKey:@"cards"];
    [encoder encodeObject:self.matchcast forKey:@"matchcast"];
    [encoder encodeBool:self.isFavourite forKey:@"isFavourite"];
    
}

@end
