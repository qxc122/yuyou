//
//  footTableview.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "footTableview.h"
#import "UIImage+cir.h"

@interface footTableview ()
@property (nonatomic,weak) UIButton *btn;
@end

@implementation footTableview

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *btn = [[UIButton alloc]init];
        [self addSubview:btn];
        self.btn =btn;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(20);
            make.bottom.equalTo(self).offset(-20);
        }];

        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x7692F3, 1.0)] forState:UIControlStateNormal];
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick();
    }
}
- (void)setIsenableBtn:(BOOL)isenableBtn{
    _isenableBtn  = isenableBtn;
    NSString *staue;
    if (isenableBtn) {
        staue = @"退出";
    } else {
        staue = @"登录";
    }
    [self.btn setBtnWithImage:nil font:PingFangSC_Regular(14) Title:staue color:0xFFFFFF alpa:1.0 forState:UIControlStateNormal];
}




@end
