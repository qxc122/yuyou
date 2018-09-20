//
//  peopeoToCell.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "peopeoToCell.h"


@interface peopeoToCell ()
@property (nonatomic,weak) UILabel *orderNum;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *name1;
@end

@implementation peopeoToCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    peopeoToCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[peopeoToCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *line =[[UIView alloc]init];
        [self.contentView addSubview:line];
        
        UILabel *orderNum1 =[[UILabel alloc]init];
        [self.contentView addSubview:orderNum1];
        
        UILabel *name1 =[[UILabel alloc]init];
        [self.contentView addSubview:name1];

        
        UILabel *orderNum =[[UILabel alloc]init];
        [self.contentView addSubview:orderNum];
        
        UILabel *name =[[UILabel alloc]init];
        [self.contentView addSubview:name];

        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        [orderNum1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.centerY.equalTo(orderNum);
            make.width.equalTo(@[name1]);
        }];
        [name1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.centerY.equalTo(name);
            make.width.equalTo(@(60));
            make.bottom.equalTo(self.contentView).offset(-17);
        }];

        [orderNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum1.mas_right).offset(20);
            make.right.equalTo(line).offset(0);
            make.top.equalTo(line.mas_bottom).offset(17);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(orderNum);
            make.right.equalTo(line).offset(0);
            make.top.equalTo(orderNum1.mas_bottom).offset(20);
        }];
        //set
        self.orderNum =orderNum;
        self.name =name;
        self.name1 =name1;
        line.backgroundColor  =ColorWithHex(0x000000, 0.4);
        orderNum1.textColor = ColorWithHex(0x000000, 0.53);
        orderNum1.font = PingFangSC_Regular(14);
        orderNum.textColor = ColorWithHex(0x000000, 0.87);
        orderNum.font = PingFangSC_Regular(14);
        
        name1.textColor = ColorWithHex(0x000000, 0.53);
        name1.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x000000, 0.87);
        name.font = PingFangSC_Regular(14);
        orderNum.numberOfLines = 0;
        name.numberOfLines = 0;
        orderNum1.text = @"姓名";
        //name1.text = @"证件号码";
        //test
//        orderNum.text = @"xingm";
//        name.text = @"1123123223";
    }
    return self;
}
- (void)setDetail:(travellerS *)detail{
    _detail = detail;
    if (detail) {
        if ([detail.idType isEqualToString:SFZ]) {
            self.orderNum.text =detail.realname;
            self.name1.text = @"身份证";
            self.name.text = detail.idNumber;
        }else if ([detail.idType isEqualToString:GUOJIHUzhao]){
            self.name1.text = @"护照";
            self.name.text = detail.passportNumber;
              self.orderNum.text =[NSString stringWithFormat:@"%@ / %@",detail.firstname,detail.lastname];
        }
        
    }
}
@end
