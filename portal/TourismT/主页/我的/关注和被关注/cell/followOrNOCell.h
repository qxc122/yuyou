//
//  followOrNOCell.h
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface followOrNOCell : UITableViewCell
@property (nonatomic,strong) UserS *oneoe;
@property (nonatomic,assign) BOOL isGuangzhu; //YES是关注
@property (nonatomic,assign) NSInteger index; //
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^YESorNOClick)(NSInteger index,BOOL isGuangzhu);
@end
