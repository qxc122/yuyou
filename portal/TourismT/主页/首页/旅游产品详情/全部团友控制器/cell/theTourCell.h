//
//  theTourCell.h
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface theTourCell : UITableViewCell
@property (nonatomic,assign) BOOL isHidenBtn; //是否隐藏 一同出行 按钮   默认不隐藏
@property (nonatomic,strong) UserS *UserD;
@property (nonatomic,assign) NSInteger index;
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^togetherClick)(NSInteger index);
@end
