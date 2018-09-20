//
//  timeCell.h
//  TourismT
//
//  Created by Store on 2017/8/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface timeCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,weak) NSString *timeStr;
@end
