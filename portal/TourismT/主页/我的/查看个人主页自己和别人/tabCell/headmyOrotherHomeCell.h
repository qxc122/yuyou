//
//  headmyOrotherHomeCell.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, headmyOrotherHomeCell_enmu)
{
    backheadmyOrotherHomeCell_enmu,//返回
    iconheadmyOrotherHomeCell_enmu,//头像
    numheadmyOrotherHomeCell_enmu,//旅程数
    guanzhuheadmyOrotherHomeCell_enmu,//关注
    beiguanzhuheadmyOrotherHomeCell_enmu,//被关注
    eidtdmyOrotherHomeCell_enmu,//去编辑
};

@interface headmyOrotherHomeCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^btnClick)(headmyOrotherHomeCell_enmu type);
@property (nonatomic,assign) BOOL isMy; //是否是查看自己的个人主页
@property (nonatomic,strong) peoHome_page *oneData;
@end
