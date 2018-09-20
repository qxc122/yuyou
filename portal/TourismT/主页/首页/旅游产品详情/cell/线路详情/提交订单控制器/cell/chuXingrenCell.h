//
//  chuXingrenCell.h
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chuXingrenCell : UITableViewCell
/**
 *  点击每个cell的回调
 */
@property (nonatomic, copy) void (^btnDeleClick)(NSInteger index);
@property (nonatomic, assign) NSInteger index;
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic,strong) travellerS *peopleOne;
@end
