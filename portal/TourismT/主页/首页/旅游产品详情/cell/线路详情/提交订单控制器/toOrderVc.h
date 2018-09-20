//
//  toOrderVc.h
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"

@interface toOrderVc : basicUiTableView
@property (nonatomic,strong) detailS *detailD; //旅游产品信息,上一页面带来
@property (nonatomic,strong) NSString *startDate;// 出发日期
@property (nonatomic,strong) NSString *code;//选择的分期
@property (nonatomic,assign) NSInteger travelSpecificationId;//选择的规格

@property (nonatomic,assign) BOOL isTogether;// 是否是从 同游控制器来的
@property (nonatomic,assign) NSInteger traid;//
@end
