//
//  LocalizableStringService.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TYPE_ALERT                       @"alert"
#define TYPE_BUTTON                      @"button"
#define TYPE_LABEL                       @"label"
#define TYPE_TEXTFIELD                   @"textfield"
#define TYPE_REST                        @"rest"

#define SUBTYPE_TITLE                    @"title"
#define SUBTYPE_MESSAGE                  @"message"
#define SUBTYPE_BUTTONTITLE              @"buttontitle"
#define SUBTYPE_FIRST_BUTTONTITLE        @"firstbuttontitle"
#define SUBTYPE_SECOND_BUTTONTITLE       @"secondbuttontitle"
#define SUBTYPE_TEXT                     @"text"

@interface LocalizableStringService : NSObject

+ (LocalizableStringService *)sharedInstance;

/**
 This method returns key for localizable strings
 */
-(NSString *) getLocalizableStringForType:(NSString *) type
                               andSybtype:(NSString *)subtype
                                andSuffix:(NSString *)suffix;


@end
