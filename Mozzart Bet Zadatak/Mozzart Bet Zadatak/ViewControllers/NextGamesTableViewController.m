//
//  NextGamesTableViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "NextGamesTableViewController.h"

@interface NextGamesTableViewController ()

@property (strong, nonatomic) NSMutableArray *nextMatchesArray;

@end

@implementation NextGamesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"next"];
    
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

@end
