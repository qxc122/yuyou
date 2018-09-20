//
//  SelectOrderVc.h
//  TourismT
//
//  Created by Store on 2017/6/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"

@interface SelectOrderVc : basicUiTableView
@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic, strong) NSMutableArray *seleImages;//选中的照片

@property (nonatomic,strong) SelectOrder_date *date;
@end
