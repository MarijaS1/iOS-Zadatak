//
//  Score.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/27/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "Score.h"

@implementation Score
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if(self) {
        
        self.current = [decoder decodeObjectForKey:@"current"];
        self.half_time = [decoder decodeObjectForKey:@"half_time"];
        self.normal_time = [decoder decodeObjectForKey:@"normal_time"];
        
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.current forKey:@"current"];
    [encoder encodeObject:self.half_time forKey:@"half_time"];
    [encoder encodeObject:self.normal_time forKey:@"normal_time"];
    
}


@end
