//
//  timeCell.m
//  TourismT
//
//  Created by Store on 2017/8/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "timeCell.h"


@interface timeCell ()
@property (nonatomic,weak) UILabel *time;
@end

@implementation timeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    timeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[timeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UILabel *time = [UILabel new];
        time.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:time];
        self.time = time;
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@47.0);
        }];
        [time settextColorhex:0x000000 alpa:0.25 font:PingFangSC_Regular(12)];
        time.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

- (void)setTimeStr:(NSString *)timeStr{
    _timeStr = timeStr;
    self.time.text = timeStr;
}

@end
