//
//  myDeVcSehzhiCell.h
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myDeVcSehzhiCell : UITableViewCell
@property (nonatomic,strong) NSString *tit;
@property (nonatomic,strong) NSString *dess;
@property (nonatomic,strong) NSString *dessTwo;
@property (nonatomic,assign) BOOL isHieswifp;
@property (nonatomic,assign) BOOL isHiedes;
@property (nonatomic,assign) BOOL isHiemore;
@property (nonatomic,assign) BOOL isHiedessTwo;

@property (nonatomic,assign) BOOL isAllowNotication; //是否开启推送
//@property (nonatomic,assign) BOOL isClear;
+ (instancetype)returnCellWith:(UITableView *)tableView;


///**
// *  点击每个btn的回调
// */
//@property (nonatomic, copy) void (^btnClick)();
@end
