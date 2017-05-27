//
//  ErrorMessage.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_SERVER_ERROR_CODE               50000
#define DEFAULT_CONNECTION_CODE                 0


@interface ErrorMessage : NSObject

+(NSString *)getMessageForCode:(NSInteger)code;


@end
