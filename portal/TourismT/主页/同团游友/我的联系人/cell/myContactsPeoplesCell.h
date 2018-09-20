//
//  myContactsPeoplesCell.h
//  TourismT
//
//  Created by Store on 2017/1/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myContactsPeoplesCell : UITableViewCell
@property (nonatomic,strong) id oneoe;
@property (nonatomic,assign) NSInteger index; //
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^YESorNOClick)(NSInteger index);



@property (nonatomic,assign) NSInteger MySelf; //  自己的id

@property (nonatomic,assign) BOOL isChat; //是否是聊天
@end
