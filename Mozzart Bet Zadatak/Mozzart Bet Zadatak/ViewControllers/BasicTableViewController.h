//
//  BasicTableViewController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "BasicViewController.h"
#import "MatchTableViewCell.h"

@interface BasicTableViewController : BasicViewController<UITableViewDataSource, UITableViewDelegate, MatchTableViewCellDelegate>

#pragma mark - Properties
@property (nonatomic, strong) NSMutableArray *tableArray;
@property (strong, nonatomic) NSMutableArray *livescoresArray;

#pragma mark - IBOutlet's
@property (weak, nonatomic) IBOutlet UITableView *tblTableView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

#pragma mark - Methods
- (NSInteger)setTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void)setTableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)setTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)setTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)setTableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;


-(void)getAllMatches;
-(void)saveAllMatches;
@end
