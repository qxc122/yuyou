//
//  PageControl.m
//  CustomPageControl
//
//  Created by ZXL on 2017/4/20.
//  Copyright © 2017年 zxl. All rights reserved.
//

#import "PageControl.h"

@interface PageControl ()

/** currentDot */
@property (nonatomic ,strong) UIImageView * currentDot;
@property (nonatomic ,assign) NSInteger currentIndex;

/** dots */
@property (nonatomic ,strong) NSMutableArray * dots;

/** count */
@property (nonatomic ,assign) NSInteger count;

@end

@implementation PageControl

- (instancetype)initWithFrame:(CGRect)frame andDotCount:(NSInteger)count{
    self.count = count;
    // 设置frame
    CGRect rect = frame;
    // 宽高 10 间隙 6
    rect.size = CGSizeMake(14 * (count + 1), 10);
    return [self initWithFrame:rect];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        // 初始化
        self.backgroundColor = [UIColor whiteColor];
        self.normalDotColor = [UIColor colorWithWhite:1.0 alpha:0.5];;
        self.selectedDotColor = [UIColor colorWithWhite:1.0 alpha:0.8];;
        self.dots = [NSMutableArray array];
        self.currentIndex = 0;
        // 添加视图
        [self setupUI];
    }
    return self;
}

- (void)setSelectedIndex:(NSInteger)index{
    
    if (index == self.currentIndex || index < 0 || index >= self.count) {
        return;
    }
    
    UIView * currentDot = self.currentDot;
    UIView * exchangeDot = [self.dots objectAtIndex:index];
    if (index > self.currentIndex) {
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint currentPoint = currentDot.center;
            currentDot.center = CGPointMake(exchangeDot.center.x - 4, exchangeDot.center.y);
            for (NSInteger i = self.currentIndex + 1; i <= index; i ++) {
                UIView * dot = [self.dots objectAtIndex:i];
//                [self.dots enumerateObjectsUsingBlock:^(UIView *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                    
//                    NSLog(@" ---- %ld",(long)obj.tag);
//                }];
                dot.center = CGPointMake(dot.center.x - 22, currentPoint.y);
            }
        }];
        
    }
    else{
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint currentPoint = currentDot.center;
            currentDot.center = CGPointMake(exchangeDot.center.x + 4, exchangeDot.center.y);
            for (NSInteger i = index; i < self.currentIndex; i ++) {
                UIView * dot = [self.dots objectAtIndex:i];
                dot.center = CGPointMake(dot.center.x + 22, currentPoint.y);
            }
        }];
    }
    
    [self.dots removeObjectAtIndex:self.currentIndex];
    [self.dots insertObject:self.currentDot atIndex:index];
    self.currentIndex = index;
}

- (void)setupUI{
    
    // 添加选中的Dot
    [self.dots addObject:self.currentDot];
    [self addSubview:self.currentDot];
    
    // 创建普通Dot
    for (int i = 0; i < self.count - 1; i ++) {
        CGFloat X = 14 * (i + 2);
        //Dots
        UIImageView * dot = [[UIImageView alloc]initWithFrame:CGRectMake(X, 1, 5, 5)];
        dot.tag = i;
        dot.layer.cornerRadius = 4;
        dot.layer.masksToBounds = YES;
        dot.backgroundColor = self.normalDotColor;
        [self addSubview:dot];
        [self.dots addObject:dot];
    }
}

- (UIView *)currentDot{
    if (!_currentDot) {
        _currentDot = [[UIImageView alloc]initWithFrame:CGRectMake(6, 1, 18, 5)];
        _currentDot.tag = 8;
        _currentDot.backgroundColor = self.selectedDotColor;
        _currentDot.layer.cornerRadius = 4;
        _currentDot.layer.masksToBounds = YES;
    }
    return _currentDot;
}


@end
