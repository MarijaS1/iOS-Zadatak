//
//  LiveMatchesTableViewController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiveMatchesTableViewController : BasicTableViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *emptyView;


@end
