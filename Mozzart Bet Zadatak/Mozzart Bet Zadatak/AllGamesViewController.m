//
//  FirstViewController.m
//  Mozzart Bet Zadatak
//
//  Created by Marija Sumakovic on 5/26/17.
//  Copyright © 2017 Marija Sumakovic. All rights reserved.
//

#import "AllGamesViewController.h"
#import "LivescoreResponse.h"
#define SPORT_ID    1

@interface AllGamesViewController ()

@property (strong, nonatomic) NSArray *livescoresArray;

@end

@implementation AllGamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.restService getAllMatchesWithSportID:[NSNumber numberWithInt:SPORT_ID] withSuccess:^(LivescoreResponse *livescoresResponse){
        NSLog(@"%@", livescoresResponse);
        self.livescoresArray = livescoresResponse.livescores;
    }failure:^(MozzartError *error) {
        NSLog(@"Error");
    }];
   
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UITableViewDataSource

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    long sections = 1;
//    if (tableView == self.followingTableView && [self.followingArray count]>0) {
//        sections=[self.followingArray count];
//    }
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows=1;
    
//    if (tableView == self.tableView) {
//        rows = [self.newsArray count];
//        
//    }
//    else if (tableView == self.followingTableView) {
//        rows = [self.followingArray count]>0?1:0;
//    }
    
    return  rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    static NSString *cellIdentifier;
    
    CGFloat rowHeight = 0;
    
