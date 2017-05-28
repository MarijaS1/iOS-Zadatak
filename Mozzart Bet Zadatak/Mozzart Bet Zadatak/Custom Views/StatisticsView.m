//
//  StatisticsView.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "StatisticsView.h"
#import "TeamData.h"

@implementation StatisticsView

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

-(void)setupSatisticsViewWithLivescoresArray:(NSArray*)livescores andWithIndexPath:(NSIndexPath*)indexPath{
   
    [self.scoreFirstHalfLabel setText:[NSString stringWithFormat:@"%ld : %ld", (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.half_time.home_team, (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.half_time.guest_team]];
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld : %ld", (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.current.home_team, (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.current.guest_team];
    
    NSMutableString *shootersString = [[NSMutableString alloc] init];
    for (TeamData *teamData in ((Livescores*)[livescores objectAtIndex:indexPath.row]).goals.home_team) {
        [shootersString appendFormat:@"%@\n", [NSString stringWithFormat:@"%ld' %@",(long)teamData.time, teamData.player]];
    }
    
    for (TeamData *teamData in ((Livescores*)[livescores objectAtIndex:indexPath.row]).goals.guest_team) {
        [shootersString appendFormat:@"%@\n", [NSString stringWithFormat:@"%ld' %@",(long)teamData.time, teamData.player]];
    }
    
    if (![shootersString isEqualToString:@""]) {
         self.shootersLabel.text = shootersString;
    }
   
    
    self.homeTeamYellowCardsLabel.text = ([((CardData*)((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.home_team).yellow count] == 0) ? @"-" : [NSString stringWithFormat:@"%ld", [((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.home_team.yellow count]];
    
    self.homeTeamRedCardsLabel.text = ([((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.home_team.red count] == 0) ? @"-" : [NSString stringWithFormat:@"%ld", [((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.home_team.red count]];
    
    self.guestTeamYellowCardsLabel.text = ([((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.guest_team.yellow count] == 0) ? @"-" : [NSString stringWithFormat:@"%ld", [((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.guest_team.yellow count]];
    
    self.guestTeamRedCardsLabel.text = ([((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.guest_team.red count] == 0) ? @"-" : [NSString stringWithFormat:@"%ld", [((Livescores*)[livescores objectAtIndex:indexPath.row]).cards.guest_team.red count]];
    
}

@end
