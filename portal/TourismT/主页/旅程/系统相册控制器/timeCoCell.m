//
//  timeCoCell.m
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "timeCoCell.h"

@interface timeCoCell ()
@property (nonatomic,weak) UILabel *time;
@end

@implementation timeCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //self.backgroundColor = [UIColor redColor];
        UILabel *time = [[UILabel alloc]init];
        self.time = time;
        [self.contentView addSubview:time];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        time.textColor = ColorWithHex(0x000000, 0.8);
        time.font = PingFangSC_Regular(14);
    }
    return self;
}
- (void)setTimeStr:(NSString *)timeStr{
    _timeStr = timeStr;
    self.time.text = timeStr;
}
@end
