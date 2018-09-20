//
//  cancel.m
//  TourismT
//
//  Created by Store on 2017/8/21.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "cancel.h"


@interface cancel ()
@property (nonatomic,weak) UIButton *chanege;

@end

@implementation cancel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        
        UIView *foot = [[UIView alloc]init];
        [self addSubview:foot];
        
        UIButton *chanege = [[UIButton alloc]init];
        [self addSubview:chanege];

        [foot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@(70));
            make.bottom.equalTo(self);
            make.height.equalTo(self).offset(10);
        }];
        [chanege mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(foot);
            make.centerY.equalTo(foot);
            make.width.equalTo(@(70));
            make.height.equalTo(@(30));
        }];
        
        //set
        self.foot = foot;
        self.chanege = chanege;
        chanege.tag = 2;
        [chanege addTarget:self action:@selector(btnClickcancel:) forControlEvents:UIControlEventTouchUpInside];
        LRViewBorder(chanege, 0.5, ColorWithHex(0xFB704B, 1.0));
        LRViewRadius(chanege, cornerRadius_width);
        [chanege setTitle:@"取消订单" forState:UIControlStateNormal];
        [chanege setTitleColor:ColorWithHex(0xFB704B, 1.0) forState:UIControlStateNormal];
        chanege.titleLabel.font = PingFangSC_Regular(14);
        foot.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)setIsExpre:(BOOL)isExpre{
    _isExpre = isExpre;
    self.chanege.enabled = !isExpre;
    if (isExpre) {
        LRViewBorder(self.chanege, 0.5, ColorWithHex(0x979797, 0.4));
        [self.chanege setTitleColor:ColorWithHex(0x979797, 0.4) forState:UIControlStateNormal];
    }
}

- (void)btnClickcancel:(UIButton *)btn{
    if (btn.tag == 2) {
        if (self.chagePayTypeClick) {
            self.chagePayTypeClick(cancel_chage_toPayHead,nil);
        }
    }
}

@end
