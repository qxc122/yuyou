//
//  oneForMyDeVcCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "oneForMyDeVcCell.h"
#import "UIView+BadgeValue.h"
@interface oneForMyDeVcCell ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIView *badgeView;

@end

@implementation oneForMyDeVcCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    oneForMyDeVcCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[oneForMyDeVcCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
            make.width.equalTo(@(26));
            make.height.equalTo(@(26));
        }];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(15);;
            make.centerY.equalTo(icon);
        }];
        
        UIView *badgeView = [[UIView alloc]init];
        self.badgeView =badgeView;
        badgeView.layer.cornerRadius = 6 / 2;
        badgeView.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        [self.contentView addSubview:badgeView];
        [badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title.mas_right).offset(0);
            make.top.equalTo(title).offset(-6);
            make.width.equalTo(@(6));
            make.height.equalTo(@(6));
        }];
        
        
        UIImageView *btn = [[UIImageView alloc]init];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(icon);
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
        }];
        
        //set
        self.badgeView.hidden = YES;
        self.title = title;
        self.icon = icon;
        btn.image = ImageNamed(@"点击");
//        title.text = @"请先注册";
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 1.0);
    }
    return self;
}
- (void)setCouponCount:(NSInteger)couponCount{
    _couponCount = couponCount;
    if (couponCount) {
        self.badgeView.hidden = NO;
    }else{
        self.badgeView.hidden = YES;
    }
}
- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    self.icon.image = ImageNamed(dic[imageStr]);
    self.title.text = dic[desStr];
}
@end
