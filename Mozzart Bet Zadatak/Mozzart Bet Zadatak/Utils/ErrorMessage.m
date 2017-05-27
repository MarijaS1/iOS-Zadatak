//
//  ErrorMessage.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "ErrorMessage.h"
#import "LocalizableStringService.h"

@implementation ErrorMessage

+(NSString *)getMessageForCode:(NSInteger)code {
    NSString * errorStringSuffix;
    
    switch (code) {
        case DEFAULT_CONNECTION_CODE:
            errorStringSuffix = @"DEFAULT_CONNECTION_CODE";
            break;
        default:
            errorStringSuffix = @"DEFAULT";

    }
      return [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_REST andSybtype:nil andSuffix:errorStringSuffix];
}

@end
