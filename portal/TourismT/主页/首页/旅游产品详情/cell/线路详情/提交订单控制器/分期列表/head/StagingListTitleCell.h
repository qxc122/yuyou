//
//  StagingListTitleCell.h
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StagingListTitleCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;

/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^closeStagingList)();
@end
