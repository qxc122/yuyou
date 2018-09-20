//
//  followOrNOCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "followOrNOCell.h"
#import "UIImageView+CornerRadius.h"


@interface followOrNOCell ()
@property (nonatomic,weak) UIImageView *sex;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIButton *yesOrno;
@end

@implementation followOrNOCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    followOrNOCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[followOrNOCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        
        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UIImageView *sex = [[UIImageView alloc]init];
        [self.contentView addSubview:sex];
        
        UIButton *yesOrno = [[UIButton alloc]init];
        [self.contentView addSubview:yesOrno];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(line.mas_top).offset(-10);
            make.width.mas_equalTo(image.mas_height).multipliedBy(1.0);
            make.height.equalTo(@(44));
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.top.equalTo(image).offset(2);
        }];
        
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name.mas_right).offset(1);
            make.centerY.equalTo(name.mas_top).offset(5);
            make.width.mas_equalTo(sex.mas_height).multipliedBy(1.0);
            make.height.equalTo(@(10));
        }];
        [yesOrno mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_right).offset(-35);
            make.centerY.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(18+12+7));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);;
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        
        //set
        self.sex  =sex;
        self.name  =name;
        self.image  =image;
        self.yesOrno  =yesOrno;
        
        sex.image = ImageNamed(@"男");
        sex.highlightedImage = ImageNamed(@"女");
        line.backgroundColor = ColorWithHex(0x979797, 0.1);
        name.font = PingFangSC_Regular(16);
        name.textColor = ColorWithHex(0x000000, 0.87);
        //IMAGEsetCONTENTMODE(image);
        //LRViewRadius(image, 44/2.0);
        [image zy_cornerRadiusRoundingRect];
        
//        [self.yesOrno setImage:ImageNamed(@"已关注111") forState:UIControlStateNormal];
//        [self.yesOrno setTitle:@"已关注" forState:UIControlStateNormal];
//        [self.yesOrno setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        yesOrno.titleLabel.font = PingFangSC_Regular(12);
        [yesOrno addTarget:self action:@selector(yesOrnoBTnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //test
//        name.text =@"清迈";
//        image.image = ImageNamed(IMAGE_bigBack);
    }
    return self;
}
- (void)setOneoe:(UserS *)oneoe{
    _oneoe = oneoe;
    if (oneoe) {
        [self.image sd_setImageWithURL:[NSURL URLWithString:oneoe.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.name.text = oneoe.nickName;
        if ([oneoe.gender isEqualToString:SEX_male]) {
            self.sex.highlighted = NO;
        } else if ([oneoe.gender isEqualToString:SEX_female]){
            self.sex.highlighted = YES;
        }
        if (!self.isGuangzhu) {
            if (oneoe.isFollow) {
                self.yesOrno.selected = NO;
                [self.yesOrno setBtnWithImage:@"已关注111" font:nil Title:@"取消关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
                [UIButton setdirectionV:self.yesOrno withSpa:7.0];
            } else {
                self.yesOrno.selected = YES;
                [self.yesOrno setBtnWithImage:@"加关注111" font:nil  Title:@"加关注" color:0xFB704B alpa:1.0 forState:UIControlStateNormal];
                [UIButton setdirectionV:self.yesOrno withSpa:7.0];
            }
        }else{
            [self.yesOrno setBtnWithImage:@"已关注111"  font:nil Title:@"已关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        }
    }
}

- (void)yesOrnoBTnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (self.YESorNOClick) {
        self.YESorNOClick(self.index,btn.isSelected);
        if (btn.selected) {
            [self.yesOrno setBtnWithImage:@"加关注111"  font:nil Title:@"加关注" color:0xFB704B alpa:1.0 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        } else {
            [self.yesOrno setBtnWithImage:@"已关注111"  font:nil Title:@"取消关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        }
    }
}
@end
