//
//  RecordVcCell.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "RecordVcCell.h"


@interface RecordVcCell ()
@property (nonatomic,weak) UILabel *label1;
@property (nonatomic,weak) UILabel *label2;
@property (nonatomic,weak) UILabel *time;
@end

@implementation RecordVcCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    RecordVcCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[RecordVcCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        UILabel *label1 = [UILabel new];
        [self.contentView addSubview:label1];
        
        UILabel *label2 = [UILabel new];
        [self.contentView addSubview:label2];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];
        
        UIImageView *more = [UIImageView new];
        [self.contentView addSubview:more];
        
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(15);
        }];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1);
            make.top.equalTo(label1.mas_bottom).offset(12);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.top.equalTo(label2.mas_bottom).offset(15);
            make.height.equalTo(@0.5);
        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(label1);
            make.width.equalTo(@6);
            make.height.equalTo(@12);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more).offset(-10);
            make.centerY.equalTo(label1);
        }];
        
        //set
        self.label1  =label1;
        self.label2  =label2;
        self.time  =time;
        more.image = ImageNamed(@"向右灰色");
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        label1.font = PingFangSC_Regular(17);
        label1.textColor = ColorWithHex(0x00000, .87);
        label2.font = PingFangSC_Regular(14);
        label2.textColor = ColorWithHex(0x00000, 0.54);
        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x00000, 0.54);
        //test
//        label1.text = @"123";
//        label2.text = @"123";
//        time.text = @"12df3";
        
    }
    return self;
}


- (void)setDate:(rePaymentInfoAllForONeS *)date{
    if (date) {
        _date =date;
        self.label1.text  =[NSString stringWithFormat:@"%@",date.amount];
        self.label2.text  =date.method;
        self.time.text  =date.paymentDate;
    }
}
@end
