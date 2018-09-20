//
//  myStageVcHead.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageVcHead.h"


@interface myStageVcHead ()
@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UILabel *moneyDes;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *waringl;
@property (nonatomic,weak) UILabel *interest;

@property (nonatomic,weak) UIImageView *timeImage;

@end

@implementation myStageVcHead

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *back = [UIImageView new];
        [self addSubview:back];
        
        UIButton *jilu = [UIButton new];
        [self addSubview:jilu];
        UILabel *interest = [UILabel new];
        [self addSubview:interest];
        
        UILabel *money = [UILabel new];
        [self addSubview:money];
        
        UILabel *moneyDes = [UILabel new];
        [self addSubview:moneyDes];
        
        UIImageView *timeImage = [UIImageView new];
        self.timeImage = timeImage;
        [self addSubview:timeImage];
        UILabel *time = [UILabel new];
        [self addSubview:time];
        
        UILabel *waringl = [UILabel new];
        [self addSubview:waringl];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.bottom.equalTo(self);
            make.left.equalTo(self);
            make.right.equalTo(self);
        }];
        [jilu mas_makeConstraints:^(MASConstraintMaker *make) {
            if (ScreenHeight==812){
                make.top.equalTo(self).offset(36+22-(44-14)*0.5);
            }else{
                make.top.equalTo(self).offset(36-(44-14)*0.5);
            }
            make.right.equalTo(self).offset(-15);
            make.height.equalTo(@(44));
            make.width.equalTo(@(60));
        }];
        
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(84);
            make.height.equalTo(@36);
            make.centerX.equalTo(self);
        }];
        [moneyDes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(money.mas_bottom).offset(10);
            make.centerX.equalTo(self);
            make.height.equalTo(@14);
        }];
        
        [timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@12);
            make.height.equalTo(@12);
            make.right.equalTo(time.mas_left).offset(-5);
            make.centerY.equalTo(time);
        }];
        
        [interest mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(moneyDes.mas_bottom).offset(4);
            make.centerX.equalTo(self);
            make.height.equalTo(@14);
        }];

        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(waringl.mas_top).offset(-10);
            make.centerX.equalTo(self);
            make.height.equalTo(@17);
        }];
        [waringl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(36));
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        //set
        [jilu setTitle:@"还款记录" forState:UIControlStateNormal];
        [jilu setTitleColor:ColorWithHex(0xFFFFFF, 0.87) forState:UIControlStateNormal];
        jilu.titleLabel.font = PingFangSC_Regular(14);
        
        back.userInteractionEnabled = YES;
        back.image = ImageNamed(IMAGE_NavcBack);
        self.money = money;
        self.moneyDes = moneyDes;
        self.time = time;
        self.waringl = waringl;
        self.interest = interest;
        money.font = PingFangSC_Medium(36);
        money.textColor = ColorWithHex(0xFFFFFF, 1.0);
        
        interest.font = PingFangSC_Medium(12);
        interest.textColor = ColorWithHex(0xFB704B, 1.0);
        
        moneyDes.font = PingFangSC_Regular(12);
        moneyDes.textColor = ColorWithHex(0xFFFFFF, 0.54);
        time.font = PingFangSC_Regular(12);
        self.time.textColor = ColorWithHex(0xFFFFFF, 1.0);
        waringl.font = PingFangSC_Regular(14);
        waringl.textColor = ColorWithHex(0xFFFFFF, 0.54);
        waringl.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        waringl.textAlignment =  NSTextAlignmentCenter;
        moneyDes.text = @"本月应还(元)";
        money.text = @"0.00";
        time.text = @"您当前暂无账单~";
        self.waringl.hidden = YES;
        self.timeImage.hidden = YES;
        //tset
        timeImage.image = ImageNamed(@"时间");
//        time.text = @"还款日";
//        waringl.text = @"您已逾期还款3天，请尽快还款";
        
    }
    return self;
}


- (void)setDate:(myStageHome *)date{
    if (date) {
        _date = date;
        if (date.periodRepaymentSum && date.periodRepaymentSum.length) {
            self.money.text = date.periodRepaymentSum;
        }else{
            self.money.text = @"0.00";
        }
        if (date.interest && date.interest.length) {
            self.interest.text = date.interest;
        }else{
            self.interest.text = @"";
        }
//        date.status = overdue;
        if ([date.status isEqualToString:paid]) {
            self.waringl.hidden = YES;
            self.time.textColor = ColorWithHex(0xFFFFFF, 1.0);
            self.time.text = @"赞，本月已全部还清～";
            [self.time mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.waringl.mas_top).offset(-10);
                make.centerX.equalTo(self);
            }];
            self.timeImage.hidden = YES;
        } else if ([date.status isEqualToString:unpaid] || [date.status isEqualToString:overdue]) {
            self.time.text = nil;
            if (date.repaymentDate && date.repaymentDate.length) {
                self.timeImage.hidden = NO;
                [self.time mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.waringl.mas_top).offset(-10);
                    make.centerX.equalTo(self).offset((12+5)*0.5);
                }];
                NSString *all = [@"还款日 " stringByAppendingString:date.repaymentDate];
                NSRange range1 = [all rangeOfString:@"还款日 "];
                NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
                NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.54),NSForegroundColorAttributeName, nil];
                [attri setAttributes:dic1 range:range1];
                
                NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.87),NSForegroundColorAttributeName, nil];
                [attri setAttributes:dic2 range:NSMakeRange(range1.location+range1.length,all.length-range1.length)];
                self.time.attributedText = attri;
            }
            if ([date.status isEqualToString:unpaid]) {
                self.waringl.hidden = YES;
            } else if ([date.status isEqualToString:overdue]) {
                self.waringl.hidden = NO;
                self.waringl.text = date.overdueTitle;
            }
        }
    }
}


@end
