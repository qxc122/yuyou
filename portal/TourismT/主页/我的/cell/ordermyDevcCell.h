//
//  ordermyDevcCell.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ordermyDevcCell_btnEnum)
{
    all_ordermyDevcCell_btnEnum,//
    one_ordermyDevcCell_btnEnum,//
    two_ordermyDevcCell_btnEnum,//
    three_ordermyDevcCell_btnEnum,//
    four_ordermyDevcCell_btnEnum,//
};


@interface ordermyDevcCell : UITableViewCell
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(ordermyDevcCell_btnEnum index);
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) myAppInfoS *date;
@end
