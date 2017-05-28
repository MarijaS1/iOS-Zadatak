//
//  BasicTableViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "BasicTableViewController.h"

@interface BasicTableViewController ()

@end

@implementation BasicTableViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set TableView DataSource & Delegate
    self.tblTableView.dataSource = self;
    self.tblTableView.delegate = self;
}

#pragma mark - Abstract methods

// Number of rows
- (NSInteger)setTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}

// Cell for row
- (UITableViewCell *)setTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc] init];
}

// Will display cell
- (void)setTableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
}

// Height for row
- (CGFloat)setTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

// Did select row
- (void)setTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

// Did deselect row
- (void)setTableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}

// Editing style
- (UITableViewCellEditingStyle)setTableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}

// Edit actions for row
- (NSArray *)setTableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NSArray array];
}

#pragma mark - TableView DataSource

// Number of rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self setTableView:tableView numberOfRowsInSection:section];
}

// Cell for row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self setTableView:tableView cellForRowAtIndexPath:indexPath];
}

#pragma mark - TableView Delegate

// Will display cell
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setTableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
}

// Estimated height
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

// Height for row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self setTableView:tableView heightForRowAtIndexPath:indexPath];
}

// Did select row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setTableView:tableView didSelectRowAtIndexPath:indexPath];
}

// Did deselect row
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self setTableView:tableView didDeselectRowAtIndexPath:indexPath];
}

// Needs to be implemented for row editing to be available (can remain empty)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

// Editing style
- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self setTableView:aTableView editingStyleForRowAtIndexPath:indexPath];
}

// Edit actions for row
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self setTableView:tableView editActionsForRowAtIndexPath:indexPath];
}

#pragma mark - MatchTableViewCellDelegate

-(void)scoreTapped{
    NSLog(@"Score tapped");
    //preko self.tblArray dobijas sve podatke = livescoreArray
    
}


@end
