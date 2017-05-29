//
//  FinishedMatchesViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "FinishedMatchesViewController.h"

@interface FinishedMatchesViewController ()

@end

@implementation FinishedMatchesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.title = [[LocalizableStringService sharedInstance] getLocalizableStringForType:TYPE_LABEL andSybtype:SUBTYPE_TEXT andSuffix:@"ended"];
    
    [self getEndedMatches];
    self.tableArray = self.endMatchesArray;
    [self.tblTableView reloadData];
}


#pragma mark - Private methods

-(void)getEndedMatches {
    NSUserDefaults *keychain = [NSUserDefaults standardUserDefaults];
    NSData *endedMatchesData = [keychain objectForKey:@"endedMatchesArray"];
    if (endedMatchesData)
    {
        NSMutableArray *endedMatchesArray = [NSKeyedUnarchiver unarchiveObjectWithData:endedMatchesData];
        if (endedMatchesArray)
        {
            self.endMatchesArray = endedMatchesArray;
        }
    }

}

@end
