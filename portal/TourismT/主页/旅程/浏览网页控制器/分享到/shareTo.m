//
//  shareTo.m
//  TourismT
//
//  Created by Store on 16/12/31.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "shareTo.h"
#import "WXapi.h"


@implementation shareTo

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-30);
            make.height.equalTo(@(178));
        }];
        
        UILabel *title =[[UILabel alloc]init];
        [self addSubview:title];
        
        UIView *hognxiang =[[UIView alloc]init];
        [self addSubview:hognxiang];
        
        UIButton *btnOne =[[UIButton alloc]init];
        [self addSubview:btnOne];
        
        UIButton *btnTwo =[[UIButton alloc]init];
        [self addSubview:btnTwo];
        
        UIButton *btnThree =[[UIButton alloc]init];
        [self addSubview:btnThree];
        
        UIButton *btnFour =[[UIButton alloc]init];
        [self addSubview:btnFour];
        
        UILabel *btnOneL =[[UILabel alloc]init];
        [self addSubview:btnOneL];
        
        UILabel *btnTwoL =[[UILabel alloc]init];
        [self addSubview:btnTwoL];
        
        UILabel *btnThreeL =[[UILabel alloc]init];
        [self addSubview:btnThreeL];
        
        UILabel *btnFourL =[[UILabel alloc]init];
        [self addSubview:btnFourL];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(15);
            make.right.equalTo(self.back).offset(-15);
            make.top.equalTo(self.back).offset(24);
        }];
        
        [hognxiang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(30);
            make.right.equalTo(self.back).offset(-30);
            make.top.equalTo(title.mas_bottom).offset(20);
            make.height.equalTo(@(1));
        }];
        
        [btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hognxiang);
            make.top.equalTo(hognxiang).offset(15);
//            make.height.mas_equalTo(btnOne.mas_width);
            make.height.equalTo(@(45*WIDTHICON));
            make.width.equalTo(@(45*WIDTHICON));
        }];
        
        [btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnOne.mas_right).offset(35.5*WIDTHICON);
            make.centerY.equalTo(btnOne).offset(0);
            make.width.equalTo(btnOne);
            make.height.equalTo(btnOne);
        }];
        [btnThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnTwo.mas_right).offset(35.5*WIDTHICON);
            make.centerY.equalTo(btnOne).offset(0);
            make.width.equalTo(btnOne);
            make.height.equalTo(btnOne);
        }];
        [btnFour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnThree.mas_right).offset(35.5*WIDTHICON);
            make.centerY.equalTo(btnOne).offset(0);
            make.width.equalTo(btnOne);
            make.height.equalTo(btnOne);
        }];
        [btnOneL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnOne.mas_bottom).offset(13);
            make.centerX.equalTo(btnOne);
        }];
        
        [btnTwoL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnTwo.mas_bottom).offset(13);
            make.centerX.equalTo(btnTwo);
        }];
        [btnThreeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnOne.mas_bottom).offset(13);
            make.centerX.equalTo(btnThree);
        }];
        
        [btnFourL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btnTwo.mas_bottom).offset(13);
            make.centerX.equalTo(btnFour);
        }];
        //set
        title.text = @"分享到";
        title.textAlignment = NSTextAlignmentCenter;
        title.textColor = ColorWithHex(0x000000, 0.54);
        title.font = PingFangSC_Regular(17);
        hognxiang.backgroundColor = ColorWithHex(0x000000, 0.1);

        [btnOne setImage:ImageNamed(@"朋友圈sha") forState:UIControlStateNormal];
        [btnTwo setImage:ImageNamed(@"微信sha") forState:UIControlStateNormal];
        [btnThree setImage:ImageNamed(@"新浪") forState:UIControlStateNormal];
        [btnFour setImage:ImageNamed(@"QQ空间") forState:UIControlStateNormal];
        btnOneL.text = @"朋友圈";
        btnTwoL.text = @"微信好友";
        btnThreeL.text = @"新浪微博";
        btnFourL.text = @"QQ空间";
        btnOneL.font = PingFangSC_Regular(12);
        btnTwoL.font = PingFangSC_Regular(12);
        btnThreeL.font = PingFangSC_Regular(12);
        btnFourL.font = PingFangSC_Regular(12);
        btnOneL.textColor = ColorWithHex(0x000000, 0.54);
        btnTwoL.textColor = ColorWithHex(0x000000, 0.54);
        btnThreeL.textColor = ColorWithHex(0x000000, 0.54);
        btnFourL.textColor = ColorWithHex(0x000000, 0.54);
        
        btnTwo.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btnOne.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btnThree.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btnFour.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [btnOne addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnTwo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnThree addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnFour addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btnOne.tag = UMSocialPlatformType_WechatTimeLine;
        btnTwo.tag = UMSocialPlatformType_WechatSession;
        btnThree.tag = UMSocialPlatformType_Sina;
        btnFour.tag = UMSocialPlatformType_Qzone;
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.shareClick) {
        [self removeFromSuperview];
        self.shareClick((int)btn.tag);
    }
}
@end
