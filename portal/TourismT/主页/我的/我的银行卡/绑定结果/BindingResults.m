//
//  BindingResults.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "BindingResults.h"

@interface BindingResults ()
@property (nonatomic,weak) UILabel *last1;

@property (nonatomic,weak) UIImageView *last;
@property (nonatomic,weak) UIImageView *iamge1;
@property (nonatomic,weak) UIImageView *iamge2;
@property (nonatomic,weak) UIImageView *iamge3;

@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,strong) NSTimer *scrollTimer2;
@property (nonatomic,assign) NSInteger num;
@property (nonatomic,assign) NSInteger num2;

@property (nonatomic,weak) UILabel *label1;
@property (nonatomic,weak) UILabel *label2;
@property (nonatomic,weak) UILabel *label3;
@end

@implementation BindingResults

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(150*HEIGHTICON);
            make.height.equalTo(@(284));
        }];
        
        UILabel *label1 = [UILabel new];
        [self addSubview:label1];
        
        UIImageView *iamge1 = [UIImageView new];
        [self addSubview:iamge1];
        
        UILabel *label2 = [UILabel new];
        [self addSubview:label2];
        
        UIImageView *iamge2 = [UIImageView new];
        [self addSubview:iamge2];
        
        UILabel *label3 = [UILabel new];
        [self addSubview:label3];
        
        UIImageView *iamge3 = [UIImageView new];
        [self addSubview:iamge3];
        
        
        UIImageView *last = [UIImageView new];
        [self addSubview:last];
        
        UILabel *last1 = [UILabel new];
        [self addSubview:last1];
        
        UILabel *last2 = [UILabel new];
        [self addSubview:last2];
        
        [label1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(30);
            make.top.equalTo(self.back).offset(49);
            make.height.equalTo(@15);
        }];
        [iamge1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(label1);
            make.right.equalTo(self.back).offset(-35);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        
        [label3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1);
            make.top.equalTo(label1.mas_bottom).offset(49);
            make.height.equalTo(@15);
        }];
        [iamge3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(label3);
            make.right.equalTo(self.back).offset(-35);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        
        [label2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1);
            make.top.equalTo(label3.mas_bottom).offset(49);
            make.height.equalTo(@15);
        }];
        [iamge2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(label2);
            make.right.equalTo(self.back).offset(-35);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];

        
        [last mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(last1);
            make.right.equalTo(last1.mas_left).offset(-6);
            make.width.equalTo(@14);
            make.width.equalTo(@14);
        }];
        [last1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self).offset((14+6)*0.5);
            make.top.equalTo(label2.mas_bottom).offset(28);
            make.height.equalTo(@12);
        }];
        [last2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(last1.mas_bottom).offset(20);
            make.height.equalTo(@12);
        }];
        
        //set
        label1.textColor = ColorWithHex(0x000000, 0.87);
        label1.font = PingFangSC_Regular(15);
        label2.textColor = ColorWithHex(0x000000, 0.87);
        label2.font = PingFangSC_Regular(15);
        label3.textColor = ColorWithHex(0x000000, 0.87);
        label3.font = PingFangSC_Regular(15);
        
        last1.textColor = ColorWithHex(0xFB704B, 1.0);
        last1.font = PingFangSC_Regular(14);
        last2.textColor = ColorWithHex(0x000000, 0.4);
        last2.font = PingFangSC_Regular(12);
        
        label1.text = @"身份验证";
        label2.text = @"风险检测";
        label3.text = @"金融云检测";
        
        last1.text = @"抱歉，你的身份验证未通过";
        last2.text = @"数据由腾讯金融云提供";
        
//        IMAGEsetCONTENTMODE(iamge1);
//        IMAGEsetCONTENTMODE(iamge2);
//        IMAGEsetCONTENTMODE(iamge3);
        iamge1.image = ImageNamed(@"选中");
        iamge2.image = ImageNamed(@"选中");
        iamge3.image = ImageNamed(@"选中");
        iamge1.highlightedImage = ImageNamed(@"删除 (3)");
        iamge2.highlightedImage = ImageNamed(@"删除 (3)");
        iamge3.highlightedImage = ImageNamed(@"删除 (3)");
        
        last.image = ImageNamed(@"注意");
        
        self.last1 = last1;
        self.iamge1 = iamge1;
        self.iamge2 = iamge2;
        self.iamge3 = iamge3;
        self.last = last;
        self.label1 = label1;
        self.label2 = label2;
        self.label3 = label3;
        
        self.last1.hidden = YES;
        self.iamge1.hidden  = YES;
        self.iamge2.hidden  = YES;
        self.iamge3.hidden  = YES;
        self.last.hidden  = YES;
        self.label1.alpha  = 0;
        self.label2.alpha  = 0;
        self.label3.alpha  = 0;
        //tset
        
