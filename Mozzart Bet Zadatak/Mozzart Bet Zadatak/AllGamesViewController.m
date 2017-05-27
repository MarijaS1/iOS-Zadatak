//
//  FirstViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "AllGamesViewController.h"
#import "LivescoreResponse.h"
#define SPORT_ID    1

@interface AllGamesViewController ()

@end

@implementation AllGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] withSuccess:^(NSArray *livescoresResponse){
        NSLog(@"%@", livescoresResponse);
    }failure:^(MozzartError *error) {
        NSLog(@"Error");
    }];
   
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
