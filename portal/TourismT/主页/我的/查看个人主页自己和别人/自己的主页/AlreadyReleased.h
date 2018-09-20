//
//  AlreadyReleased.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "YXTabItemBaseView.h"

@interface AlreadyReleased : YXTabItemBaseView<DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic,strong) peoHome_page *oneData;
/**
 *  查看分享的 网页详情
 */
@property (copy,nonatomic) void (^shareORkeep)(travelSharingsS *one);
@end
