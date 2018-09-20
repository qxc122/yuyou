//
//  moreChaat.h
//  TourismT
//
//  Created by Store on 2017/1/18.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"
typedef NS_ENUM(NSInteger, moreChaat_ENMU)
{
    WXPYQ_moreChaat_ENMU,//姓
    WXHY_moreChaat_ENMU,//名
    ALLPEO_moreChaat_ENMU,//护照
    DELET_moreChaat_ENMU,//过期时间
    QUXIAO_moreChaat_ENMU,//出生日期
};


@interface moreChaat : windosView
/**
 *  填写了信息的时候用到
 */
@property (copy,nonatomic) void (^cilcktype)(moreChaat_ENMU type);
@end
