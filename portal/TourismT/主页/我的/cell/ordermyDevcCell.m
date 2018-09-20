//
//  ordermyDevcCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ordermyDevcCell.h"
//#import "UIView+BadgeValue.h"

@interface ordermyDevcCell ()
//@property (nonatomic,weak) UIButton *btnMore;
//@property (nonatomic,weak) UIButton *btnOne;
//@property (nonatomic,weak) UIButton *btnTwo;
//@property (nonatomic,weak) UIButton *btnThree;
//@property (nonatomic,weak) UIButton *btnFour;
@property (nonatomic,weak) UIView *badgeView1;
@property (nonatomic,weak) UIView *badgeView2;
@property (nonatomic,weak) UIView *badgeView3;
@property (nonatomic,weak) UIView *badgeView4;
@end

@implementation ordermyDevcCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    ordermyDevcCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ordermyDevcCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        

        UIImageView *btnMore = [[UIImageView alloc]init];
        [self.contentView addSubview:btnMore];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UIView *suXian = [[UIView alloc]init];
        [self.contentView addSubview:suXian];
        
        UIView *badgeView1 = [[UIView alloc]init];
        [self.contentView addSubview:badgeView1];
        
        UIView *badgeView2 = [[UIView alloc]init];
        [self.contentView addSubview:badgeView2];
        
        UIView *badgeView3 = [[UIView alloc]init];
        [self.contentView addSubview:badgeView3];
        
        UIView *badgeView4 = [[UIView alloc]init];
        [self.contentView addSubview:badgeView4];
        
        UILabel *btnOne1 = [[UILabel alloc]init];
        [self.contentView addSubview:btnOne1];
        UIImageView *btnOne = [[UIImageView alloc]init];
        [self.contentView addSubview:btnOne];
        
        UILabel *btnTwo1 = [[UILabel alloc]init];
        [self.contentView addSubview:btnTwo1];
        UIImageView *btnTwo = [[UIImageView alloc]init];
        [self.contentView addSubview:btnTwo];
        
        UILabel *btnThree1 = [[UILabel alloc]init];
        [self.contentView addSubview:btnThree1];
        UIImageView *btnThree = [[UIImageView alloc]init];
        [self.contentView addSubview:btnThree];
        
        UILabel *btnFour1 = [[UILabel alloc]init];
        [self.contentView addSubview:btnFour1];
        UIImageView *btnFour = [[UIImageView alloc]init];
        [self.contentView addSubview:btnFour];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        UIButton *btn1 = [[UIButton alloc]init];
        [self.contentView addSubview:btn1];
        UIButton *btn2 = [[UIButton alloc]init];
        [self.contentView addSubview:btn2];
        UIButton *btn3 = [[UIButton alloc]init];
        [self.contentView addSubview:btn3];
        UIButton *btn4 = [[UIButton alloc]init];
        [self.contentView addSubview:btn4];
        UIButton *btn5 = [[UIButton alloc]init];
        [self.contentView addSubview:btn5];
        
        [btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(25-7);
            make.top.equalTo(self.contentView).offset(15-7);
            make.height.equalTo(@(40));//26
            make.width.equalTo(@(40));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnMore);
            make.top.equalTo(btnMore.mas_bottom).offset(15-7);
        }];
        
        [suXian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnMore.mas_right).offset(23-7);
            make.width.equalTo(@(0.5));
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(title);
        }];

        [btnOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(suXian.mas_right);
            make.centerY.equalTo(btnMore);
            make.width.equalTo(@[btnTwo,btnThree,btnFour]);
        }];
        
        [btnOne1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnOne);
            make.centerY.equalTo(title);
        }];
        
        [badgeView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn2.mas_centerX).offset(2+13);
            make.centerY.equalTo(suXian.mas_top);
            make.width.equalTo(@(6));
            make.height.equalTo(@(6));
        }];
        
        [btnTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnOne.mas_right);
            make.centerY.equalTo(btnMore);
        }];
        
        [btnTwo1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnTwo);
            make.centerY.equalTo(title);
        }];
        [badgeView2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn3.mas_centerX).offset(2+13);
            make.centerY.equalTo(suXian.mas_top);
            make.width.equalTo(@(6));
            make.height.equalTo(@(6));
        }];
        
        [btnThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnTwo.mas_right);
            make.centerY.equalTo(btnMore);
        }];
        
        [btnThree1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnThree);
            make.centerY.equalTo(title);
        }];
        [badgeView3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn4.mas_centerX).offset(2+13);
            make.centerY.equalTo(suXian.mas_top);
            make.width.equalTo(@(6));
            make.height.equalTo(@(6));
        }];
        
        [btnFour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnThree.mas_right);
            make.right.equalTo(self.contentView);
            make.centerY.equalTo(btnMore);
        }];
        
        [btnFour1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnFour);
            make.centerY.equalTo(title);
        }];
        [badgeView4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn5.mas_centerX).offset(2+13);
            make.centerY.equalTo(suXian.mas_top);
            make.width.equalTo(@(6));
            make.height.equalTo(@(6));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.height.equalTo(@(10));
            make.top.equalTo(title.mas_bottom).offset(20);
            make.bottom.equalTo(self.contentView);
        }];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(suXian);
            make.top.equalTo(btnMore);
            make.bottom.equalTo(title);
        }];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnOne);
            make.right.equalTo(btnOne);
            make.top.equalTo(btnOne);
            make.bottom.equalTo(btnOne1);
        }];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnTwo);
            make.right.equalTo(btnTwo);
            make.top.equalTo(btnTwo);
            make.bottom.equalTo(btnTwo1);
        }];
        [btn4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnThree);
            make.right.equalTo(btnThree);
            make.top.equalTo(btnThree);
            make.bottom.equalTo(btnThree1);
        }];
        [btn5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnFour);
            make.right.equalTo(btnFour);
            make.top.equalTo(btnFour);
            make.bottom.equalTo(btnFour1);
        }];
        //set

        badgeView1.layer.cornerRadius = 6 / 2;
        badgeView1.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        badgeView2.layer.cornerRadius = 6 / 2;
        badgeView2.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        badgeView3.layer.cornerRadius = 6 / 2;
        badgeView3.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        badgeView4.layer.cornerRadius = 6 / 2;
        badgeView4.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        
        suXian.backgroundColor = ColorWithHex(0x979797, 0.4);
        line.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        
        title.font = PingFangSC_Regular(12);
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.text = @"我的订单";
        
        btnOne1.font = PingFangSC_Regular(12);
        btnOne1.textColor = ColorWithHex(0x000000, 0.87);
        btnOne1.text = @"待付款";
        
        btnTwo1.font = PingFangSC_Regular(12);
        btnTwo1.textColor = ColorWithHex(0x000000, 0.87);
        btnTwo1.text = @"待出游";
        
        btnThree1.font = PingFangSC_Regular(12);
        btnThree1.textColor = ColorWithHex(0x000000, 0.87);
        btnThree1.text = @"待点评";
        
        btnFour1.font = PingFangSC_Regular(12);
        btnFour1.textColor = ColorWithHex(0x000000, 0.87);
        btnFour1.text = @"退款/取消";
        
        btnMore.image = ImageNamed(@"全部订单");
        btnOne.image = ImageNamed(@"待付款my");
        btnTwo.image = ImageNamed(@"待出游my");
        btnThree.image = ImageNamed(@"待评价my");
        btnFour.image = ImageNamed(@"Group 3my");
        
        btnMore.contentMode = UIViewContentModeCenter;
        btnOne.contentMode = UIViewContentModeScaleAspectFit;
        btnTwo.contentMode = UIViewContentModeScaleAspectFit;
        btnThree.contentMode = UIViewContentModeScaleAspectFit;
        btnFour.contentMode = UIViewContentModeScaleAspectFit;
        
        btn1.tag  =all_ordermyDevcCell_btnEnum;
        btn2.tag  =one_ordermyDevcCell_btnEnum;
        btn3.tag  =two_ordermyDevcCell_btnEnum;
        btn4.tag  =three_ordermyDevcCell_btnEnum;
        btn5.tag  =four_ordermyDevcCell_btnEnum;
        self.badgeView1 =badgeView1;
        self.badgeView2 =badgeView2;
        self.badgeView3 =badgeView3;
        self.badgeView4 =badgeView4;
        self.badgeView1.hidden =YES;
        self.badgeView2.hidden =YES;
        self.badgeView3.hidden =YES;
        self.badgeView4.hidden =YES;
        btnOne1.textAlignment = NSTextAlignmentCenter;
        btnTwo1.textAlignment = NSTextAlignmentCenter;
        btnThree1.textAlignment = NSTextAlignmentCenter;
        btnFour1.textAlignment = NSTextAlignmentCenter;
        
        [btn1 addTarget:self action:@selector(btrnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(btrnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 addTarget:self action:@selector(btrnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn4 addTarget:self action:@selector(btrnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn5 addTarget:self action:@selector(btrnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)btrnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(btn.tag);
        if (btn.tag == one_ordermyDevcCell_btnEnum) {
            self.badgeView1.hidden = YES;
        } else if (btn.tag == two_ordermyDevcCell_btnEnum) {
            self.badgeView2.hidden = YES;
        } else if (btn.tag == three_ordermyDevcCell_btnEnum) {
            self.badgeView3.hidden = YES;
        } else if (btn.tag == four_ordermyDevcCell_btnEnum) {
            self.badgeView4.hidden = YES;
        }
    }
}
#pragma  --mark<设置数据>
- (void)setDate:(myAppInfoS *)date{
    if (date) {
        _date = date;
        if (date.orderCountD.unPaidCount>0) {
            self.badgeView1.hidden = NO;
        }else{
            self.badgeView1.hidden = YES;
        }
        if (date.orderCountD.unTripCount>0) {
            self.badgeView2.hidden = NO;
        }else{
            self.badgeView2.hidden = YES;
        }
        if (date.orderCountD.unCommentCount>0) {
            self.badgeView3.hidden = NO;
        }else{
            self.badgeView3.hidden = YES;
        }
        if (date.orderCountD.refundCancelCount>0) {
            self.badgeView4.hidden = NO;
        }else{
            self.badgeView4.hidden = YES;
        }
    }else{
        self.badgeView1.hidden = YES;
        self.badgeView2.hidden = YES;
        self.badgeView3.hidden = YES;
        self.badgeView4.hidden = YES;
    }
}
@end

