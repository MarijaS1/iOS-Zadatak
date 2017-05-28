//
//  RestService.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "MozzartError.h"
#import "Livescores.h"
#import "LivescoreResponse.h"


#define REQUEST_METHOD_POST             @"POST"
#define REQUEST_METHOD_GET              @"GET"
#define REQUEST_METHOD_PUT              @"PUT"
#define REQUEST_METHOD_DELETE           @"DELETE"

@interface RestService : NSObject

- (void) getAllMatchesWithSportID:(NSNumber *)sportID
                      andWithType:(NSString *)type
                      withSuccess:(void (^)(LivescoreResponse *))success
                          failure:(void (^)(MozzartError *))failure ;



@end
