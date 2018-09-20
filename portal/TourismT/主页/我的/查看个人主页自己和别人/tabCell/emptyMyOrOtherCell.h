//
//  emptyMyOrOtherCell.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface emptyMyOrOtherCell : UITableViewCell
@property (nonatomic,strong) NSString *imageStr;
@property (nonatomic,strong) NSString *desStr;
+ (instancetype)returnCellWith:(UITableView *)tableView;


@end
