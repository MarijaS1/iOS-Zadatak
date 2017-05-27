//
//  ServerAccssData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ServerAccessData.h"

@implementation ServerAccessData

#define SERVER_URL                          @"http://ws.mozzartsport.com"

#define API_EXTENSION                       @"index.php/livescores.json"


/*--------------------------------------------------------------
 * BASE URL
 *-------------------------------------------------------------*/

- (NSString *)getBaseUrl {
    NSString *baseURL = [NSString stringWithFormat:@"%@", SERVER_URL];
    
    return baseURL;
}

#pragma mark - Private methods


/*--------------------------------------------------------------
 * BASE URL WITH API
 *-------------------------------------------------------------*/

- (NSString *)getBaseUrlWithApiExtension {
    NSString *baseUrlWithApiExtension = [NSString stringWithFormat:@"%@/%@", [self getBaseUrl], API_EXTENSION];
    
    return baseUrlWithApiExtension;
}


/*--------------------------------------------------------------
 * URLS
 *-------------------------------------------------------------*/

- (NSURL *) getAllMatchesURL {
    NSString *basicString = [NSString stringWithFormat:@"%@", [self getBaseUrlWithApiExtension]];
    
    NSURL *basicUrl = [NSURL URLWithString:basicString];
    
    return basicUrl;
}



/*--------------------------------------------------------------
 * PATH PATTERNS
 *-------------------------------------------------------------*/

- (NSString *)getAllMatchesPathPattern {
    return [NSString stringWithFormat:@"/%@",API_EXTENSION];
}




@end
