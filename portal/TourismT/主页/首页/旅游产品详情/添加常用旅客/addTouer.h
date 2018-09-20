//
//  addTouer.h
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"
typedef NS_ENUM(NSInteger, GJI_or_Gnei_ENMU)
{
    GN_GJI_or_Gnei_ENMU,//国内
    GJ_GJI_or_Gnei_ENMU,//国际
};
@interface addTouer : basicVc
@property (nonatomic,strong) travellerS *peopleOne;//编辑时候用到的联系人  或者添加的时候用到
@property (nonatomic,assign) BOOL isEdit; //默认是 添加 NO
@property (nonatomic,assign) GJI_or_Gnei_ENMU type;
/**
 *  添加的旅游人
 */
@property (copy,nonatomic) void (^editORaddTouerClick)(BOOL isEdit,travellerS *peopleOne);


@property (nonatomic,strong) NSString *idType;//出游的类型  国际还是国内
@end
