//
//  realNameAuthenticationVc.h
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//


#import "basicUiTableView.h"

@interface realNameAuthenticationVc : basicUiTableView
@property (nonatomic,strong) BindBankCard *BankCardDate;
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^AuthenticationSuccess)();
@end
