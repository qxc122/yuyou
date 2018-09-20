//
//  myCodeCell.h
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCodeCell : UITableViewCell
@property (nonatomic,strong) YHQoneS *YHQSoneDate;
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
