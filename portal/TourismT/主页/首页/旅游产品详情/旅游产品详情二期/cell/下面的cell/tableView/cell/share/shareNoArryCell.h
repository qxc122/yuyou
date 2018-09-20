//
//  shareNoArryCell.h
//  TourismT
//
//  Created by Store on 2017/8/29.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface shareNoArryCell : UITableViewCell
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UIImageView *desimage;
@property (nonatomic, strong) tourDetaisData *data;
@property (nonatomic,weak) UIView *lineOne;

+ (instancetype)returnCellWith:(UITableView *)tableView;
@end
