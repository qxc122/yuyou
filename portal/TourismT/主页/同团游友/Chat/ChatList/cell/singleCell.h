//
//  singleCell.h
//  TourismT
//
//  Created by Store on 2017/6/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "baseConversationListCell.h"

@interface singleCell : baseConversationListCell
+ (instancetype)returnCellWith:(UITableView *)tableView;


@property (nonatomic,strong) myAppInfoS *date;
@end
