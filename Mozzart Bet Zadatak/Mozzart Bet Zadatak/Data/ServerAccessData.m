//
//  ServerAccssData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ServerAccessData.h"

@implementation ServerAccessData

#define SERVER_URL_KEY                          [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server_URL_key"]
#define SERVER_URL                              [[[NSBundle mainBundle] objectForInfoDictionaryKey:@"Server_URLs"] objectForKey:SERVER_URL_KEY]

#define API_EXTENSION                               @"index.php/livescores.json"
#define FLAG_BASE_URL                               @"http://static.mozzartsport.com"

#define URL_API_CATEGORY_ID                         @"images/flags/26x17/%@"

//Path pattern strings
#define URL_API_CATEGORY_ID_PATTERN                 @"images/flags/26x17/:id"

/*--------------------------------------------------------------
 * BASE URL
 *-------------------------------------------------------------*/

- (NSString *)getBaseUrl {
    NSString *baseURL = [NSString stringWithFormat:@"%@", SERVER_URL];
    
    return baseURL;
}

-(NSString *)getFlagBaseURL {
    NSString *basicString = [NSString stringWithFormat:@"%@", FLAG_BASE_URL];
    
    return basicString;
}

#pragma mark - Private methods


/*--------------------------------------------------------------
 * BASE URL WITH API
 *-------------------------------------------------------------*/

- (NSString *)getBaseUrlWithApiExtension {
    NSString *baseUrlWithApiExtension = [NSString stringWithFormat:@"%@/%@", [self getBaseUrl], API_EXTENSION];
    
    return baseUrlWithApiExtension;
}

- (NSString *)getFlagBaseUrlWithApiExtension {
    NSString *baseUrlWithApiExtension = [NSString stringWithFormat:@"%@/%@", [self getFlagBaseURL], URL_API_CATEGORY_ID];
    
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

- (NSURL *) getFlagURL {
    NSString *basicString = [NSString stringWithFormat:@"%@", [self getFlagBaseUrlWithApiExtension]];
    
    NSURL *basicUrl = [NSURL URLWithString:basicString];
    
    return basicUrl;
}


/*--------------------------------------------------------------
 * PATH PATTERNS
 *-------------------------------------------------------------*/

- (NSString *)getAllMatchesPathPattern {
    return [NSString stringWithFormat:@"/%@",API_EXTENSION];
}

- (NSString *)getFlagsPathPattern {
    return [NSString stringWithFormat:@"/%@", URL_API_CATEGORY_ID_PATTERN];
}



@end
