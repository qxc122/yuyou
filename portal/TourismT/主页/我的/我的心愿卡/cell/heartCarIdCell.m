//
//  heartCarIdCell.m
//  TourismT
//
//  Created by Store on 2017/4/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "heartCarIdCell.h"


@interface heartCarIdCell ()
@property (nonatomic,weak) UILabel *iconCard1;
@end

@implementation heartCarIdCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    heartCarIdCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[heartCarIdCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *backview = [[UIView alloc]init];
        [self.contentView addSubview:backview];
        
        UIImageView *iconCard = [[UIImageView alloc]init];
        [self.contentView addSubview:iconCard];
        
        UILabel *iconCard1 = [[UILabel alloc]init];
        self.iconCard1 = iconCard1;
        [self.contentView addSubview:iconCard1];
        
//        UILabel *iconCard2 = [[UILabel alloc]init];
//        [self.contentView addSubview:iconCard2];
//        
//        UILabel *iconCard3 = [[UILabel alloc]init];
//        [self.contentView addSubview:iconCard3];
//        
//        UILabel *iconCard4 = [[UILabel alloc]init];
//        [self.contentView addSubview:iconCard4];
        
        UIImageView *icon1 = [[UIImageView alloc]init];
        [self.contentView addSubview:icon1];
        
        UIImageView *icon2 = [[UIImageView alloc]init];
        [self.contentView addSubview:icon2];
        
        UIImageView *icon3 = [[UIImageView alloc]init];
        [self.contentView addSubview:icon3];
        
        UILabel *iconLabel1 = [[UILabel alloc]init];
        [self.contentView addSubview:iconLabel1];
        
        UILabel *iconLabel2 = [[UILabel alloc]init];
        [self.contentView addSubview:iconLabel2];
        
        UILabel *iconLabel3 = [[UILabel alloc]init];
        [self.contentView addSubview:iconLabel3];

        [backview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            if (ScreenHeight==812){
                make.height.equalTo(@(ScreenHeight - NOneHead - NOneFoot - HEIGHT_NavbarX));
            }else{
                make.height.equalTo(@(ScreenHeight - NOneHead - NOneFoot - HEIGHT_Navbar));
            }
            
        }];
        
        [iconCard mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(40);
            make.height.equalTo(@(204*WIDTHICON));
        }];
        [iconCard1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(iconCard).offset(-24);
            make.left.equalTo(self.contentView).offset(62);
            make.right.equalTo(self.contentView).offset(-62);
        }];
        
//        [iconCard1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(iconCard).offset(-24);
//            make.left.equalTo(self.contentView).offset(62);
//            make.width.equalTo(@[iconCard2,iconCard3,iconCard4]);
//        }];
//        [iconCard2 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(iconCard1);
//            make.bottom.equalTo(iconCard1);
//            make.left.equalTo(iconCard1.mas_right);
//        }];
//        [iconCard3 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(iconCard1);
//            make.bottom.equalTo(iconCard1);
//            make.left.equalTo(iconCard2.mas_right);
//        }];
//        [iconCard4 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(iconCard1);
//            make.bottom.equalTo(iconCard1);
//            make.left.equalTo(iconCard3.mas_right);
//            make.right.equalTo(self.contentView).offset(-62);
//        }];
        
        
        [icon1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconCard.mas_bottom).offset(46);
            make.left.equalTo(self.contentView);
            make.height.equalTo(@(40));
            make.width.equalTo(@[icon2,icon3]);
        }];
        [icon2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconCard.mas_bottom).offset(46);
            make.left.equalTo(icon1.mas_right);
            make.height.equalTo(@(40));
        }];
        [icon3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconCard.mas_bottom).offset(46);
            make.left.equalTo(icon2.mas_right);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(40));
        }];
        
        [iconLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(icon1.mas_bottom).offset(15);
            make.centerX.equalTo(icon1);
        }];
        [iconLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(icon2.mas_bottom).offset(15);
            make.centerX.equalTo(icon2);
        }];
        [iconLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(icon3.mas_bottom).offset(15);
            make.centerX.equalTo(icon3);
        }];

        //set
        iconLabel1.font = PingFangSC_Regular(12);
        iconLabel1.textColor = ColorWithHex(0x000000, 0.4);
        iconLabel1.text = @"说走就走";
        iconLabel2.font = PingFangSC_Regular(12);
        iconLabel2.textColor = ColorWithHex(0x000000, 0.4);
        iconLabel2.text = @"先出行后还款";
        iconLabel3.font = PingFangSC_Regular(12);
        iconLabel3.textColor = ColorWithHex(0x000000, 0.4);
        iconLabel3.text = @"免息特权";
        icon1.contentMode = UIViewContentModeCenter;
        icon2.contentMode = UIViewContentModeCenter;
        icon3.contentMode = UIViewContentModeCenter;
        
        iconCard.image = ImageNamed(@"心愿卡");
        icon1.image = ImageNamed(@"说走就走");
        icon2.image = ImageNamed(@"先出行后付款");
        icon3.image = ImageNamed(@"免息特权");
        
//        iconCard1.font = PingFangSC_Regular(12);
//        iconCard1.textColor = ColorWithHex(0xFFFFFF, 1.0);
//        iconCard1.text = @"****";
//        
//        iconCard2.font = PingFangSC_Regular(12);
//        iconCard2.textColor = ColorWithHex(0xFFFFFF, 1.0);
//        iconCard2.text = @"****";
//        
//        iconCard3.font = PingFangSC_Regular(12);
//        iconCard3.textColor = ColorWithHex(0xFFFFFF, 1.0);
//        iconCard3.text = @"****";
//        
//        iconCard4.font = PingFangSC_Regular(12);
//        iconCard4.textColor = ColorWithHex(0xFFFFFF, 1.0);
//        iconCard4.text = @"****";
        
//        iconCard1.textAlignment = NSTextAlignmentLeft;
//        iconCard2.textAlignment = NSTextAlignmentCenter;
//        iconCard3.textAlignment = NSTextAlignmentCenter;
//        iconCard4.textAlignment = NSTextAlignmentRight;
        
//        [self setLabelSpace:iconCard1 withValue:@"****" :NSTextAlignmentLeft];
//        [self setLabelSpace:iconCard2 withValue:@"****" :NSTextAlignmentCenter];
//        [self setLabelSpace:iconCard3 withValue:@"****" :NSTextAlignmentCenter];
        [self setLabelSpace:iconCard1 withValue:@"****  ****  ****  ****" :NSTextAlignmentCenter];
    }
    return self;
}

- (void)setDate:(myHeartHome *)date{
    if (date) {
        _date = date;
        if (date.cardNo && date.cardNo.length) {
            [self setLabelSpace:self.iconCard1 withValue:date.cardNo :NSTextAlignmentCenter];
        }
    }
}

-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str :(NSTextAlignment)alignment{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = alignment;
    
    //设置字间距 NSKernAttributeName:@1.5f
    
    NSDictionary *dic = @{ NSParagraphStyleAttributeName:paraStyle,NSFontAttributeName:PingFangSC_Regular(16), NSKernAttributeName:@1.78f,NSForegroundColorAttributeName:ColorWithHex(0xFFFFFF, 1.0),
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    
    label.attributedText = attributeStr;
    
}
@end
