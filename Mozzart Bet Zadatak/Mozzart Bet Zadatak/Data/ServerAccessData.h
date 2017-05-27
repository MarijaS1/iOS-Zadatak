//
//  ServerAccssData.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerAccessData : NSObject

- (NSString *)getBaseUrl;


//URLs
- (NSURL *)getAllMatchesURL;


//path paterns

- (NSString *)getAllMatchesPathPattern;



@end
