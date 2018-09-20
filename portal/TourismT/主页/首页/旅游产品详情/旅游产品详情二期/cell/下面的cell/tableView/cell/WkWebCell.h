//
//  WkWebCell.h
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WkWebCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSString *titleStr;

/**
 *  点击查看 网页详情
 */
@property (copy,nonatomic) void (^lookDetail)(NSURL *url,NSString *title);
@end
