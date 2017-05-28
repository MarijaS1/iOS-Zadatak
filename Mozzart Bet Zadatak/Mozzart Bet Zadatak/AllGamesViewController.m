//
//  FirstViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "AllGamesViewController.h"
#import "LivescoreResponse.h"
#import "MatchTableViewCell.h"
#import  "HeaderTableView.h"
#define SPORT_ID    1

@interface AllGamesViewController ()

@property (strong, nonatomic) NSArray *livescoresArray;

@end

@implementation AllGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      HeaderTableView *headerTableView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderTableView" owner:self options:nil]firstObject];
    [self.headerView addSubview:headerTableView];
    [self.headerView layoutIfNeeded];
//    
//    self.headerView = headerTableView;
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] withSuccess:^(LivescoreResponse *livescoresResponse){
        NSLog(@"%@", livescoresResponse);
        self.livescoresArray = livescoresResponse.livescores;
        self.tableArray = [self.livescoresArray mutableCopy];
        [self.tblTableView reloadData];
    }failure:^(MozzartError *error) {
        NSLog(@"Error");
    }];
   [self configureTableView];  // Configure table view
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - Privat Methods
// Configure table view
- (void)configureTableView {
    [self.tblTableView registerNib:[UINib nibWithNibName:@"MatchTableViewCell" bundle:nil] forCellReuseIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
    self.tblTableView.rowHeight = UITableViewAutomaticDimension;
    self.tblTableView.estimatedRowHeight = 44;
    [self.tblTableView reloadData];
}

#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    long sections = 1;
//    if (tableView == self.followingTableView && [self.followingArray count]>0) {
//        sections=[self.followingArray count];
//    }
    return sections;
}

-(UITableViewCell *)setTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
   
        if (tableView == self.tblTableView) {
            MatchTableViewCell* matchCell = [tableView dequeueReusableCellWithIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
            if (matchCell == nil)
            {
                matchCell = [[MatchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
            }
            if (self.livescoresArray) {
                [matchCell setupMatchCellWithLivescoresArray:self.livescoresArray andWithIndexPath:indexPath];

            }
            matchCell.delegate = self;
             cell = matchCell;
    
        }
    
    return cell;
}


@end
