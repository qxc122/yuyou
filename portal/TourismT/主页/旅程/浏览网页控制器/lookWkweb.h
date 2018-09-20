//
//  lookWkweb.h
//  TourismT
//
//  Created by Store on 16/12/31.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface lookWkweb : basicVc
@property (nonatomic,assign) BOOL isHaveShareImage; //是否有分享图片 默认没有
@property (nonatomic,assign) BOOL isPresent; //是 Present 出来的
@property (nonatomic, strong) NSString *titleStr;



@property (nonatomic,assign) BOOL IsHaveshareBtn; //是否有分享按钮
@property (nonatomic,assign) BOOL IsHaveDelBtn; //是否有删除按钮
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) travelSharingsS *dateOne;


@property (nonatomic,assign) BOOL IsdemeiPan; //是否去除meiPan 这个上一个控制器

@property (nonatomic,assign) BOOL IsxiangshiOKbtn; //是否直接显示完成按钮  从个人主页去的时候设置为YES

@property (nonatomic,assign) NSInteger orderId;

//@property (nonatomic,strong) travelSharingsS *shareDate;


@property (nonatomic,assign) BOOL isHaveRightBtnb; //是否有右边的按钮

@property (nonatomic,assign) BOOL isHaveRightBtnDelete; //右边是否有删除按钮

/**
 *  点击查看旅程提醒
 */
//@property (copy,nonatomic) void (^Deleted)(travelSharingsS *dateOne);
@end
