//
//  CusNavigationBar.h
//  TourismT
//
//  Created by Store on 2017/2/20.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CusNavigationBar : UIView
@property (nonatomic,strong) NSString *titleStr; //文字
@property (nonatomic,strong) NSString *LeftStr; //图片
@property (nonatomic,strong) NSString *RightStr; //图片

@property (nonatomic,strong) NSString *RightTitleStr; //文字
@property (nonatomic,strong) NSString *titleImaStr; //图片


@property (nonatomic,weak) UIButton *right;

@property (nonatomic,assign) BOOL hidenLeft;
@property (nonatomic,assign) BOOL hidenMidle;
@property (nonatomic,assign) BOOL hidenRight;
@property (nonatomic,assign) BOOL hidenBack;


/**
 *  倒计时结束
 */
@property (nonatomic, copy) void (^endDaojishi)();
/**
 *  倒计时结束
 */
@property (nonatomic, copy) void (^RightendDaojishi)();

@end
