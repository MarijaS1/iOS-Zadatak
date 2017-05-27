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


@end
