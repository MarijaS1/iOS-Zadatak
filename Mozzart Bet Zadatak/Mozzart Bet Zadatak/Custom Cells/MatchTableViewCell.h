//
//  MatchTableViewCell.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MATCH_TABLE_VIEW_CELL_IDENTIFIER    @"matchTableViewCell"

@protocol MatchTableViewCellDelegate <NSObject>

-(void)scoreTapped;

@end

@interface MatchTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *starButton;

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *guestTeamLabel;

@property (weak, nonatomic) id<MatchTableViewCellDelegate> delegate;

-(void)setupMatchCellWithLivescoresArray:(NSArray*)livescores andWithIndexPath:(NSIndexPath*)indexPath;

@end
