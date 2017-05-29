//
//  NextGamesTableViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "NextGamesTableViewController.h"

@interface NextGamesTableViewController ()


@end

@implementation NextGamesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"next"];
  
}


-(void)viewWillAppear:(BOOL)animated {
    [self getNextMatches];
    self.tableArray = self.nextMatchesArray;
    [self.tblTableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



#pragma mark - Private methods

-(void)getNextMatches {
    NSUserDefaults *keychain = [NSUserDefaults standardUserDefaults];
    NSData *nextMatchesData = [keychain objectForKey:@"nextMatchesArray"];
    if (nextMatchesData)
    {
        NSMutableArray *nextMatchesArray = [NSKeyedUnarchiver unarchiveObjectWithData:nextMatchesData];
        if (nextMatchesArray)
        {
            self.nextMatchesArray = nextMatchesArray;
        }
    }
    
}


-(void)saveNextMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.nextMatchesArray] forKey:@"nextMatchesArray"];
    [defaults synchronize];
}


#pragma mark - MatchTableViewCellDelegate methods

//-(void)starButtonTapped:(UIButton *)sender {
//    [self getAllMatches];
//    for (Livescores *livescores in self.nextMatchesArray) {
//        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
//            livescores.isFavourite = !livescores.isFavourite;
//            [self saveNextMatches];
//            [self.tblTableView reloadData];
//        }
//    }
//}


@end