//    if (tableView == self.tableView) {
//        cellIdentifier = FOLLOWING_NEWS_TABLE_VIEW_CELL_REUSE_ID;
//        FollowingNewsTableViewCell* followingCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//        if (followingCell == nil)
//        {
//            followingCell = [[FollowingNewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        }
//       
//        cell = newsCell;
//        
//    }
    
    return [UITableViewCell new];
}
//
//
//
//#pragma mark - UITableViewDelegate
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    if (self.newsTableView == tableView) {
//        return [UIView new];
//    }
//    if ([self.followingArray count]==0) {
//        return [UIView new];
//    }
//    static NSString *headerIdentifier = FOLLOWING_NEWS_HEADER_VIEW_REUSE_ID;
//    FollowingNewsHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerIdentifier];
//    if (headerView == nil)
//    {
//        headerView = [[FollowingNewsHeaderView alloc] initWithReuseIdentifier: headerIdentifier];
//    }
//    if (section<[self.followingArray count]) {
//        FollowingNews* followingNews = [self.followingArray objectAtIndex:section];
//        headerView.mainView.frame = CGRectMake(headerView.mainView.frame.origin.x, headerView.mainView.frame.origin.y, self.followingTableView.frame.size.width-2*headerView.mainView.frame.origin.x, headerView.mainView.frame.size.height);
//        [headerView adjustCellForFollowingNews:followingNews andMainView:headerView.mainView];
//        headerView.delegate = self;
//    }
//    return headerView;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    if (self.newsTableView == tableView) {
//        return 0.01f;
//    }
//    if (section< [self.followingArray count]){
//        FollowingNews* followingNews = [self.followingArray objectAtIndex:section];
//        NSString* htmlString = followingNews.templateForm;
//        
//        NSRange range = [htmlString rangeOfString:@"$a"];
//        if (range.location != NSNotFound){
//            NSString* allActorNames = @"";
//            for (int i = 0; i< [followingNews.actorFullNames count]; i++) {
//                if (![allActorNames isEqualToString:@""]) {
//                    if (i==[followingNews.actorFullNames count]-1) {
//                        allActorNames = [NSString stringWithFormat:@"%@ & <a style=\"text-decoration:none;color: black\" href=\"actor://%@\">%@</a>",allActorNames,[followingNews.actorIds objectAtIndex:i],[followingNews.actorFullNames objectAtIndex:i]];
//                    }else{
//                        allActorNames = [NSString stringWithFormat:@"%@, <a style=\"text-decoration:none;color: black\" href=\"actor://%@\">%@</a>",allActorNames,[followingNews.actorIds objectAtIndex:i],[followingNews.actorFullNames objectAtIndex:i]];
//                    }
//                }else{
//                    allActorNames = [NSString stringWithFormat:@"<a style=\"text-decoration:none;color: black\" href=\"actor://%@\">%@</a>",[followingNews.actorIds objectAtIndex:i],[followingNews.actorFullNames objectAtIndex:i]];
//                }
//                
//            }
//            htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$a"
//                                                               withString:allActorNames];
//        }
//        
//        range = [htmlString rangeOfString:@"$v"];
//        if (range.location != NSNotFound){
//            htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$v"
//                                                               withString:followingNews.verb?followingNews.verb:@""];
//        }
//        
//        range = [htmlString rangeOfString:@"$o"];
//        if (range.location != NSNotFound){
//            htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$o"
//                                                               withString:followingNews.objectOwnerId && followingNews.objectOwnerName?[NSString stringWithFormat:@"<a style=\"text-decoration:none;color: black\" href=\"object://%@\">%@</a>",followingNews.objectOwnerId,followingNews.objectOwnerName]:@""];
//        }
//        
//        NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
//        
//        NSAttributedString *attrString = [[NSAttributedString alloc] initWithHTMLData:data
//                                                                   documentAttributes:NULL];
//        
//        
//        DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:attrString];
//        
//        CGRect maxRect = CGRectMake(0, 0, tableView.frame.size.width, CGFLOAT_HEIGHT_UNKNOWN);
//        NSRange entireString = NSMakeRange(0, [attrString length]);
//        DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:maxRect range:entireString];
//        
//        CGSize sizeNeeded = [layoutFrame frame].size;
//        return MAX(sizeNeeded.height,18) + 28;
//    }
//    
//    return 0.01f;
//}
//
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    return [UIView new];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.01f;
//}
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    
//    if (tableView == self.newsTableView) {
//        News* news = [self.newsArray objectAtIndex:indexPath.row];
//        
//        [self addTotalClicksOnEveryTypeOfNotificationLocalyticsWithType:@"News feed" andWithEventType:news.type];
//        
//        if ([news.type isEqualToString:NEWS_TYPE_FOLLOWING] && news.actorId && ![news.actorId isEqualToString:@""]) {
//            [self goToProfileWithUserId:news.actorId];
//        }else if([news.type isEqualToString:NEWS_TYPE_VOTING] && news.objectId && ![news.objectId isEqualToString:@""]){
//            [self goToQuestionWithQuestionId:news.objectId];
//        }else if([news.type isEqualToString:NEWS_TYPE_COMMENTING] && news.objectId && ![news.objectId isEqualToString:@""]){
//            [self goToCommentsForQuestionWithId:news.objectId];
//        }else if([news.type isEqualToString:NEWS_TYPE_MENTIONING_YOU] && news.objectId && ![news.objectId isEqualToString:@""]){
//            [self goToCommentsForQuestionWithId:news.objectId];
//        }else if([news.type isEqualToString:NEWS_TYPE_EXPERT_STATUS]){
//            [self goToAchievements];
//        }else if([news.type isEqualToString:NEWS_TYPE_GIFT] && news.actorId && ![news.actorId isEqualToString:@""]){
//            //TODO: go to T-Shirt store
//        }else if([news.type isEqualToString:NEWS_TYPE_FOLLOWED_ADVICE]){
//            [self goToAchievements];
//        }else if([news.type isEqualToString:NEWS_TYPE_DECIDE_REMINDER] && news.objectId && ![news.objectId isEqualToString:@""]){
//            [self goToQuestionWithQuestionId:news.objectId];
//        }else if([news.type isEqualToString:NEWS_TYPE_LOSING_EXPERT_STATUS_REMINDER]){
//            [self goToAchievements];
//        }else if([news.type isEqualToString:NEWS_TYPE_LOSING_EXPERT_STATUS]){
//            [self goToAchievements];
//        }else if([news.type isEqualToString:NEWS_TYPE_HOT_NOW]){
//            [self goToHotNowToPost:news];
//        }else if ([news.type isEqualToString:NEWS_TYPE_ASKING]) {
//            [self goToQuestionWithQuestionId:news.objectId];
//        }
//    }else if (tableView == self.followingTableView){
//        FollowingNews* followingNews = [self.followingArray objectAtIndex:indexPath.section];
//        
//        [self addTotalClicksOnEveryTypeOfNotificationLocalyticsWithType:@"Following feed" andWithEventType:followingNews.type];
//        
//        if([followingNews.type isEqualToString:FOLLOWING_NEWS_TYPE_VOTING] && followingNews.objectId){
//            [self goToQuestionWithQuestionId:followingNews.objectId];
//        }else if([followingNews.type isEqualToString:FOLLOWING_NEWS_TYPE_COMMENTING] && followingNews.objectId){
//            [self goToQuestionWithQuestionId:followingNews.objectId];
//        }
//        else if ([followingNews.type isEqualToString:FOLLOWING_TYPE_DECIDED] && followingNews.objectId) {
//            [self goToQuestionWithQuestionId:followingNews.objectId];
//        }
//    }
//    
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat rowHeight = 0;
//    
//    if (tableView == self.followingTableView) {
//        
//        if (indexPath.section < [self.followingArray count]) {
//            FollowingNews* followingNews = [self.followingArray objectAtIndex:indexPath.section];
//            CGRect questionFrame = [followingNews.objectName boundingRectWithSize:CGSizeMake(tableView.frame.size.width-65-10, 0)
//                                                                          options:NSStringDrawingUsesLineFragmentOrigin
//                                                                       attributes:@{ NSFontAttributeName:[UIFont getRegularFontForSize:12] }
//                                                                          context:nil];
//            if (questionFrame.size.height<18) {
//                rowHeight = 63;
//            }else{
//                rowHeight = 76;
//            }
//        }
//        
//        
//    }
//    else if (tableView == self.newsTableView) {
//        
//        if (indexPath.row < [self.newsArray count]) {
//            
//            
//            
//            News* news = [self.newsArray objectAtIndex:indexPath.row];
//            
//            NSString* htmlString = news.templateForm;
//            
//            NSRange range = [htmlString rangeOfString:@"$a"];
//            if (range.location != NSNotFound){
//                htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$a"
//                                                                   withString:news.actorId && news.actorFullName?[NSString stringWithFormat:@"<a style=\"text-decoration:none;color: black\" href=\"user://%@\">%@</a>",news.actorId,news.actorFullName]:@""];
//            }
//            
//            range = [htmlString rangeOfString:@"$v"];
//            if (range.location != NSNotFound){
//                htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$v"
//                                                                   withString:news.verb?news.verb:@""];
//            }
//            
//            range = [htmlString rangeOfString:@"$o"];
//            if (range.location != NSNotFound){
//                htmlString = [htmlString stringByReplacingOccurrencesOfString:@"$o"
//                                                                   withString:news.objectName?news.objectName:@""];
//            }
//            
//            NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
//            
//            NSAttributedString *attrString = [[NSAttributedString alloc] initWithHTMLData:data
//                                                                       documentAttributes:NULL];
//            
//            DTCoreTextLayouter *layouter = [[DTCoreTextLayouter alloc] initWithAttributedString:attrString];
//            
//            CGRect maxRect = CGRectMake(0, 0, tableView.frame.size.width-10-65, CGFLOAT_HEIGHT_UNKNOWN);
//            NSRange entireString = NSMakeRange(0, [attrString length]);
//            DTCoreTextLayoutFrame *layoutFrame = [layouter layoutFrameWithRect:maxRect range:entireString];
//            
//            CGSize sizeNeeded = [layoutFrame frame].size;
//            
//            //        return MAX(sizeNeeded.height,18)+45;
//            
//            if (sizeNeeded.height < 18) {
//                rowHeight = 63;
//            }else{
//                rowHeight = 76;
//            }
//        }else{
//            rowHeight = 63;
//        }
//        
//    }
//    
//    return  rowHeight;
//}
//
//
//

@end
