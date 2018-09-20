//
//  lastOkTwoCell.h
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lastOkTwoCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) travellerS *peoOne;
@property (nonatomic,assign) BOOL isHidenImage;
@end
