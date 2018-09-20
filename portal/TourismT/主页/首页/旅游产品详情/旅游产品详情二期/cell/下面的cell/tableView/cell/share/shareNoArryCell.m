//
//  shareNoArryCell.m
//  TourismT
//
//  Created by Store on 2017/8/29.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "shareNoArryCell.h"


@interface shareNoArryCell ()

@end

@implementation shareNoArryCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    shareNoArryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[shareNoArryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *des = [UILabel new];
        [self.contentView addSubview:des];
        
        UILabel *desHead = [UILabel new];
        [self.contentView addSubview:desHead];
        
        UILabel *desFoot = [UILabel new];
        [self.contentView addSubview:desFoot];
        
        UIImageView *desimage = [UIImageView new];
        [self.contentView addSubview:desimage];
        
        UIView *lineOne = [UIView new];
        [self.contentView addSubview:lineOne];
        
        [desimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(18);
            make.height.equalTo(@24);
            make.width.equalTo(@24);
        }];
        
        [desHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(desimage.mas_right).offset(10);
            make.centerY.equalTo(desimage);
            make.width.equalTo(@60);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(desHead.mas_right).offset(6);
            make.centerY.equalTo(desimage);
        }];
        
        [desFoot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(15);
            //            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(desimage);
        }];
        [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(desimage.mas_bottom).offset(18);
            make.height.equalTo(@10);
        }];
        
        //set
        self.des = des;
        self.desimage = desimage;
        self.lineOne = lineOne;
        des.font = PingFangSC_Medium(14);
        des.textColor = ColorWithHex(0x000000, 0.87);
        desHead.font = PingFangSC_Regular(14);
        desHead.textColor = ColorWithHex(0x000000, 0.87);
        desFoot.font = PingFangSC_Regular(14);
        desFoot.textColor = ColorWithHex(0x000000, 0.87);
        lineOne.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        desimage.image = ImageNamed(@"供应商");
        desHead.text = @"本产品由";
        desFoot.text = @"提供";
        //test
    }
    return self;
}


- (void)setData:(tourDetaisData *)data{
    if (data) {
        _data = data;
        self.des.text = data.company;
    }
}

@end
