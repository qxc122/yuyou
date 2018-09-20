//
//  CommodityAmountCell.h
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CommodityAmountNoneCell.h"

@interface CommodityAmountCell : CommodityAmountNoneCell
@property (nonatomic,weak) UILabel *Adult;
@property (nonatomic,weak) UILabel *AdultPrice;
@property (nonatomic,weak) UILabel *AdultNum;
@property (nonatomic,weak) UIView *line2;

+ (instancetype)returnCellWith:(UITableView *)tableView;

//- (void)setOrderinfoData:(orderInfo *)orderinfoData;
@end
