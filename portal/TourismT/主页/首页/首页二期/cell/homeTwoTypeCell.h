//
//  homeTwoTypeCell.h
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeTwoTypeCell : UITableViewCell
/**
 *  点击类型
 */
@property (nonatomic, copy) void (^SelectionType)(NSInteger type);
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,assign) NSInteger Row; //选中的Row

@property (nonatomic,strong) homeDataV2 *date;  
@end
