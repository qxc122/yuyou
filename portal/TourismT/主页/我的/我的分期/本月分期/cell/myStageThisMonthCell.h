//
//  myStageThisMonthCell.h
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, myStageThisMonthCell_enum)
{
    list_myStageThisMonthCell_enum,//分期明细
    detail_myStageThisMonthCell_enum,//商品详情
};


@interface myStageThisMonthCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) myStageHomeListForOne *date;
/**
 *  去查看分期明细
 */
@property (nonatomic, copy) void (^goToViewstaues)(myStageHomeListForOne *date,myStageThisMonthCell_enum type);
@end
