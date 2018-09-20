//
//  lastOkTwoCell.m
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "lastOkTwoCell.h"



@interface lastOkTwoCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *des;
@end

@implementation lastOkTwoCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    lastOkTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[lastOkTwoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView  addSubview:des];
        
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView  addSubview:image];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView ).offset(20);
            make.right.equalTo(self.contentView ).offset(-20);
            make.top.equalTo(self.contentView ).offset(15);
            make.height.equalTo(@14);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.right.equalTo(image.mas_left);
            make.top.equalTo(name.mas_bottom).offset(5);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@14);
        }];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(name);
            make.centerY.equalTo(des);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        
//        name.backgroundColor = [UIColor redColor];
//        des.backgroundColor = [UIColor yellowColor];
        //set
        name.textColor = ColorWithHex(0x000000, 0.87);
        des.textColor = ColorWithHex(0x000000, 0.87);
        name.numberOfLines = 0;
        des.numberOfLines = 0;
        name.font = PingFangSC_Regular(14);
        des.font = PingFangSC_Regular(14);
        image.image = ImageNamed(@"选中");
        self.name = name;
        self.des = des;
        self.image = image;
        self.image.hidden = YES;
    }
    return self;
}
- (void)setPeoOne:(travellerS *)peoOne{
    _peoOne = peoOne;
    if (peoOne) {
        self.name.text = peoOne.realname;
        self.des.text = peoOne.idNumber;
    }
//    if (peoOne.idType && peoOne.idType.length) {
//        if ([peoOne.idType isEqualToString:SFZ]) {
//            self.name.text = peoOne.realname;
//            self.des.text = peoOne.idNumber;
//        } else if ([peoOne.idType isEqualToString:GUOJIHUzhao]){
//            self.des.text = peoOne.passportNumber;
//            self.name.text = [NSString stringWithFormat:@"%@ / %@",peoOne.firstname,peoOne.lastname];
//        }
//    } else {
//        self.name.text = peoOne.realname;
//    }
    
}

- (void)setIsHidenImage:(BOOL)isHidenImage{
    _isHidenImage = isHidenImage;
    self.image.hidden = isHidenImage;
}
@end
