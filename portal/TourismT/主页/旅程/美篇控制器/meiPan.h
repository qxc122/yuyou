//
//  meiPan.h
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface meiPan : basicVc
@property (nonatomic,assign) NSInteger orderId; 
@property (nonatomic, strong) NSMutableArray *seleImages;//选中的照片


//编辑用到
@property (nonatomic,strong) travelSharingsS *dateOne;

//草稿箱过来的  草稿路径
@property (nonatomic,strong) NSString *path;




@property (nonatomic,strong) orderlistForOneS *date;  // 选择的订单

@property (nonatomic,assign) BOOL isFromPingJia;  //从评价过来的
@end
