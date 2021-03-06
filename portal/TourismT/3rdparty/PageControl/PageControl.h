//
//  PageControl.h
//  CustomPageControl
//
//  Created by ZXL on 2017/4/20.
//  Copyright © 2017年 zxl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageControl : UIView

- (instancetype)initWithFrame:(CGRect)frame andDotCount:(NSInteger)count;

/** 普通状态下Dot颜色 */
@property (nonatomic ,strong) UIColor * normalDotColor;

/** 选中状态下Dot颜色 */
@property (nonatomic ,strong) UIColor * selectedDotColor;

// 这种方式直接改变位置没有动画
- (void)setSelectedIndex:(NSInteger)index;

@end
