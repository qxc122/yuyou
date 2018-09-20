//
//  touerCell.h
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface touerCell : UITableViewCell
@property (nonatomic,strong) travellerS *peopleOne;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,assign) BOOL idMyGo;
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  选中旅游人
 */
@property (copy,nonatomic) void (^touerGOTOClick)(NSInteger index,BOOL idMyGo,travellerS *peopleOne);
/**
 *  编辑旅游人
 */
@property (copy,nonatomic) void (^editTouerClick)(NSInteger index,travellerS *peopleOne);
/**
 *  删除旅游人
 */
@property (copy,nonatomic) void (^deleteTouerClick)(NSInteger index,travellerS *peopleOne);
@end
