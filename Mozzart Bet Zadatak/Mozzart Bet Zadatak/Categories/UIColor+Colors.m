//
//  UIColor+Colors.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "UIColor+Colors.h"

#define ALPHA_1                   1.0

@implementation UIColor (Colors)

+ (UIColor *)getPinkColor {
    return [UIColor colorWithRed:238/255.0 green:0/255.0 blue:139/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getVeryDarkGreyColor {
    return [UIColor colorWithRed:43/255.0 green:43/255.0 blue:43/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getDarkGreyColor {
    return [UIColor colorWithRed:66/255.0 green:66/255.0 blue:66/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getGreyColor {
    return [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getMidGreyColor {
    return [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getLightGreyColor {
    return [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getVeryLightGreyColor {
    return [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:ALPHA_1];
}

+ (UIColor *)getWhiteColor {
    return [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:ALPHA_1];
}

/*
 *Color R:32 G:60 B:119
 */
+ (UIColor *)getBlueColor{
    return [UIColor colorWithRed:32/255.0 green:60/255.0 blue:119/255.0 alpha:ALPHA_1];
}

/*
 *Color R:253 G:184 B:19
 */
+ (UIColor *)getYellowColor{
    return [UIColor colorWithRed:253/255.0 green:184/255.0 blue:19/255.0 alpha:ALPHA_1];
}



@end
