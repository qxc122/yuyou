//
//  homeTwoWillGoCell.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTwoWillGoCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) UserS *date;
/**
 *  点击类型 中的某一个
 */
@property (nonatomic, copy) void (^SelectionIndex)(UserS *date);
/**
 *  点击了头像
 */
@property (nonatomic, copy) void (^IconClick)(UserS *date);
@end
