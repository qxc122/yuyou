//
//  TransactionDetailsCell.h
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TransactionDetailsCell : UITableViewCell
@property (nonatomic,strong) rePaymentInfoAllForONeS *date;
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
