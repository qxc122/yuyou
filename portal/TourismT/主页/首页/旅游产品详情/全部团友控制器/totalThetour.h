//
//  totalThetour.h
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"


@interface totalThetour : basicUiTableView


@property (nonatomic,assign) BOOL isHidenBtn; //是否隐藏 一同出行 按钮   默认不隐藏



@property (nonatomic,strong) detailS *detailD; //旅游产品信息,上一页面带来

@property (nonatomic,assign) NSInteger traid;//  从与游 过来的


@property (copy,nonatomic) void (^SelectDate)(UserS *date);

@property (nonatomic, strong) tourDetaisData *data;
@property (copy,nonatomic) void (^TravelTogether)(NSInteger type,NSInteger month,pricesS *StartDate);
@end
