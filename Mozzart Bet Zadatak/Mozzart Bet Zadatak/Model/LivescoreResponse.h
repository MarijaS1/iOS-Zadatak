//
//  Livescores.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Livescores.h"


@interface LivescoreResponse : NSObject

@property (strong, nonatomic) NSArray *livescores;
@property (strong, nonatomic) NSString *delta;


@end
