//
//  emptyCell.h
//  TourismT
//
//  Created by Store on 2017/1/12.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface emptyCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) NSString *imageStr;
@property (nonatomic,strong) NSString *desStr;
@end
