//
//  StagingDetailsListHeadCell.h
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StagingDetailsListHeadCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) periodItemListAForAll *date;
@end
