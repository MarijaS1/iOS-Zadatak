//
//  MatchTableViewCell.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/28/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "MatchTableViewCell.h"
#import <DTCoreText/DTCoreText.h>


#define  FLAG_IMAGE_URL     @"http://static.mozzartsport.com/images/flags/26x17/"

@implementation MatchTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.scoreLabel setFont:[UIFont getBoldFontForSize:14]];
    UITapGestureRecognizer *tapAction = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scoreTapped)];
    [tapAction setEnabled:YES];
    [tapAction setCancelsTouchesInView:NO];
    tapAction.numberOfTapsRequired = 1;
    [self.scoreLabel addGestureRecognizer:tapAction];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Private methods

- (void)scoreTapped {
      [self.delegate scoreTapped];       
}

-(void)setupMatchCellWithLivescoresArray:(NSArray*)livescores andWithIndexPath:(NSIndexPath*)indexPath{
    
    [self.flagImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/%@", FLAG_IMAGE_URL, ((Livescores*)[livescores objectAtIndex:indexPath.row]).category_id]] placeholderImage:[UIImage imageNamed:@"second"]];
    self.timeLabel.text = ((Livescores*)[livescores objectAtIndex:indexPath.row]).match_time;
    self.homeTeamLabel.text = ((Livescores*)[livescores objectAtIndex:indexPath.row]).home_team.name;
    self.guestTeamLabel.text = ((Livescores*)[livescores objectAtIndex:indexPath.row]).guest_team.name;
    self.scoreLabel.text = [NSString stringWithFormat:@"%ld : %ld", (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.current.home_team, (long)((Livescores*)[livescores objectAtIndex:indexPath.row]).score.current.guest_team];
    
}



@end