//        iamge1.highlighted = YES;
        
    }
    return self;
}

- (void)setDate:(RiskVerification *)date{
    if (date) {
        _date = date;
        [self creatTimer2];
        
        if (self.date.info && self.date.risk && self.date.fright) {
            self.close.hidden = YES;
        } else {
            self.close.hidden = NO;
        }
    }
}
- (void)closeClisck{
    if (self.date.info && self.date.risk && self.date.fright) {
  
    } else {
        [self removeFromSuperview];
    }
}

#pragma mark----创建定时器
-(void)creatTimer2
{
    self.num2 = 3;
    _scrollTimer2 = [NSTimer scheduledTimerWithTimeInterval:0.7 target:self selector:@selector(daojishiRunning2) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer2 forMode:NSRunLoopCommonModes];
}
#pragma mark----倒计时
-(void)daojishiRunning2{
    if (self.num2 == 3) {
        CATransform3D rotation;
        rotation = CATransform3DMakeTranslation(0, 44, 0);
        self.label1.alpha = 0;
        self.label1.layer.transform = rotation;
        [UIView animateWithDuration:0.5 animations:^{
            self.label1.layer.transform = CATransform3DIdentity;
            self.label1.alpha = 1;
        } completion:^(BOOL finished) {
            self.iamge1.hidden = NO;
            if (self.date.info) {
                self.iamge1.highlighted = NO;
            }else{
                self.iamge1.highlighted = YES;
            }
        }];
    } else if (self.num2 == 2) {
        CATransform3D rotation;
        rotation = CATransform3DMakeTranslation(0, 44, 0);
        self.label3.alpha = 0;
        self.label3.layer.transform = rotation;
        [UIView animateWithDuration:0.5 animations:^{
            self.label3.layer.transform = CATransform3DIdentity;
            self.label3.alpha = 1;
        } completion:^(BOOL finished) {
            self.iamge3.hidden = NO;
            if (self.date.fright) {
                self.iamge3.highlighted = NO;
            }else{
                self.iamge3.highlighted = YES;
            }
        }];
    } else if (self.num2 == 1) {
        CATransform3D rotation;
        rotation = CATransform3DMakeTranslation(0, 44, 0);
        self.label2.alpha = 0;
        self.label2.layer.transform = rotation;
        [UIView animateWithDuration:0.5 animations:^{
            self.label2.layer.transform = CATransform3DIdentity;
            self.label2.alpha = 1;
        } completion:^(BOOL finished) {
            self.iamge2.hidden = NO;
            if (self.date.risk) {
                self.iamge2.highlighted = NO;
            }else{
                self.iamge2.highlighted = YES;
            }
        }];
    } else if (self.num2 == 0) {
        if (self.date.info && self.date.risk && self.date.fright) {
            self.last1.hidden = YES;
            self.last.hidden = YES;
            if (self.endCountDown) {
                [self removeFromSuperview];
                self.endCountDown();
            }
        } else {
            self.last1.hidden = NO;
            self.last.hidden = NO;
        }
        [self removeTimer2];
    }
    self.num2--;
}
#pragma mark----移除定时器
-(void)removeTimer2
{
    [_scrollTimer2 invalidate];
    _scrollTimer2 = nil;
}


//#pragma mark----创建定时器
//-(void)creatTimer
//{
//    self.num = 2;
//    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
//}
//#pragma mark----倒计时
//-(void)daojishiRunning{
//    self.num--;
//    if (self.num == 0) {
//        [self removeTimer];
//        [self removeFromSuperview];
//        if (self.endCountDown) {
//            self.endCountDown();
//        }
//    }
//}
//#pragma mark----移除定时器
//-(void)removeTimer
//{
//    [_scrollTimer invalidate];
//    _scrollTimer = nil;
//}


- (void)dealloc{
//    [self removeTimer];
    [self removeTimer2];
}

@end
