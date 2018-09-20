//
//  ChoiceStages.h
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "windosView.h"

@interface ChoiceStages : windosView
//@property (nonatomic, strong) tourDetaisData *data;
@property (nonatomic, strong) pricesS *dayData;
@property (nonatomic, strong) ChoiceStages_data *dateList;

/**
 *  去看协议
 */
@property (nonatomic, copy) void (^goToViewXieYi)(NSURL *url);

/**
 *  点击了确定按钮
 */
@property (nonatomic, copy) void (^ClickOKBtn)(periodTypeList_one *dateList);

@property (nonatomic, copy) void (^CloseView)();
@end
