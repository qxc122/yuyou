//
//  titleCell.h
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleCell : UITableViewCell
@property (nonatomic,strong) NSString *titleStr;
@property (nonatomic,strong) NSString *startTime;
@property (nonatomic,strong) NSArray *startPlace;
@property (nonatomic,strong) NSArray *priceMonthsA;
@property (nonatomic,assign) BOOL isPeriod;
+ (instancetype)returnCellWith:(UITableView *)tableView;

/**
 *  点击下一步的回调
 */
@property (nonatomic, copy) void (^reselectDateClick)(NSString *startDate);
@end

