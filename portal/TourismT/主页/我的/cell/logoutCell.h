//
//  logoutCell.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface logoutCell : UITableViewCell
/**
 *  去登录
 */
@property (nonatomic, copy) void (^toGologinbtnClick)();
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
