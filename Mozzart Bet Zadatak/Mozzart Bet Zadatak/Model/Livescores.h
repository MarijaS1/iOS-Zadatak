//
//  LivescoreData.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MatchTeam.h"
#import "Score.h"
#import "Goals.h"
#import "Cards.h"

@interface Livescores : NSObject

@property (strong, nonatomic) NSNumber *category_id;
@property (strong, nonatomic) NSNumber *tournament_id;
@property (strong, nonatomic) NSNumber *match_id;
@property (strong, nonatomic) MatchTeam *home_team;
@property (strong, nonatomic) MatchTeam *guest_team;
@property (nonatomic) long match_current_time;
@property (strong, nonatomic) NSString *tournament_name;
@property (strong, nonatomic) NSString *category_name;
@property (strong, nonatomic) NSNumber *winner;
@property (nonatomic) long started;
@property (nonatomic) long period_started;
@property (strong, nonatomic) NSString *match_time;
@property (strong, nonatomic) NSString *status;
@property (strong, nonatomic) NSNumber *status_code;
@property (strong, nonatomic) Score *score;
@property (strong, nonatomic) Goals *goals;
@property (strong, nonatomic) Cards *cards;
@property (strong, nonatomic) NSString *matchcast;

@end
