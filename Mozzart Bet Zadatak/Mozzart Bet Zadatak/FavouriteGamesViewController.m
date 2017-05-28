//
//  SecondViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "FavouriteGamesViewController.h"


@interface FavouriteGamesViewController ()

@property (nonatomic, strong) NSMutableArray *favouriteMatches;

@end

@implementation FavouriteGamesViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.favouriteMatches = [[NSMutableArray alloc]init];
       self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"favourites"];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self getAllMatches];
    for (Livescores *livescore in self.livescoresArray) {
        if (livescore.isFavourite && ![self.favouriteMatches containsObject:livescore]) {
            [self.favouriteMatches addObject:livescore];
        }
    }
    
    if (![self.favouriteMatches count]) {
        [self.emptyView setHidden:NO];
        [self.tblTableView setHidden:YES];
    }else{
        [self.emptyView setHidden:YES];
        [self.tblTableView setHidden:NO];
        self.tableArray = self.favouriteMatches;
        [self.tblTableView reloadData];
    }

}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.favouriteMatches = nil;
}



@end
