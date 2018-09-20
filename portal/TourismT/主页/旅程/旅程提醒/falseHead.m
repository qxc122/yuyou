//
//  falseHead.m
//  TourismT
//
//  Created by Store on 16/12/12.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "falseHead.h"

@interface falseHead ()
@property (nonatomic,weak) UIView *moveView;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,strong) NSArray *arry;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,weak) UIButton *selcetBtn;

@end


@implementation falseHead
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *moveView = [[UIView alloc]init];
        self.moveView = moveView;
        moveView.backgroundColor = ColorWithHex(0x779CF4, 1.0);
        [self addSubview:moveView];

        UIView *line = [[UIView alloc]init];
        self.line = line;
        line.backgroundColor = ColorWithHex(0x000000, 0.1);
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@(1));
        }];
    }
    return self;
}
- (instancetype)initWithArry:(NSArray *)arry index:(NSInteger)index width:(CGFloat)width color:(UIColor *)color line_to_top:(NSInteger)line_to_top backcolor:(UIColor *)colorb{
    if (self = [self init]) {
        if (color) {
            self.backgroundColor = color;
        }
        _arry = arry;
        _width = width;
        [self.moveView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(((ScreenWidth/[arry count]) - width)/2.0);
            make.bottom.equalTo(self.line.mas_top).offset(0);
            make.height.equalTo(@(3));
            make.width.equalTo(@(width));
        }];
        
        NSInteger tagg = 0;
        UIButton *pre = nil;
        for (NSString *title in arry) {
            UIButton *btn = [[UIButton alloc]init];
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = PingFangSC_Regular(15);
            [btn setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
            [btn setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateSelected];
            [btn setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateHighlighted];
            [self addSubview:btn];
            if (tagg == 0) {
                btn.selected = YES;
                self.selcetBtn = btn;
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(self);
                    make.top.equalTo(self).offset(line_to_top);
                    make.bottom.equalTo(self.moveView.mas_top);
                    make.width.equalTo(@(ScreenWidth/[arry count]));
                }];
            } else if (tagg == [arry count] - 1){
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(pre.mas_right);
                    make.right.equalTo(self);
                    make.top.equalTo(pre);
                    make.bottom.equalTo(self.moveView.mas_top);
                    make.width.equalTo(@(ScreenWidth/[arry count]));
                }];
            }else{
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(pre.mas_right);
                    make.top.equalTo(pre);
                    make.bottom.equalTo(self.moveView.mas_top);
                    make.width.equalTo(@(ScreenWidth/[arry count]));
                }];
            }
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = tagg;
            pre = btn;
            tagg++;
        }
        _index = index;
    }
    return self;
}
- (void)setIndex:(NSInteger)index{
    if (index != self.index) {
//        self.moveView.transform = CGAffineTransformMake;
        [UIView animateWithDuration:0.3 animations:^{
//            self.moveView.transform = CGAffineTransformMakeTranslation((index - self.index) * (ScreenWidth/[self.arry count]), 0);
            [self.moveView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(((ScreenWidth/[self.arry count]) - self.width)/2.0+index*(ScreenWidth/[self.arry count]));
                make.bottom.equalTo(self.line.mas_top).offset(0);
                make.height.equalTo(@(3));
                make.width.equalTo(@(self.width));
            }];
            
        }];
        _index = index;
        for (UIButton *btn in self.subviews) {
            if ([btn isKindOfClass:[UIButton class]] && btn.tag == index) {
                btn.selected = YES;
                self.selcetBtn.selected = NO;
                self.selcetBtn = btn;
                break;
            }
        }
    }
}
- (void)btnClick:(UIButton *)sender{
    NSLog(@"%s",__func__);
    if (self.btnClick) {
        self.btnClick(sender.tag);
    }
}

@end
