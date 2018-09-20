//
//  myOreserDetail.h
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//


#import "basicUiTableView.h"
typedef NS_ENUM(NSInteger, myOreserFiveAll_type)
{
    ALL_myOreserFiveAll_type,//全部
    TOPAY_myOreserFiveAll_type,//待付款
    TOdianping_myOreserFiveAll_type,//待点评
    toGo_myOreserFiveAll_type,//待出游
    tuikuang_myOreserFiveAll_type,//退款
};



typedef NS_ENUM(NSInteger, myOreserDetail_type)
{
    TOPAY_myOreserDetail_type,//待付款
    TOdianping_myOreserDetail_type,//已经出行过
    chanel_myOreserDetail_type,//已经取消
    tuikuang_myOreserDetail_type,//退款和  退款中 和申请退款
};


@interface myOreserDetail : basicUiTableView
//@property (nonatomic,assign)BOOL isPlaceOrder; //提交订单页面来的

@property (nonatomic,strong)Class classNmae; //要关闭的控制器

//@property (nonatomic,assign)myOreserFiveAll_type type;
@property (nonatomic,strong) orderlistForOneS *datess;
//@property (nonatomic,assign)myOreserDetail_type type;
@end
