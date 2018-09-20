//
//  SelectDateTwo.h
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface SelectDateTwo : windosView
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,assign) NSInteger Month;
@property (nonatomic,strong) pricesS *dataDate;


@property (nonatomic, strong) tourDetaisData *data;

@property (nonatomic, copy) void (^NextBtnClisckBlock)(NSInteger type,NSInteger month,pricesS *data);


@property (nonatomic, copy) void (^CloseView)();
@end
