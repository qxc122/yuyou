//
//  TravelItineraryDetailVc.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelItineraryDetailVc.h"
#import "ReminderCell.h"
#import "dayDetailCell.h"
#import "ContentDetailCell.h"
#import "ImageDetailCell.h"
#import "TravelItineraryDetailCellHead.h"
@interface TravelItineraryDetailVc ()

@end

@implementation TravelItineraryDetailVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStylePlain;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.basicTableView registerClass:[ReminderCell class] forCellReuseIdentifier:NSStringFromClass([ReminderCell class])];
    [self.basicTableView registerClass:[dayDetailCell class] forCellReuseIdentifier:NSStringFromClass([dayDetailCell class])];
    [self.basicTableView registerClass:[ContentDetailCell class] forCellReuseIdentifier:NSStringFromClass([ContentDetailCell class])];
    [self.basicTableView registerClass:[ImageDetailCell class] forCellReuseIdentifier:NSStringFromClass([ImageDetailCell class])];
    //test
    self.empty_type = succes_empty_num;

    
    [self.header beginRefreshing];
    self.footer.hidden = YES;
}

- (void)loadNewData{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.header endRefreshing];
    });
}

#pragma -mark<多少组>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

#pragma -mark<每组cell的数量>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    } else {
        return 4;
    }
    return 0;
}

#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ReminderCell *cell = [ReminderCell returnCellWith:tableView];
        [self configureReminderCell:cell atIndexPath:indexPath];
        return  cell;
    } else {
        if (indexPath.row == 0) {
            dayDetailCell *cell = [dayDetailCell returnCellWith:tableView];
            [self configuredayDetailCell:cell atIndexPath:indexPath];
            return  cell;
        } else if (indexPath.row == 1) {
            ContentDetailCell *cell = [ContentDetailCell returnCellWith:tableView];
            [self configureContentDetailCell:cell atIndexPath:indexPath];
            return  cell;
        } else if (indexPath.row == 2) {
            ContentDetailCell *cell = [ContentDetailCell returnCellWith:tableView];
            [self configureContentDetailCell:cell atIndexPath:indexPath];
            return  cell;
        } else if (indexPath.row == 3) {
            ImageDetailCell *cell = [ImageDetailCell returnCellWith:tableView];
            [self configureImageDetailCell:cell atIndexPath:indexPath];
            return  cell;
        }
    }
    return nil;
}


#pragma --mark< 头部高度>
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {

    } else {
        return 50+15+15;
    }
    return 0.01;
}
#pragma --mark< 头部视图>
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
    } else {
        TravelItineraryDetailCellHead *head = [TravelItineraryDetailCellHead new];
        return head;
    }
    return nil;
}
#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ReminderCell class]) configuration:^(ReminderCell *cell) {
            [weakself configureReminderCell:cell atIndexPath:indexPath];
        }];
    } else {
        if (indexPath.row == 0) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([dayDetailCell class]) configuration:^(dayDetailCell *cell) {
                [weakself configuredayDetailCell:cell atIndexPath:indexPath];
            }];
        } else if (indexPath.row == 1) {
//            return 1000;
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ContentDetailCell class]) configuration:^(ContentDetailCell *cell) {
                [weakself configureContentDetailCell:cell atIndexPath:indexPath];
            }];
        } else if (indexPath.row == 2) {
//            return 1000;
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ContentDetailCell class]) configuration:^(ContentDetailCell *cell) {
                [weakself configureContentDetailCell:cell atIndexPath:indexPath];
            }];
        } else if (indexPath.row == 3) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([ImageDetailCell class]) configuration:^(ImageDetailCell *cell) {
                [weakself configureImageDetailCell:cell atIndexPath:indexPath];
            }];
        }
    }
    return 0.0;
}

#pragma --mark<选中了cell>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}



#pragma --mark< 配置cell 的数据>
- (void)configureReminderCell:(ReminderCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma --mark< 配置cell 的数据>
- (void)configuredayDetailCell:(dayDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma --mark< 配置cell 的数据>
- (void)configureContentDetailCell:(ContentDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath {

}
#pragma --mark< 配置cell 的数据>
- (void)configureImageDetailCell:(ImageDetailCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
}
@end
