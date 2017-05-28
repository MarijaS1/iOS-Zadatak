//
//  CardData.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "CardData.h"

@implementation CardData

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
        
        self.yellow = [decoder decodeObjectForKey:@"yellow"];
        self.red = [decoder decodeObjectForKey:@"red"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.yellow forKey:@"yellow"];
    [encoder encodeObject:self.red forKey:@"red"];
    
    
}


@end
