//
//  SecondViewController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavouriteGamesViewController : BasicTableViewController <UITableViewDelegate, UITableViewDataSource, MatchTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UIView *emptyView;


@end

