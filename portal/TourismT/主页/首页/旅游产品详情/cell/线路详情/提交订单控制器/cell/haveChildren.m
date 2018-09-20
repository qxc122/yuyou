//
//  haveChildren.m
//  TourismT
//
//  Created by Store on 2017/4/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "haveChildren.h"



@interface haveChildren ()
@property (nonatomic,weak) UILabel *childrenPrice;
@property (nonatomic,weak) UILabel *childrenNum;
@end

@implementation haveChildren

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    haveChildren *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[haveChildren alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UILabel *children = [[UILabel alloc]init];
        [self.contentView addSubview:children];
        
        UILabel *childrenPrice = [[UILabel alloc]init];
        [self.contentView addSubview:childrenPrice];
        
        UILabel *childrenNum  = [[UILabel alloc]init];
        [self.contentView addSubview:childrenNum ];
        
        [children mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.Adult);
            make.centerY.equalTo(childrenPrice);
            make.width.equalTo(@30);
        }];
        [childrenPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(children.mas_right).offset(20);
            make.top.equalTo(self.Adult.mas_bottom).offset(32);
        }];
        [childrenNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.title2);
            make.left.equalTo(childrenPrice.mas_right).offset(5);
            make.centerY.equalTo(childrenPrice);
            make.width.equalTo(@50);
        }];
//        
//        [children mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.back).offset(15);
//            make.top.equalTo(childrenPrice);
//            make.bottom.equalTo(childrenPrice);
//            make.width.equalTo(@30);
//        }];
//        [childrenPrice mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(children.mas_right).offset(20);
//            make.top.equalTo(self.Adult.mas_bottom).offset(32);
//            make.bottom.equalTo(children);
//        }];
//        [childrenNum mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(childrenPrice.mas_right).offset(10);
//            make.right.equalTo(self.back).offset(-14);
//            make.top.equalTo(children);
//            make.bottom.equalTo(children);
//            make.width.equalTo(@50);
//        }];
        [self.line2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(childrenPrice.mas_bottom).offset(16);
        }];
        //set
        children.font = PingFangSC_Regular(14);
        children.textColor  =ColorWithHex(0x000000, 0.87);
        childrenPrice.font = PingFangSC_Regular(14);
        childrenPrice.textColor  =ColorWithHex(0x000000, 0.87);
        childrenNum.font = PingFangSC_Regular(14);
        childrenNum.textColor  =ColorWithHex(0x000000, 0.87);
        children.text = @"儿童";
        childrenPrice.numberOfLines = 0;
        childrenNum.textAlignment = NSTextAlignmentRight;
        self.Adult.text = @"成人";
        self.childrenNum = childrenNum;
        self.childrenPrice = childrenPrice;
        //test
//        children.text = @"成人";
//        childrenPrice.text = @"首府asfdasdfa";
//        childrenNum.text = @"*2人";
    }
    return self;
}
- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    if (orderinfoData) {
        [super setOrderinfoData:orderinfoData];

        self.AdultPrice.text = orderinfoData.adultPrice;
        self.AdultNum.text = orderinfoData.adultNum;
        
        self.childrenPrice.text = orderinfoData.childPrice;
        self.childrenNum.text = orderinfoData.childNum;
    }
}
@end
