//
//  myCodeYHQ.h
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"

@interface myCodeYHQ : basicUiTableView
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(YHQoneS *YHQSoneDate);
@property (nonatomic,strong) NSString *status; //如果staue


@property (nonatomic,strong) NSString *orderSn; //是下订单 控制器过来的
@property (nonatomic,assign) NSInteger travelId; //是下订单 控制器过来的
@end
