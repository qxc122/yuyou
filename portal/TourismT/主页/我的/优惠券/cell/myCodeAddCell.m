//
//  myCodeAddCell.m
//  TourismT
//
//  Created by Store on 17/1/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myCodeAddCell.h"


@interface myCodeAddCell ()
@property (nonatomic,weak)UITextField *input;
//@property (nonatomic,weak)UILabel *staue;
//@property (nonatomic,weak)UIImageView *iamgee;
//@property (nonatomic,weak)UILabel *title;
//@property (nonatomic,weak)UILabel *des;
//@property (nonatomic,weak)UILabel *price;
@end

@implementation myCodeAddCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myCodeAddCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myCodeAddCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *inputBack = [[UITextField alloc]init];
        [self.contentView addSubview:inputBack];
        
        
        UITextField *input = [[UITextField alloc]init];
        self.input=input;
        [self.contentView addSubview:input];
        
        UIButton *btnAdd = [[UIButton alloc]init];
        [self.contentView addSubview:btnAdd];
        
        [inputBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(30);
            make.bottom.equalTo(self.contentView).offset(-25);
            make.height.equalTo(@(50));
        }];
        
        [input mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(inputBack).offset(15);
            make.top.equalTo(inputBack);
            make.bottom.equalTo(inputBack);
            make.right.equalTo(inputBack);
        }];
        [btnAdd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(input.mas_right);
            make.right.equalTo(self.contentView).offset(-15);
            make.width.equalTo(@(87));
            make.top.equalTo(input);
            make.bottom.equalTo(input);
            make.height.equalTo(@(50));
        }];
        [input settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(14)];
        LRViewBorder(inputBack, 0.5, ColorWithHex(0x000000, 0.15));
        inputBack.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        btnAdd.backgroundColor = ColorWithHex(0x7692F3, 1.0);
        [btnAdd setBtnWithImage:nil font:PingFangSC_Regular(14) Title:@"兑换" color:0xFFFFFF alpa:1.0 forState:UIControlStateNormal];
        input.placeholder = @"输入兑换码";
        [btnAdd addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        
         [MobClick event:sdfsdfghfh];
        self.btnClick(self.input.text);
    }
}
//- (void)setDatess:(orderlistForOneS *)datess{
//    _datess = datess;
//    if (datess) {
//        self.staue.text = datess.orderStatusCh;
//        [self.iamgee sd_setImageWithURL:[NSURL URLWithString:datess.travelInfoD.image] placeholderImage:ImageNamed(IMAGE_bigBack)];
//        self.title.text = datess.travelInfoD.name;
//        self.oederNum.text = datess.sn;
//        self.des.text = datess.quantityInfo;
//        self.price.text = [NSString stringWithFormat:@"¥%.2f",datess.totalPrice];
//    }
//}
@end
