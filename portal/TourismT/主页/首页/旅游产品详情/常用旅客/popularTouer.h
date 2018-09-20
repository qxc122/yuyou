//
//  popularTouer.h
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"

@interface popularTouer : basicUiTableView
/**
 *  点击查看旅程提醒
 */
@property (copy,nonatomic) void (^SelectedTravellers)(NSMutableArray *travellers);

/**
 *  编辑了一个人的信息
 */
@property (copy,nonatomic) void (^eidtTravellers)(travellerS *peo);
/**
 *  删除了了一个人的信息
 */
@property (copy,nonatomic) void (^deletTravellers)(travellerS *peo);

@property (nonatomic,strong) NSMutableArray *travellers;//已经选中的出行人

@property (nonatomic,assign) BOOL isDebtn;//取消最下面的按钮


@property (nonatomic,strong) NSString *idType;//出游的类型  国际还是国内
@end
