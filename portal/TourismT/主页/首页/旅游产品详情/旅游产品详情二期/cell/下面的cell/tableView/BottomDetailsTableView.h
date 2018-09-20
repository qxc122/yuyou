//
//  BottomDetailsTableView.h
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "YXTabItemBaseView.h"
#import "BottomDetailsTableViewFoot.h"

@interface BottomDetailsTableView : YXTabItemBaseView
@property (nonatomic, strong) tourDetaisData *data; 
@property (copy,nonatomic) void (^btnClick)(BottomDetailsTableViewFoot_type type);
@property (copy,nonatomic) void (^lookMore)();
@property (copy,nonatomic) void (^lookWebUrl)(NSURL *url);
@property (copy,nonatomic) void (^lookSharedUrl)(travelSharingsS *data);
@property (copy,nonatomic) void (^lookTravelItinerary)();
/**
 *  点击查看 网页详情
 */
@property (copy,nonatomic) void (^lookDetail)(NSURL *url,NSString *title);
@end
