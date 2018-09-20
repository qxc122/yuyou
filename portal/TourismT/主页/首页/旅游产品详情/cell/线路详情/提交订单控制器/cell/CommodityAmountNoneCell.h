//
//  CommodityAmountNoneCell.h
//  TourismT
//
//  Created by Store on 2017/5/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"


@interface CommodityAmountNoneCell : UITableViewCell
@property (nonatomic,weak) UILabel *title2;  //title2
@property (nonatomic,weak) UIView *back;
@property (nonatomic,weak) TTTAttributedLabel *des;  

+ (instancetype)returnCellWith:(UITableView *)tableView;

/**
 *  去选择优惠券
 */
@property (nonatomic, copy) void (^goToSlecetYHQ)();

/**
 *  去看协议
 */
@property (nonatomic, copy) void (^goToViewXieYi)(NSURL *url);
@property (nonatomic,strong) orderInfo *orderinfoData;//订单信息
@property (nonatomic,weak) UILabel *moneyAll;
@property (nonatomic,weak) UILabel *youhui;
@property (nonatomic,strong) YHQoneS *YHQSoneDate;//优惠码
@end
