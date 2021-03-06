//
//  BasicViewController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "DataController.h"
#import "RestService.h"
#import "MozzartError.h"
#import "ErrorMessage.h"

#define WARNING_TOAST                       0
#define INFO_TOAST                          1
#define ERROR_TOAST                         2

@interface BasicViewController : UIViewController

@property (strong, nonatomic) RestService *restService;

- (void) showProgressWithInfoMessage:(NSString *)message;
- (void) showProgressWithInfoMessage:(NSString *)message withTimeoutInterval:(float)timeout;
- (void) showTemporaryInfoMessage:(NSString *)message;
- (void) showTemporaryInfoMessage:(NSString *)message
                     withDuration:(NSTimeInterval) duration;
- (void) updateProgressWithInfoMessage :(NSString *) message;
- (void) hideProgressAndMessage;

/**
 This method shows toast message on top of the screen
 */
- (void) showToastViewWithMesage:(NSString *)message forType:(int) type;

/**
 This method shows alert message on top of the screen
 param: warning title and text
 */
- (void) showAlertPopupWithWarning:(NSString *)warning;

/**
 This method shows alert message on top of the screen
 param: message text
 */
- (void) showAlertPopupWithMessage:(NSString *)text;

/**
 This method shows error alert message on top of the screen
 */
- (void) showErrorAlertPopupWithWarning:(NSString *)warning;



@end
