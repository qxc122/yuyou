//
//  mainDetailCell.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface mainDetailCell : UITableViewCell
/**
 *  申请退款
 */
@property (copy,nonatomic) void (^btnClick)();
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) orderDeatailS *detail;

@end
