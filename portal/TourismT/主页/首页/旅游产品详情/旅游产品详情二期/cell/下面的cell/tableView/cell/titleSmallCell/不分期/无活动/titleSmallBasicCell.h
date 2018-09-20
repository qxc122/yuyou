//
//  titleSmallBasicCell.h
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface titleSmallBasicCell : UITableViewCell
+ (instancetype)returnCellWith:(UITableView *)tableView;
@property (nonatomic, strong) tourDetaisData *data;


@property (nonatomic,weak) UILabel *price;

@property (nonatomic,weak) UIView *lineBottom;
@end
