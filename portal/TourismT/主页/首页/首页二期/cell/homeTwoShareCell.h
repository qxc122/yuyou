//
//  homeTwoShareCell.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTwoShareCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;

@property (nonatomic,strong) travelSharingsS *date;
/**
 *  点击类型 中的某一个
 */
@property (nonatomic, copy) void (^SelectionIndex)(travelSharingsS *date);

/**
 *  点击了头像
 */
@property (nonatomic, copy) void (^IconClick)(NSNumber *idd);
@end
