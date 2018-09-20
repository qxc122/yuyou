//
//  headLastOkCell.h
//  TourismT
//
//  Created by Store on 2017/3/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface headLastOkCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) NSString *titleStr;
@end
