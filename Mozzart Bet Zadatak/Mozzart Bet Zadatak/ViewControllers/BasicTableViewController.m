//
//  BasicTableViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "BasicTableViewController.h"
#import "KLCPopup.h"
#import "StatisticsView.h"

@interface BasicTableViewController ()


@end

@implementation BasicTableViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureHeaderView]; //configure header view
    // Set TableView DataSource & Delegate
    self.tblTableView.dataSource = self;
    self.tblTableView.delegate = self;
    [self configureTableView]; //configure tableview
    
}

#pragma mark - Abstract methods


// Number of rows
- (NSInteger)setTableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}

// Cell for row
- (UITableViewCell *)setTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    
    if (tableView == self.tblTableView) {
        MatchTableViewCell* matchCell = [tableView dequeueReusableCellWithIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
        if (matchCell == nil)
        {
            matchCell = [[MatchTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
        }
        if (self.tableArray) {
            matchCell.selectionStyle= UITableViewCellSelectionStyleNone;
            matchCell.starButton.tag = indexPath.row;
            [matchCell setupMatchCellWithLivescoresArray:self.tableArray andWithIndexPath:indexPath];
            
        }
        matchCell.delegate = self;
        cell = matchCell;
        
    }
    return cell;

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

-(void)scoreTapped:(id)sender{
    NSLog(@"Score tapped");
    if ([sender isKindOfClass:[UITapGestureRecognizer class]]) {
        UITapGestureRecognizer *gesture = (UITapGestureRecognizer*)sender;
        CGPoint hitPoint = [gesture.view convertPoint:CGPointZero toView:self.tblTableView];
        NSIndexPath *hitIndex = [self.tblTableView indexPathForRowAtPoint:hitPoint];
        StatisticsView *headerTableView = [[[NSBundle mainBundle] loadNibNamed:@"StatisticsView" owner:self options:nil]firstObject];
        [headerTableView setupSatisticsViewWithLivescoresArray:self.tableArray andWithIndexPath:hitIndex];
        headerTableView.autoresizesSubviews = YES;
        [headerTableView layoutIfNeeded];
        KLCPopup* popup = [KLCPopup popupWithContentView:headerTableView];
        [popup show];
    }
    
}


-(void)starButtonTapped:(UIButton *)sender {
    [self getAllMatches];
    for (Livescores *livescores in self.livescoresArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveAllMatches];
            [self.tblTableView reloadData];
        }
    }
    
    for (Livescores *livescores in self.endMatchesArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveEndedMatches];
            [self.tblTableView reloadData];
        }
    }
    
    for (Livescores *livescores in self.nextMatchesArray) {
        if (livescores.match_id == ((Livescores*)[self.tableArray objectAtIndex:sender.tag]).match_id) {
            livescores.isFavourite = !livescores.isFavourite;
            [self saveNextMatches];
            [self.tblTableView reloadData];
        }
    }
}

#pragma  mark -Private methods

-(void)getAllMatches {
    NSUserDefaults *keychain = [NSUserDefaults standardUserDefaults];
    NSData *allMatchesData = [keychain objectForKey:@"allMatchesArray"];
    if (allMatchesData)
    {
        NSMutableArray *allMatchesArray = [NSKeyedUnarchiver unarchiveObjectWithData:allMatchesData];
        if (allMatchesArray)
        {
            self.livescoresArray = allMatchesArray;
        }
    }
}


-(void)saveAllMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.livescoresArray] forKey:@"allMatchesArray"];
    [defaults synchronize];
}

-(void)saveEndedMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.endMatchesArray] forKey:@"endedMatchesArray"];
    [defaults synchronize];
}

-(void)saveNextMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.nextMatchesArray] forKey:@"nextMatchesArray"];
    [defaults synchronize];
}



-(void)configureHeaderView {
    HeaderTableView *headerTableView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderTableView" owner:self options:nil]firstObject];
    [self.headerView addSubview:headerTableView];
    [self.headerView layoutIfNeeded];
}

// Configure table view
- (void)configureTableView {
    [self.tblTableView registerNib:[UINib nibWithNibName:@"MatchTableViewCell" bundle:nil] forCellReuseIdentifier:MATCH_TABLE_VIEW_CELL_IDENTIFIER];
    self.tblTableView.rowHeight = UITableViewAutomaticDimension;
    self.tblTableView.estimatedRowHeight = 44;
    [self.tblTableView reloadData];
}


@end
