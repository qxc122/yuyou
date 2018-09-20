//
//  StagingListCell.h
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StagingListCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) jisuanInfoForOne *date; //分期明细 其中一个
@end
