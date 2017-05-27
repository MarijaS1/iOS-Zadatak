//
//  UIFont+Font.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "UIFont+Font.h"

@implementation UIFont (Font)


+ (UIFont *)getRegularFontForSize:(CGFloat) fSize {
    return [UIFont fontWithName:@"HelveticaNeue" size:fSize];
}

+ (UIFont *)getItalicFontForSize:(CGFloat) fSize {
    return [UIFont fontWithName:@"HelveticaNeue-Italic" size:fSize];
}

+ (UIFont *)getBoldFontForSize:(CGFloat) fSize {
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:fSize];
}

@end
