//
//  FirstViewController.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericPicker.h"

@interface AllGamesViewController : BasicTableViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *filterByDateBarButtonItem;
@property (weak, nonatomic) IBOutlet UIPickerView *filterByDatePickerView;

@property (weak, nonatomic) IBOutlet UIView *pickerView;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

