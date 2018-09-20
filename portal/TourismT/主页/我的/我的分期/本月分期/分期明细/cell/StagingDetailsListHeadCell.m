//
//  StagingDetailsListHeadCell.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "StagingDetailsListHeadCell.h"


@interface StagingDetailsListHeadCell ()
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *orderNumber;
@property (nonatomic,weak) UILabel *des;

@end

@implementation StagingDetailsListHeadCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    StagingDetailsListHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[StagingDetailsListHeadCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF3F3F3, 1.0);
        
        
        UILabel *name = [UILabel new];
        [self.contentView addSubview:name];
        
        UILabel *time = [UILabel new];
        [self.contentView addSubview:time];

        
        UILabel *des = [UILabel new];
        [self.contentView addSubview:des];
        
        UILabel *orderNumber = [UILabel new];
        [self.contentView addSubview:orderNumber];

        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(name.mas_bottom).offset(11);
            make.bottom.equalTo(self.contentView).offset(-16);
        }];

        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(time.mas_right).offset(10);
            make.top.equalTo(time);
            make.bottom.equalTo(time);
        }];
        

        [orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(5);
            make.top.equalTo(time);
            make.bottom.equalTo(time);
        }];
        

        //set

        
        name.font = PingFangSC_Regular(17);
        name.textColor = ColorWithHex(0x00000, 0.87);
        time.font = PingFangSC_Regular(12);
        time.textColor = ColorWithHex(0x00000, 0.87);
        des.font = PingFangSC_Regular(12);
        des.textColor = ColorWithHex(0x00000 , 0.87);
        orderNumber.font = PingFangSC_Regular(12);
        orderNumber.textColor = ColorWithHex(0x00000, 0.87);
        des.text = @"订单号:";

        self.des = des;
        self.name = name;
        self.time = time;
        self.orderNumber = orderNumber;
        //test
//        name.text = @"芽庄游览滨海沙大学生毕业季";
//        time.text = @"2017-03-10";
//        orderNumber.text = @"12345878";
        
    }
    return self;
}
- (void)setDate:(periodItemListAForAll *)date{
    if (date) {
        _date = date;
        self.name.text = date.travelName;
        self.time.text = date.goDate;
        if ([date.orderSn rangeOfString:@"订单号"].location != NSNotFound) {
            self.des.text = date.orderSn;
        } else {
            self.des.text = @"订单号: ";
            self.orderNumber.text = date.orderSn;
        }
    }
}
@end
