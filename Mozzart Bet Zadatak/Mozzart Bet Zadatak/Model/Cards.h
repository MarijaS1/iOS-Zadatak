//
//  YellowCard.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardData.h"


@interface Cards : NSObject

@property (strong, nonatomic) CardData *home_team;
@property (strong, nonatomic) CardData *guest_team;


@end
