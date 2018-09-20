//
//  shareCell.h
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shareCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic, strong) tourDetaisData *data;
@property (copy,nonatomic) void (^lookSharedUrl)(travelSharingsS *data);
@end
