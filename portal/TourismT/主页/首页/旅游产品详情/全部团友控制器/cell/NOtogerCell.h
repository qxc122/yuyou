//
//  NOtogerCell.h
//  TourismT
//
//  Created by Store on 2017/1/12.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NOtogerCell : UITableViewCell
@property (nonatomic,strong) UserS *UserD;
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
