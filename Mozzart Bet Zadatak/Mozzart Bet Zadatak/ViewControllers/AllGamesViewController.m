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
#import "LocalizableStringService.h"
#import "DataController.h"

@interface AllGamesViewController ()

@property (strong, nonatomic) NSMutableArray *endedMatchesArray;
@property (strong, nonatomic) NSMutableArray *nextMatchesArray;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSMutableArray *days;
@property (nonatomic, strong) NSMutableArray *month;
@property (nonatomic, strong) NSDateComponents *components;
@property (nonatomic, strong) NSString *selectedDate;


@end

@implementation AllGamesViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"allgames"];
    [self configureProperties];     // Configure properties
    [self configureDayAndMonthArray];      // Configure day and month array
    [self updateData];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getAllMatches];
    self.tableArray = self.livescoresArray;
    [self.tblTableView reloadData];
    [self.pickerView setHidden:YES];
}


#pragma mark - Configuration

// Configure properties
- (void)configureProperties {
    self.endedMatchesArray = [[NSMutableArray alloc]init];
    self.livescoresArray = [[NSMutableArray alloc]init];
    self.nextMatchesArray = [[NSMutableArray alloc]init];
    
    self.dateFormatter = [[NSDateFormatter alloc] init]; // Date formatter
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    //    [self.dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    //    [self.dateFormatter setTimeStyle:NSDateFormatterShortStyle];
}



// Configure day array
- (void)configureDayAndMonthArray {
    NSDate *now = [NSDate date];
    
    self.days = [NSMutableArray array];
    //get 7 days before today including today
    for (NSInteger i = -7; i <= 0; i++) {
        self.components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[now dateByAddingTimeInterval:i*24*60*60]];
        [self.days addObject:[NSString stringWithFormat:@"%ld/%ld", [self.components day], [self.components month]]];
        
    }
    //get 7 days after today without today
    for (NSInteger i = 1; i <= 7; i++) {
        self.components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[now dateByAddingTimeInterval:i*24*60*60]];
        [self.days addObject:[NSString stringWithFormat:@"%ld/%ld", [self.components day], [self.components month]]];
        
    }
    
}

// Configure From/To date pickers
- (void)showDatePicker {
    self.filterByDatePickerView.delegate = self;
    self.filterByDatePickerView.dataSource = self;
    self.filterByDatePickerView.showsSelectionIndicator = YES;
    self.filterByDatePickerView.backgroundColor = [UIColor getMidGreyColor];
    
    [self.filterByDatePickerView selectRow:[self.days count]/2 inComponent:0 animated:YES];
    self.selectedDate = [self.days objectAtIndex:[self.days count]/2];
    
    [self.pickerView setHidden:NO];
}


#pragma mark - Privat Methods


-(void)updateData {
    [self showProgressWithInfoMessage: [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_ALERT andSybtype:SUBTYPE_MESSAGE andSuffix:@"pleasewait"]];
    
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] andWithType:nil fromTime:0 untilTime:0 withSuccess:^(LivescoreResponse *livescoresResponse) {
        NSLog(@"%@", livescoresResponse);
        self.livescoresArray = [livescoresResponse.livescores mutableCopy];
        [self filterMatches];
        [self saveEndedMatches];
        [self saveNextMatches];
        [self saveAllMatches];
        [self hideProgressAndMessage];
        self.tableArray = self.livescoresArray;
        [self.tblTableView reloadData];
    } failure:^(MozzartError *error) {
        
        NSLog(@"Error");
        
    }];
    
}



-(void)filterMatches {
    for (Livescores *livescores in self.livescoresArray) {
        if (livescores.status_code == 100) {
            [self.endedMatchesArray addObject:livescores];
        }else if (livescores.status_code == 0) {
            [self.nextMatchesArray addObject:livescores];
        }
    }
}

-(void)saveEndedMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.endedMatchesArray] forKey:@"endedMatchesArray"];
    [defaults synchronize];
}

-(void)saveNextMatches{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.nextMatchesArray] forKey:@"nextMatchesArray"];
    [defaults synchronize];
}

-(NSDate *)beginningOfDay:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitMinute | NSCalendarUnitDay ) fromDate:date];
    
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    
    return [cal dateFromComponents:components];
    
}

-(NSDate *)endOfDay:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitMinute | NSCalendarUnitDay ) fromDate:date];
    
    [components setHour:23];
    [components setMinute:59];
    [components setSecond:59];
    
    return [cal dateFromComponents:components];
    
}


#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - Action methods

- (IBAction)filterByDateClicked:(UIBarButtonItem *)sender {
    [self showDatePicker];
}

- (IBAction)doneButtonPressed:(UIButton *)sender {
    
    NSString *date = [NSString stringWithFormat:@"%@/2017", self.selectedDate];
    NSDate *dateFromString = [self.dateFormatter dateFromString:date];
    NSDate *beggingingOfDate = [self beginningOfDay:dateFromString];
    NSDate *endOfDate = [self endOfDay:dateFromString];
    NSTimeInterval epochTimeBeggining = [beggingingOfDate timeIntervalSince1970];
    NSTimeInterval endEpochTime = [endOfDate timeIntervalSince1970];
    
    [self showProgressWithInfoMessage: [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_ALERT andSybtype:SUBTYPE_MESSAGE andSuffix:@"pleasewait"]];
    
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] andWithType:nil fromTime:epochTimeBeggining untilTime:endEpochTime withSuccess:^(LivescoreResponse *livescoresResponse) {
        NSLog(@"%@", livescoresResponse);
        self.livescoresArray = [livescoresResponse.livescores mutableCopy];
        [self hideProgressAndMessage];
        self.tableArray = self.livescoresArray;
        [self.tblTableView reloadData];
    } failure:^(MozzartError *error) {
        
        NSLog(@"Error");
        
    }];
    [self.pickerView setHidden:YES];
}


#pragma mark - UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    
    return [self.days count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return[self.days objectAtIndex:row];
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.selectedDate = [self.days objectAtIndex:row];
}


@end
