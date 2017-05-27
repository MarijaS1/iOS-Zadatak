//
//  NSString+PathParameters.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "NSString+PathParameters.h"

@implementation NSString (PathParameters)


+ (NSString *)stringWithPathParameters:(NSDictionary *)parameters {
    NSMutableString *query = [NSMutableString stringWithString:@""];
    
    // Sort parameters to be appended so that our solution is stable (and testable)
    NSArray *parameterNames = [parameters allKeys];
    parameterNames = [parameterNames sortedArrayUsingSelector:@selector(compare:)];
    
    for (NSString *parameterName in parameterNames) {
        id value = [parameters objectForKey:parameterName];
        NSAssert3([parameterName isKindOfClass:[NSString class]], @"Got '%@' of type %@ as key for parameter with value '%@'. Expected an NSString.", parameterName, NSStringFromClass([parameterName class]), value);
        
        // The value needs to be an NSString, or be able to give us an NSString
        if (![value isKindOfClass:[NSString class]]) {
            if ([value respondsToSelector:@selector(stringValue)]) {
                value = [value stringValue];
            }
            else {
                // Fallback to simply giving the description
                value = [value description];
            }
        }
        
        if ([query length] == 0) {
            [query appendFormat:@"%@=%@", [parameterName stringByEscapingForURLArgument], [value stringByEscapingForURLArgument]];
        }
        else {
            [query appendFormat:@"&%@=%@", [parameterName stringByEscapingForURLArgument], [value stringByEscapingForURLArgument]];
        }
    }
    
    return query;
}

- (NSString *)stringByEscapingForURLArgument {
    // Encode all the reserved characters, per RFC 3986 (<http://www.ietf.org/rfc/rfc3986.txt>)
    NSString *escapedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                                    (CFStringRef)self,
                                                                                                    NULL,
                                                                                                    (CFStringRef)@"!*'\"();:@&=+$,/?%#[] ",
                                                                                                    kCFStringEncodingUTF8));
    return escapedString;
}


@end
