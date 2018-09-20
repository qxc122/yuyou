//
//  querenTuiKuan.m
//  TourismT
//
//  Created by Store on 17/1/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "querenTuiKuan.h"

typedef NS_ENUM(NSInteger, querenTuiKuan_enm)
{
    ok_querenTuiKuan_enm,//轮船
    quxiao_querenTuiKuan_enm,//巴士
};


@implementation querenTuiKuan

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-225*HEIGHTICON);
            make.height.equalTo(@(188));
        }];
        
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        [title mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(0);
            make.right.equalTo(self.back).offset(0);
            make.top.equalTo(self.back).offset(40);
        }];

        
        UIButton *btnleft = [[UIButton alloc]init];
        btnleft.tag = ok_querenTuiKuan_enm;      //轮船
        [self addSubview:btnleft];
        //        [btnleft setBackgroundColor:ColorWithHex(0xFB704B, 1.0)]; right_btnlastOk_ENMU
        LRViewBorder(btnleft, 1.0, ColorWithHex(0xFB704B, 1.0));
        LRViewRadius(btnleft, cornerRadius_width);
        [btnleft setTitle:@"确认" forState:UIControlStateNormal];
        [btnleft setTitleColor:ColorWithHex(0xFB704B, 1.0) forState:UIControlStateNormal];
        btnleft.titleLabel.font = PingFangSC_Regular(17);
        [btnleft addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

        
        UIButton *btnRight = [[UIButton alloc]init];
        [btnRight setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
        LRViewRadius(btnRight, cornerRadius_width);
        btnRight.tag = quxiao_querenTuiKuan_enm;
        [self addSubview:btnRight];
        [btnRight setTitle:@"取消" forState:UIControlStateNormal];
        [btnRight setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        btnRight.titleLabel.font = PingFangSC_Regular(17);
        [btnRight addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [btnRight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.back).offset(-20);
            make.bottom.equalTo(self.back).offset(-40);
            make.width.equalTo(@(100));
            make.height.equalTo(@(44));
        }];
        [btnleft mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20);
            make.bottom.equalTo(self.back).offset(-40);
            make.width.equalTo(@(100));
            make.height.equalTo(@(44));
        }];
        
        //set
        title.text = @"确认申请退款";
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Regular(17);
        title.textColor = ColorWithHex(0x000000, 0.86);
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (btn.tag == quxiao_querenTuiKuan_enm) {
        [self closeClisck];
    } else if (btn.tag == ok_querenTuiKuan_enm){
        if (self.querenTuiKuanbtnClick) {
            self.querenTuiKuanbtnClick();
        }
    }
}
@end
