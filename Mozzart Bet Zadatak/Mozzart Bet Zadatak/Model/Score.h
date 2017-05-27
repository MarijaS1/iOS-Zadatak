//
//  Score.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ScoreGoals.h"

@interface Score : NSObject

@property (strong, nonatomic) ScoreGoals *current;
@property (strong, nonatomic) ScoreGoals *half_time;
@property (strong, nonatomic) ScoreGoals *normal_time;

@end
