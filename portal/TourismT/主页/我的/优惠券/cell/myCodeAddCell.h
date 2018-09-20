//
//  myCodeAddCell.h
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myCodeAddCell : UITableViewCell
/**
 *  点击每个btn的回调
 */
@property (nonatomic, copy) void (^btnClick)(NSString *code);
+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
