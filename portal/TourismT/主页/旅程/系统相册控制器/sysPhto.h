//
//  sysPhto.h
//  TourismT
//
//  Created by Store on 16/12/28.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"

@interface sysPhto : basicVc
/**
 *  点击每个cell的回调  选择或者取消
 */
@property (nonatomic,strong) SelectOrder_date *dateSelectOrder;
@property (nonatomic, copy) void (^returnClick)(NSArray *images);
@property (nonatomic,assign) NSInteger orderId;  //没有id说明是从我的信息进来的

@property (nonatomic,assign) NSInteger MAXnum;  //最多可以选择多少张
@property (nonatomic,assign) NSInteger isSelected;  //前面控制器已经选了多少张
//@property (nonatomic, strong) NSMutableArray *seleImagesmeiPan;//meiPan 控制带来的选中的照片


@property (nonatomic,assign) BOOL isEdit;  //是否是选择我的头像 控制器
@property (nonatomic, copy) void (^returnImage)(id image);


@property (nonatomic,assign) BOOL isPingjia;  //是否是从评价控制器来的
@property (nonatomic, copy) void (^returnImageForPingjia)(NSArray *images);

@property (nonatomic,assign) BOOL Is_there_a_preview_button;  //是否有预览按钮  默认是有的

@property (nonatomic,assign) BOOL isFromPingJia;  //从评价过来的
@end
