//
//  LiveMatchesTableViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "LiveMatchesTableViewController.h"

@interface LiveMatchesTableViewController ()

@end

@implementation LiveMatchesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"live"];
    
    [self updateData];
    
    [self configureTableView];
}

- (void)configureTableView {
    [self.tblTableView registerNib:[UINib nibWithNibName:@"MatchTableViewCell" bundle:nil] forCellReuseIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
    self.tblTableView.rowHeight = UITableViewAutomaticDimension;
    self.tblTableView.estimatedRowHeight = 44;
    [self.tblTableView reloadData];
}

-(void)updateData {
    [self showProgressWithInfoMessage: [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_ALERT andSybtype:SUBTYPE_MESSAGE andSuffix:@"pleasewait"]];
    
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] andWithType:nil withSuccess:^(LivescoreResponse *livescoresResponse){
        [self hideProgressAndMessage];
        NSLog(@"%@", livescoresResponse);
        self.livescoresArray = livescoresResponse.livescores;
        self.tableArray = [self.livescoresArray mutableCopy];
        [self.tblTableView reloadData];
    }failure:^(MozzartError *error) {
        NSLog(@"Error");
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


@end
