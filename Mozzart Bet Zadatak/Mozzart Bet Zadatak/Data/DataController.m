//
//  DataController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "DataController.h"
#import "RestService.h"

@interface DataController()

@property (strong, nonatomic) RestService* restService;
@property (strong, nonatomic) NSMutableArray* livescores;
@property (strong, nonatomic) NSMutableArray* endedMatchesArray;

@end


@implementation DataController

- (RestService *)restService {
    if (!_restService) {
        _restService = [[RestService alloc] init];
    }
    return _restService;
}




static DataController *sharedDataController = nil;

+ (DataController *)sharedInstance
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^
                  {
                      sharedDataController = [[DataController alloc] init];
                  });
    return sharedDataController;
}


#pragma mark getters and setters

- (ServerAccessData *) serverData
{
    if (!_serverData)
    {
        _serverData = [[ServerAccessData alloc] init];
    }
    return _serverData;
}

- (void) setLivescores:(NSMutableArray *)livescores
{
    self.livescores = livescores;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:livescores] forKey:@"livescores"];
    [defaults synchronize];
    
}
-(NSMutableArray*)getLivescores{
    return self.livescores;
}


-(void)setEndedMatchesArray:(NSMutableArray *)endedMatchesArray{
    self.endedMatchesArray = endedMatchesArray;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:endedMatchesArray] forKey:@"endedMatchesArray"];
    [defaults synchronize];
}

-(NSMutableArray*)getEndedMatchesArray{
    return self.endedMatchesArray;
}



@end
