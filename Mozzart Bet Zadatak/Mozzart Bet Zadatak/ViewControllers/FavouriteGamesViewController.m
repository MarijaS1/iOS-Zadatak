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
   
       self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"favourites"];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
     self.favouriteMatches = [[NSMutableArray alloc]init];
    [self getAllMatches];
    for (Livescores *livescore in self.livescoresArray) {
        if (livescore.isFavourite ) {
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
    self.favouriteMatches = nil;
}

-(void)starButtonTapped:(UIButton *)sender {
    [self getAllMatches];
    NSMutableArray *filterFavouriteLivescores = self.favouriteMatches;
    for (Livescores *livescores in self.livescoresArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveAllMatches];           
                if (livescores.isFavourite && ![self.favouriteMatches containsObject:livescores]) {
                    [self.favouriteMatches addObject:livescores];
                }else{
                    for (Livescores *favouriteLivesscore in self.favouriteMatches) {
                        if (favouriteLivesscore.match_id == livescores.match_id) {
                            [filterFavouriteLivescores removeObject:favouriteLivesscore];
                            break;
                        }
                    }
               }            
            break;
        }
    }
    
    for (Livescores *livescores in self.endMatchesArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveEndedMatches];
        }
    }
    
    for (Livescores *livescores in self.nextMatchesArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveNextMatches];
        }
    }
    
    self.favouriteMatches = filterFavouriteLivescores;
    
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

@end
