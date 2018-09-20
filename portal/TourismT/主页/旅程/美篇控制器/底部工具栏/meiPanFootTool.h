//
//  meiPanFootTool.h
//  TourismT
//
//  Created by Store on 2017/6/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, collection_ENMU)
{
    caogao_meiPanFootTool,// 存为草稿
    fabu_meiPanFootTool,//  立即发布
};


@interface meiPanFootTool : UIView
/**
 *  点击每个cell的回调  选择或者取消
 */
@property (nonatomic, copy) void (^meiPanFootToolClick)(collection_ENMU ClickType);

@property (nonatomic, assign) BOOL isCaogao; //默认不是
@end
