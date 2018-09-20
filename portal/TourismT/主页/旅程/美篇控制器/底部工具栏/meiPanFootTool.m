//
//  meiPanFootTool.m
//  TourismT
//
//  Created by Store on 2017/6/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "meiPanFootTool.h"

@interface meiPanFootTool ()
@property (nonatomic, weak) UIButton *btn1; //默认不是
@property (nonatomic, weak) UIButton *btn2; //默认不是
@end

@implementation meiPanFootTool

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *top = [UIView new];
        [self addSubview:top];
        
        UIView *su = [UIView new];
        [self addSubview:su];
        
        UIButton *btn1 = [UIButton new];
        [self addSubview:btn1];
        
        UIButton *btn2 = [UIButton new];
        [self addSubview:btn2];
        
        [top mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.height.equalTo(@0.5);
        }];
        
        [su mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-6);
            make.top.equalTo(self).offset(6);
            make.width.equalTo(@0.5);
        }];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.width.equalTo(btn2);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn1.mas_right);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        //set #779CF4 100%
        self.btn1 = btn1;
        self.btn2 = btn2;
        [btn1 setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
        [btn2 setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
        [btn1 setTitle:@"存为草稿" forState:UIControlStateNormal];
        [btn2 setTitle:@"立即发布" forState:UIControlStateNormal];
        btn1.titleLabel.font = PingFangSC_Regular(17);
        btn2.titleLabel.font = PingFangSC_Regular(17);
        btn1.tag = caogao_meiPanFootTool;
        btn2.tag = fabu_meiPanFootTool;
        top.backgroundColor = ColorWithHex(0x979797, 0.4);
        su.backgroundColor = ColorWithHex(0x979797, 0.4);
        [btn1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.meiPanFootToolClick) {
        self.meiPanFootToolClick(btn.tag);
    }
}
- (void)setIsCaogao:(BOOL)isCaogao{
    _isCaogao = isCaogao;
    if (isCaogao) {
        [self.btn1 setTitle:@"删除" forState:UIControlStateNormal];
        [self.btn2 setTitle:@"取消" forState:UIControlStateNormal];
    } else {
        [self.btn1 setTitle:@"存为草稿" forState:UIControlStateNormal];
        [self.btn2 setTitle:@"立即发布" forState:UIControlStateNormal];
    }
}
@end
