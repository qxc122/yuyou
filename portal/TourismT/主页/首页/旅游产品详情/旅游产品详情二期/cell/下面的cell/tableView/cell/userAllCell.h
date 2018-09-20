//
//  userAllCell.h
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface userAllCell : UITableViewCell
@property (nonatomic,strong) NSArray *arryA;
/**
 *  点击查看更多
 */
@property (copy,nonatomic) void (^lookMore)();
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
