//
//  DataController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServerAccessData.h"
#import "Livescores.h"

@interface DataController : NSObject

@property (strong, nonatomic) ServerAccessData *serverData;

+ (DataController *)sharedInstance;

- (void) setLivescores:(NSMutableArray *)livescores;
- (NSMutableArray*)getLivescores;

-(void)setEndedMatchesArray:(NSMutableArray *)endedMatchesArray;
-(NSMutableArray*)getEndedMatchesArray;

@end
