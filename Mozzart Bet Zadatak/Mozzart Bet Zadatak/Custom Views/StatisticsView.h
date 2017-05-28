//
//  StatisticsView.h
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatisticsView : UIView

@property (weak, nonatomic) IBOutlet UILabel *scoreFirstHalfLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *extraTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *freeKickLabel;
@property (weak, nonatomic) IBOutlet UILabel *shootersLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamYellowCardsLabel;
@property (weak, nonatomic) IBOutlet UILabel *homeTeamRedCardsLabel;

@property (weak, nonatomic) IBOutlet UILabel *guestTeamYellowCardsLabel;
@property (weak, nonatomic) IBOutlet UILabel *guestTeamRedCardsLabel;

-(void)setupSatisticsViewWithLivescoresArray:(NSArray*)livescores andWithIndexPath:(NSIndexPath*)indexPath;


@end
