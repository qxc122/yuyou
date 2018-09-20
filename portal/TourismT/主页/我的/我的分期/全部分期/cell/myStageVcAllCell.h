//
//  myStageVcAllCell.h
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, myStageVcAllCell_btnEnum)
{
    list_myStageVcAllCell_btnEnum,//看明细
    pay_myStageVcAllCell_btnEnum,//还款
    viewUrl_myStageVcAllCell_btnEnum,//看网页
};


@interface myStageVcAllCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) myStageHomeListForOne *date; 
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(myStageVcAllCell_btnEnum type,NSURL *url);
/**
 *  点击协议
 */
@property (nonatomic, copy) void (^btnClickAgrrment)();
@end
