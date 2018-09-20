//
//  daojishi.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "daojishi.h"
#import "NSDate+DateTools.h"
@interface daojishi (){
    NSTimer *_scrollTimer;
}
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,assign) int endTimeTwo;
@end
@implementation daojishi

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(ScreenWidth/4.0/2.0);
            make.right.equalTo(self).offset(-ScreenWidth/4.0/2.0);
            make.top.equalTo(self).offset(76);
            make.height.equalTo(@(2));
        }];

        UILabel *time = [[UILabel alloc]init];
        [self addSubview:time];

        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(30);
        }];
        
        //set
        self.time = time;
//        time.textColor = ColorWithHex(0x779CF4, 1.0);
//        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x000000, 0.54);
        time.font = PingFangSC_Regular(12);
        //test
        //        time.text = @"45:20";
//        des.text = @"后自动取消订单";
        
    }
    return self;
}
- (void)setEndTime:(int)endTime{
//    endTime = 1483761600;//TODO
    _endTime = endTime/1000;
    self.endTimeTwo = _endTime;
    if (_endTime > 0) {
        [self removeTimer];
        [self creatTimer];
        [self timerRunning];
    } else {
        self.time.text = @"该订单已过期";
        [self.time settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
    }
}

- (void)dealloc{
    [self removeTimer];
}
#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
}
-(void)timerRunning{
/*
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:self.endTime];
    if (![detaildate isEarlierThan:[NSDate date]]) {
        
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:self.endTime];
        
        NSDate *date = [NSDate date];
        
        //计算时间间隔（单位是秒）
        
        NSTimeInterval time = [date1 timeIntervalSinceDate:date];
        
        //计算天数、时、分、秒
        
        int days = ((int)time)/(3600*24);
        
        int hours = ((int)time)%(3600*24)/3600;
        
        int minutes = ((int)time)%(3600*24)%3600/60;
        
        int seconds = ((int)time)%(3600*24)%3600%60;
        
        NSString *dateContent = [[NSString alloc] initWithFormat:@"%i天%i小时%i分%i秒",days,hours,minutes,seconds];
        
        NSString *addStr = @" 后自动取消订单";

        NSString *all = [dateContent stringByAppendingString:addStr];
        NSRange range1 = [all rangeOfString:dateContent];
        NSRange range2 = [all rangeOfString:addStr];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x779CF4, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];
        
        self.time.attributedText = attri;

    }else{
        [self removeTimer];
        NSString *timee = [[NSDate dateWithTimeIntervalSince1970:self.endTime] formattedDateWithStyle:NSDateFormatterShortStyle];
        self.time.text = [NSString stringWithFormat:@"已于 %@ 过期",timee];
    }
 */
    if (self.endTime > 0) {
        int minutes = ((int)self.endTimeTwo)/60;
        
        int seconds = ((int)self.endTimeTwo)%60;
        NSString *dateContent = [[NSString alloc] initWithFormat:@"%i分%i秒",minutes,seconds];
        NSString *addStr = @" 后自动取消订单";
        
        NSString *all = [dateContent stringByAppendingString:addStr];
        NSRange range1 = [all rangeOfString:dateContent];
        NSRange range2 = [all rangeOfString:addStr];
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x779CF4, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];
        
        self.time.attributedText = attri;
        self.endTimeTwo--;
    }else{
        self.time.text = @"该订单已过期";
        [self.time settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        if (self.endDaojishi) {
            self.endDaojishi();
        }
    }
}
#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}
@end
