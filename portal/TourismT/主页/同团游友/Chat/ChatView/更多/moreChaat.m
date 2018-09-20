//
//  moreChaat.m
//  TourismT
//
//  Created by Store on 2017/1/18.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "moreChaat.h"
#import "UIButton+direction.h"


@implementation moreChaat

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-15);
            //make.height.equalTo(@100);
            make.height.equalTo(@(325));
        }];
        
        UILabel *label =[[UILabel alloc]init];
        [self addSubview:label];
        
        UIButton *WXquan =[[UIButton alloc]init];
        [self addSubview:WXquan];
        
        UIButton *WXfer =[[UIButton alloc]init];
        [self addSubview:WXfer];
        
        UIView *hognxian1 =[[UIView alloc]init];
        [self addSubview:hognxian1];
        
        UIButton *aLLpeo =[[UIButton alloc]init];
        [self addSubview:aLLpeo];
        
        UIButton *delset =[[UIButton alloc]init];
        [self addSubview:delset];
        
        UILabel *WXquanlabel =[[UILabel alloc]init];
        [self addSubview:WXquanlabel];
        
        UILabel *WXferlabel =[[UILabel alloc]init];
        [self addSubview:WXferlabel];
        
        UILabel *aLLpeolabel =[[UILabel alloc]init];
        [self addSubview:aLLpeolabel];
        
        UILabel *delsetlabel =[[UILabel alloc]init];
        [self addSubview:delsetlabel];
        
        
        UIView *hognxian2 =[[UIView alloc]init];
        [self addSubview:hognxian2];
        
        UIButton *change =[[UIButton alloc]init];
        [self addSubview:change];
        
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(30);
            make.top.equalTo(self.back).offset(22);
        }];
        [WXquan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label).offset(0);
            make.top.equalTo(label.mas_bottom).offset(19);
            make.width.equalTo(@(45));
            make.height.equalTo(@(45));
        }];
        [WXfer mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(WXquan.mas_right).offset(56);
            make.top.equalTo(label.mas_bottom).offset(19);
            make.width.equalTo(@(45));
            make.height.equalTo(@(45));
        }];
        [WXquanlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(WXquan).offset(0);
            make.top.equalTo(WXfer.mas_bottom).offset(13);

        }];
        [WXferlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(WXfer).offset(0);
            make.top.equalTo(WXfer.mas_bottom).offset(13);

        }];
        [hognxian1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label).offset(0);
            make.right.equalTo(self.back).offset(-30);
            make.height.equalTo(@(0.5));
            make.top.equalTo(WXferlabel.mas_bottom).offset(18);
        }];
        
        [aLLpeo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label).offset(0);
            make.top.equalTo(hognxian1.mas_bottom).offset(18);
            make.width.equalTo(@(45));
            make.height.equalTo(@(45));
        }];
        [delset mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(WXquan.mas_right).offset(56);
            make.top.equalTo(hognxian1.mas_bottom).offset(18);
            make.width.equalTo(@(45));
            make.height.equalTo(@(45));
        }];
        [aLLpeolabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(aLLpeo).offset(0);
            make.top.equalTo(aLLpeo.mas_bottom).offset(13);
            
        }];
        [delsetlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(delset).offset(0);
            make.top.equalTo(delset.mas_bottom).offset(13);
            
        }];
        [hognxian2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label).offset(0);
            make.right.equalTo(self.back).offset(-30);
            make.height.equalTo(@(0.5));
            make.top.equalTo(delsetlabel.mas_bottom).offset(18);
        }];
        
        [change mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self).offset(0);
            make.top.equalTo(hognxian2.mas_bottom).offset(0);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        //set
        [WXquan setBtnWithImage:@"朋友圈" font:PingFangSC_Regular(12) Title:nil color:0x000000 alpa:0.54 forState:UIControlStateNormal];
        [WXfer setBtnWithImage:@"微信sha" font:PingFangSC_Regular(12) Title:nil color:0x000000 alpa:0.54 forState:UIControlStateNormal];

        [aLLpeo setBtnWithImage:@"成员liaot" font:PingFangSC_Regular(12) Title:nil color:0x000000 alpa:0.54 forState:UIControlStateNormal];
        [delset setBtnWithImage:@"垃圾桶liaot" font:PingFangSC_Regular(12) Title:nil color:0x000000 alpa:0.54 forState:UIControlStateNormal];
        [change setBtnWithImage:nil font:PingFangSC_Regular(17) Title:@"取消" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
        
        hognxian1.backgroundColor = ColorWithHex(0x000000, 0.19);
        hognxian2.backgroundColor = ColorWithHex(0x000000, 0.19);
        [label settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(14)];
        [WXquanlabel settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        [WXferlabel settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        [aLLpeolabel settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        [delsetlabel settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        
        WXquan.tag = WXHY_moreChaat_ENMU;
        WXfer.tag = WXPYQ_moreChaat_ENMU;
        aLLpeo.tag = ALLPEO_moreChaat_ENMU;
        delset.tag = DELET_moreChaat_ENMU;
        change.tag = QUXIAO_moreChaat_ENMU;

        [WXquan addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [WXfer addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [aLLpeo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [delset addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [change addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        label.text = @"邀请好友";
        WXquanlabel.text = @"朋友圈";
        WXferlabel.text = @"微信好友";
        aLLpeolabel.text = @"群成员";
        delsetlabel.text = @"清空聊天记录";
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.cilcktype) {
        self.cilcktype(btn.tag);
    }
}
@end
