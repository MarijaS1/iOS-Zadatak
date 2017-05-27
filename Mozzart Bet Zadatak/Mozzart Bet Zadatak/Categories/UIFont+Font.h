//
//  UIFont+Font.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Font)

/*
 *This method return regular HelveticaNeue font for certain font size
 */
+ (UIFont *)getRegularFontForSize:(CGFloat) fSize;

/*
 *This method return italic HelveticaNeue font for certain font size
 */
+ (UIFont *)getItalicFontForSize:(CGFloat) fSize;

/*
 *This method return bold HelveticaNeue font for certain font size
 */
+ (UIFont *)getBoldFontForSize:(CGFloat) fSize;

@end
