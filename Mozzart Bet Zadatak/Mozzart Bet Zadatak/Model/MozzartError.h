//
//  MozzartError.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MozzartError : NSObject

@property (nonatomic) NSInteger code;
@property (strong, nonatomic) NSString *codeMessage;

@end
