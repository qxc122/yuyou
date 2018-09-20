//
//  UIView+BadgeValue.m
//  OC_Demo
//
//  Created by clarence on 16/11/1.
//  Copyright © 2016年 clarence. All rights reserved.
//

#import "UIView+BadgeValue.h"
#import <objc/runtime.h>

static char fl_badgeValue_static;

static CGFloat fl_badgeValue_height = 15;

@implementation UIView (BadgeValue)

- (void)setFl_badgeValue:(NSString *)fl_badgeValue{
    objc_setAssociatedObject(self, &fl_badgeValue_static, fl_badgeValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (fl_badgeValue == nil || [fl_badgeValue isEqualToString:@""] || fl_badgeValue.integerValue <= 0) {
        [self fl_clearBadgeValue];
    }
    else{
        NSAssert([self fl_isAllNumber:fl_badgeValue], @"字符串内容必须是数字");
        CGRect rect = [fl_badgeValue  boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont smallSystemFontSize]]} context:nil];
        // 创建红点
        UIButton *redBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, rect.size.width > fl_badgeValue_height ? rect.size.width + 6 : fl_badgeValue_height, fl_badgeValue_height)];
        redBtn.center = CGPointMake(self.frame.size.width, 0);
        redBtn.tag = 1008611;
        redBtn.layer.cornerRadius = fl_badgeValue_height / 2;
        redBtn.layer.masksToBounds = YES;
        redBtn.titleLabel.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
        
        redBtn.backgroundColor = [UIColor redColor];
        [redBtn setTitle:fl_badgeValue forState:UIControlStateNormal];
        [self addSubview:redBtn];
    }
}

- (NSString *)fl_badgeValue{
    NSString *badgeValue = objc_getAssociatedObject(self, &fl_badgeValue_static);
    // 少于0 重置为0
    if (badgeValue.integerValue < 0) {
        return @"0";
    }
    else{
        return badgeValue;
    }
}

- (void)fl_clearBadgeValue{
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]] && view.tag == 1008611) {
            [view removeFromSuperview];
        }
    }
}

// 判断是否全是数字
- (BOOL)fl_isAllNumber:(NSString *)text{
    unichar str;
    for (NSInteger index = 0; index < text.length; index ++) {
        str = [text characterAtIndex:index];
        if (isdigit(str)) {
            return YES;
        }
    }
    return NO;
}


#pragma other(redPoint)
//添加显示
- (void)showRedAtOffSetX:(float)offsetX AndOffSetY:(float)offsetY OrValue:(NSString *)value{
    [self removeRedPoint];//添加之前先移除，避免重复添加
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 998;
    
    CGFloat viewWidth = 12;
    if (value) {
        viewWidth = 18;
        UILabel *valueLbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, viewWidth, viewWidth)];
        valueLbl.text = value;
        valueLbl.font = [UIFont systemFontOfSize:12];
        valueLbl.textColor = [UIColor whiteColor];
        valueLbl.textAlignment = NSTextAlignmentCenter;
        valueLbl.clipsToBounds = YES;
        [badgeView addSubview:valueLbl];
    }
    
    badgeView.layer.cornerRadius = viewWidth / 2;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;
    
    //确定小红点的位置
//    if (offsetX == 0) {
//        offsetX = 0;
//    }
//    
//    if (offsetY == 0) {
//        offsetY = 0;
//    }
//    CGFloat x = ceilf(tabFrame.size.width + offsetX);
//    CGFloat y = ceilf(offsetY * tabFrame.size.height);
    
    badgeView.frame = CGRectMake(tabFrame.size.width + offsetX, offsetY, viewWidth, viewWidth);
    [self addSubview:badgeView];
}



//添加显示
- (void)showRedAtOffSetX:(float)offsetX AndOffSetY:(float)offsetY viewWidth:(CGFloat)viewWidth{
    [self removeRedPoint];//添加之前先移除，避免重复添加
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 998;
    
    badgeView.layer.cornerRadius = viewWidth / 2;
    badgeView.backgroundColor = ColorWithHex(0xFB704B, 1.0);
    CGRect tabFrame = self.frame;
    [self addSubview:badgeView];
//    [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_right).offset(offsetX);
//        make.top.equalTo(self).offset(offsetY);
//        make.width.equalTo(@(viewWidth));
//        make.height.equalTo(@(viewWidth));
//    }];
    badgeView.frame = CGRectMake(tabFrame.size.width + offsetX, offsetY, viewWidth, viewWidth);
}



//隐藏
- (void)hideRedPoint{
    [self removeRedPoint];
}

//移除
- (void)removeRedPoint{
    //按照tag值进行移除
    for (UIView *subView in self.subviews) {
        if (subView.tag == 998) {
            [subView removeFromSuperview];
        }
    }
}
@end
