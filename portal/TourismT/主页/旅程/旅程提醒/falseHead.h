//
//  falseHead.h
//  TourismT
//
//  Created by Store on 16/12/12.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface falseHead : UIView
/**
 *  点击每个cell的回调
 */
@property (nonatomic, copy) void (^btnClick)(NSInteger index);
@property (nonatomic,assign) NSInteger index;
- (instancetype)initWithArry:(NSArray *)arry index:(NSInteger)index width:(CGFloat)width color:(UIColor *)color line_to_top:(NSInteger)line_to_top backcolor:(UIColor *)colorb;
@end
