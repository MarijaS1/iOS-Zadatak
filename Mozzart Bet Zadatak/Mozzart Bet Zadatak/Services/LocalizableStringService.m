//
//  LocalizableStringService.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "LocalizableStringService.h"

@implementation LocalizableStringService

static LocalizableStringService *shared = nil;

+ (LocalizableStringService *)sharedInstance {
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        shared = [[LocalizableStringService alloc] init];
    });
    
    return shared;
}

-(NSString *) getLocalizableStringForType:(NSString *) type
                               andSybtype:(NSString *)subtype
                                andSuffix:(NSString *)suffix {
    
    NSString *string = nil;
    
    NSMutableString *mKey = [NSMutableString stringWithString:@""];
    if ([type length]) {
        [mKey appendString:type];
    }
    
    if ([subtype length]) {
        [mKey appendString:[NSString stringWithFormat:@"_%@", subtype]];
    }
    
    if ([suffix length]) {
        [mKey appendString:[NSString stringWithFormat:@"_%@", suffix]];
    }
    NSString *key = [NSString stringWithString:mKey];
    
    string = NSLocalizedString(key, nil);
    
    return string;
}

@end
