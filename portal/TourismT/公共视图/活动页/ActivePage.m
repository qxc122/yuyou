//
//  ActivePage.m
//  TourismT
//
//  Created by Store on 2017/8/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ActivePage.h"
#import "UIImage+cir.h"
#import "MZGuidePages.h"
#import "teachingPage.h"
@interface ActivePage ()
@property (nonatomic,weak) UIImageView *activepageImg;
@property (nonatomic,weak) UIButton *activepageBtn;
@end

@implementation ActivePage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(44*WIDTHICON);
            make.right.equalTo(self).offset(-44*WIDTHICON);
            make.top.equalTo(self).offset(144*HEIGHTICON);
            make.bottom.equalTo(self).offset(-143*HEIGHTICON);
        }];
        [self.close setImage:ImageNamed(@"WechatIMG2") forState:UIControlStateNormal];
        self.close.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 24, 0);

        self.back.backgroundColor = [UIColor clearColor];
        UIImageView *activepageImg =[UIImageView new];
        [self addSubview:activepageImg];
        
        UIButton *activepageBtn =[UIButton new];
        [self addSubview:activepageBtn];
        
        [activepageImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(self.back);
            make.bottom.equalTo(self.back);
        }];
        [activepageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.back).offset(42*WIDTHICON);
//            make.right.equalTo(self.back).offset(-42*WIDTHICON);
//            make.height.equalTo(@44);
//            make.bottom.equalTo(self.back).offset(-34*HEIGHTICON);
            
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(self.back);
            make.bottom.equalTo(self.back);
        }];
        self.activepageImg = activepageImg;
        self.activepageBtn = activepageBtn;
        
        LRViewRadius(activepageImg, cornerRadius_width);
        IMAGEsetCONTENTMODE(activepageImg);
        LRViewRadius(self.activepageBtn, cornerRadius_width);
//        [activepageBtn setBackgroundImage:[UIImage imageWithColor:[UIColor redColor]] forState:UIControlStateNormal];
//        activepageBtn.titleLabel.font = PingFangSC_Medium(14);
//        [activepageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [activepageBtn setTitle:@"点击领取" forState:UIControlStateNormal];
        [activepageBtn addTarget:self action:@selector(activepageBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.blcak removeGestureRecognizer:self.tap];

        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(TheTeachingPageDisappearedFunc:)
                                                     name:TheTeachingPageDisappeared
                                                   object:nil];
    }
    return self;
}
- (void)windosViewshow{
    [super windosViewshow];
    UIView *subs = [UIApplication sharedApplication].keyWindow;

    for (UIView *tmp in subs.subviews) {
        if ([tmp isKindOfClass:[teachingPage class]]) {
            [[UIApplication sharedApplication].keyWindow bringSubviewToFront:tmp];
            self.hidden = YES;
            break;
        }
    }
    for (UIView *tmp in subs.subviews) {
        if ([tmp isKindOfClass:[MZGuidePages class]]) {
            [[UIApplication sharedApplication].keyWindow bringSubviewToFront:tmp];
            break;
        }
    }
}

- (void)activepageBtnClick{
    [self closeClisck];
    if (self.btnClick && self.data.popup.url) {
        self.btnClick(self.data.popup.url);
    }
}
- (void)setData:(appcommonglobalS *)data{
    _data = data;
    [self.activepageImg sd_setImageWithURL:[NSURL URLWithString:self.data.popup.image] placeholderImage:ImageNamed(place_image_image)];
//    self.activepageImg.image = [UIImage imageNamed:@"WechatIMG1"];
    if (self.data.popup.url) {
        self.activepageBtn.hidden = NO;
    } else {
        self.activepageBtn.hidden = YES;
    }
}

- (void)TheTeachingPageDisappearedFunc:(NSNotification *)user{
    self.hidden = NO;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
