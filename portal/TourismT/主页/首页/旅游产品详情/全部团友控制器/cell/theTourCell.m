//
//  theTourCell.m
//  TourismT
//
//  Created by Store on 16/12/13.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "theTourCell.h"

#define WIDTH_ICON_theTourCell  55

@interface theTourCell ()
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UIImageView *sex;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *age;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UILabel *allPeople;
@property (nonatomic,weak) UIImageView *allPeopleImage;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UIButton *together;
@end

@implementation theTourCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    theTourCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[theTourCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *line = [[UIView alloc]init];
        line.backgroundColor = ColorWithHex(0x000000, 0.1);
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView ).offset(15);
            make.right.equalTo(self.contentView ).offset(-15);
            make.bottom.equalTo(self.contentView );
            make.height.equalTo(@(0.5));
        }];
        
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        
        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UIImageView *sex = [[UIImageView alloc]init];
        self.sex = sex;
        [self.contentView addSubview:sex];
        
        UILabel *age = [[UILabel alloc]init];
        [self.contentView addSubview:age];
        
        UILabel *time = [[UILabel alloc]init];
        [self.contentView addSubview:time];
        
        UIImageView *timeImage = [[UIImageView alloc]init];
        [self.contentView addSubview:timeImage];
        
        UILabel *allPeople = [[UILabel alloc]init];
        [self.contentView addSubview:allPeople];
        
        UIImageView *allPeopleImage = [[UIImageView alloc]init];
        [self.contentView addSubview:allPeopleImage];
        

        UIButton *together = [UIButton buttonWithType:UIButtonTypeCustom];
//        together.userInteractionEnabled  =NO;
        self.together = together;
        [together setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
        [together setTitle:@"一同出行" forState:UIControlStateNormal];
        together.titleLabel.font = PingFangSC_Regular(12);
        [together addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:together];

        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(self.contentView ).offset(15);
            make.width.equalTo(@(WIDTH_ICON_theTourCell));
            make.height.mas_equalTo(icon.mas_width).multipliedBy(1.0);
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(icon.mas_right).offset(15);
            //make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(icon).offset(5);
        }];
        
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name.mas_right).offset(2);
            make.top.equalTo(name).offset(0);
            make.width.equalTo(@(10));
            make.height.mas_equalTo(sex.mas_width).multipliedBy(1.0);
        }];
        
        [age mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(sex.mas_right).offset(16);
//            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(name);
        }];
        
        [timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.centerY.equalTo(time);
            make.width.equalTo(@(15));
            make.height.mas_equalTo(timeImage.mas_width).multipliedBy(1.0);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(timeImage.mas_right).offset(16);
            make.top.equalTo(name.mas_bottom).offset(20);
        }];
        
        [allPeopleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.centerY.equalTo(allPeople);
            make.width.equalTo(@(15));
            make.height.mas_equalTo(allPeopleImage.mas_width).multipliedBy(1.0);
        }];
        
        [allPeople mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(time.mas_bottom).offset(10);
            make.left.equalTo(allPeopleImage.mas_right).offset(16);
            make.bottom.equalTo(line.mas_top).offset(-15);
        }];
        
        [together mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView ).offset(-15);
            make.centerY.equalTo(timeImage.mas_bottom).offset(5);
            make.width.equalTo(@(60));
            make.height.equalTo(@(24));
        }];
        LRViewRadius(icon, WIDTH_ICON_theTourCell/2.0);
        self.icon = icon;
        self.name = name;
        self.age = age;
        self.time = time;
        self.allPeople = allPeople;
        self.line =line;
        LRViewRadius(together, cornerRadius_width);

        sex.image = ImageNamed(@"男");
        sex.highlightedImage = ImageNamed(@"女");
        timeImage.image = ImageNamed(@"日历");
        allPeopleImage.image = ImageNamed(@"我");
        
        name.font = PingFangSC_Medium(16);
        name.textColor = ColorWithHex(0x000000, 0.86);
        age.font = PingFangSC_Regular(12);
        age.textColor = ColorWithHex(0xC3C3C3, 1.0);
        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x000000, 0.40);
        allPeople.font = PingFangSC_Regular(14);
        allPeople.textColor = ColorWithHex(0x000000, 0.4);
        
        //test
//        sex.highlighted = YES;
//        icon.image = ImageNamed(@"123");
//        
//        name.text = @"Angelababy";
//        age.text = @"24岁";
//        time.text = @"2016.11.03";
//        allPeople.text = @"成人×1 儿童×1";
    }
    return self;
}
- (void)BtnClick:(UIButton *)sender{
    if (self.togetherClick) {
        self.togetherClick(self.index);
    }
}
- (void)setUserD:(UserS *)UserD{
//    NSLog(@"%@ %ld %ld",UserD.gender,(long)UserD.childQuantity,UserD.quantity);
    
    _UserD = UserD;
    if ([UserD.gender isEqualToString:SEX_male]) {
        self.sex.highlighted = NO;
    } else if ([UserD.gender isEqualToString:SEX_female]){
        self.sex.highlighted = YES;
    }
    NSLog(@"UserD=%@",UserD.age);
    self.name.text = UserD.name;
    self.age.text = UserD.age;
    self.time.text = UserD.date;
//    self.name.text = UserD.avatar;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:UserD.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
    NSString *str =@"";
    if (UserD.quantity > 0) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@"成人x%ld",(long)UserD.quantity]];
    }
    if (UserD.childQuantity > 0) {
        str = [str stringByAppendingString:[NSString stringWithFormat:@" 儿童x%ld",(long)UserD.childQuantity]];
    }
    if ([str hasPrefix:@" "]) {
        str = [str substringFromIndex:1];
    }
    self.allPeople.text = str;
}
- (void)setIsHidenBtn:(BOOL)isHidenBtn{
    _isHidenBtn = isHidenBtn;
    self.together.hidden = isHidenBtn;
}
@end
