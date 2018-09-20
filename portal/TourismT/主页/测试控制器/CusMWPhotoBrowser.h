//
//  CusMWPhotoBrowser.h
//  TourismT
//
//  Created by Store on 2017/7/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface CusMWPhotoBrowser : MWPhotoBrowser
@property (nonatomic,strong) UIColor *backColor; //背景颜色

/**
 *  点击了确定按钮
 */
@property (nonatomic, copy) void (^btnClick)();
@property (nonatomic,assign) BOOL isChoosePhotos; //默认否
@end
