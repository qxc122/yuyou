//
//  myContactsPeoples.h
//  TourismT
//
//  Created by Store on 2017/1/13.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//


#import "basicUiTableView.h"

typedef NS_ENUM(NSInteger, myContactsPeoples_ENMU)
{
    ALL_myContactsPeoples_ENMU,//群成员
    peo_myContactsPeoples_ENMU,//联系人
};


@interface myContactsPeoples : basicUiTableView
@property (nonatomic,assign) myContactsPeoples_ENMU type;  //默认 是 peo_myContactsPeoples_ENMU


@property (nonatomic,strong) membersGroupS *embersPeo;  //群组 成员
@property (nonatomic,strong) NSString *oneIdd;  //群组id   加载失败用到的
@end
