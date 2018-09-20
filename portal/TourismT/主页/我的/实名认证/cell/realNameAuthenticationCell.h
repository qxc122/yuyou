//
//  realNameAuthenticationCell.h
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface realNameAuthenticationCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^SelectBank)();
/**
 *  短信发送成功
 */
@property (nonatomic, copy) void (^sendSmsOK)();
@property (nonatomic,strong) BindBankCard *BankCardDate;

@property (nonatomic,assign) BOOL Bind;
@end
