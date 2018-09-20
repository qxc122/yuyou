//
//  BottomDetaisCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "BottomDetaisCell.h"
#import "YX.h"

@interface BottomDetaisCell ()
@property (nonatomic, weak) BottomDetailsTableView *tabTitleView;
@end

@implementation BottomDetaisCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    BottomDetaisCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[BottomDetaisCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        BottomDetailsTableView *itemBaseView = [[BottomDetailsTableView alloc] init];
        NSDictionary *info = @{
                               @"title":@"图文介绍",
                               @"view":@"AlreadyReleased",
                               @"data":@"图文介绍的数据",
                               @"position":@0,
                               @"kGoTopNotificationNamestr":kGoTopNotificationNameDetai,
                               @"kLeaveTopNotificationNamestr":kLeaveTopNotificationNameDetai,
                               @"kTabTitleViewHeightf":@0.0,
                               @"kBottomBarHeightf":@0.0
                               };
        [itemBaseView renderUIWithInfo:info];
        itemBaseView.tableView.frame = CGRectMake(0, 0, ScreenWidth, heigtTwo);
        itemBaseView.tableView.showsVerticalScrollIndicator = NO;
//        itemBaseView.tableView.bounces = NO;
        itemBaseView.frame = CGRectMake(0, 0, ScreenWidth, heigtTwo);
        [self.contentView addSubview:itemBaseView];
        self.tabTitleView = itemBaseView;
        
        kWeakSelf(self);
        itemBaseView.btnClick = ^(BottomDetailsTableViewFoot_type type) {
            if (weakself.btnClick) {
                weakself.btnClick(type);
            }
            NSLog(@"type=%ld",(long)type);
        };
        itemBaseView.lookMore = ^{
            if (weakself.lookMore) {
                weakself.lookMore();
            }
        };
        itemBaseView.lookWebUrl = ^(NSURL *url) {
            if (weakself.lookWebUrl) {
                weakself.lookWebUrl(url);
            }
        };
        itemBaseView.lookSharedUrl = ^(travelSharingsS *data) {
            if (weakself.lookSharedUrl) {
                weakself.lookSharedUrl(data);
            }
        };
        itemBaseView.lookTravelItinerary = ^() {
            if (weakself.lookTravelItinerary) {
                weakself.lookTravelItinerary();
            }
        };
        itemBaseView.lookDetail = ^(NSURL *url,NSString *title) {
            if (weakself.lookDetail) {
                weakself.lookDetail(url,title);
            }
        };
    }
    return self;
}
- (void)setData:(tourDetaisData *)data{
    _data = data;
    self.tabTitleView.data = data;
}
@end
