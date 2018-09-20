//
//  myStageVcAllCell.m
//  TourismT
//
//  Created by Store on 2017/4/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageVcAllCell.h"
#import "TTTAttributedLabel.h"
#import "UIImage+cir.h"

@interface myStageVcAllCell ()<TTTAttributedLabelDelegate>
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UILabel *money;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UIButton *statue;
//@property (nonatomic,weak) TTTAttributedLabel *link;
@property (nonatomic,weak) UILabel *link;
@property (nonatomic,weak) UIButton *linkBtn;
@end

@implementation myStageVcAllCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myStageVcAllCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myStageVcAllCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *back = [UIView new];
        [self.contentView addSubview:back];
        
        UILabel *name = [UILabel new];
        [back addSubview:name];
        
        UILabel *time = [UILabel new];
        [back addSubview:time];
        
        UIImageView *more = [UIImageView new];
        [back addSubview:more];
        
        UIButton *moreBtn = [UIButton new];
        [back addSubview:moreBtn];
        
        
        UILabel *money = [UILabel new];
        [back addSubview:money];
        
        UIButton *statue = [UIButton new];
        [back addSubview:statue];
        
        UILabel *link = [UILabel new];
        [back addSubview:link];
        
        UIButton *linkBtn = [UIButton new];
        [back addSubview:linkBtn];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView);
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.top.equalTo(back).offset(15);
        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back).offset(-15);
            make.centerY.equalTo(time);
            make.width.equalTo(@4);
            make.height.equalTo(@8);
        }];

        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name.mas_right).offset(20);
            make.right.equalTo(more.mas_left).offset(-5);
            make.top.equalTo(back).offset(15);
//            make.width.equalTo(@70);
        }];
        
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more);
            make.left.equalTo(time);
            make.centerY.equalTo(more);
            make.height.equalTo(@44);
        }];
        
        [money mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(statue);
            make.bottom.equalTo(statue);
//            make.height.equalTo(@14);
        }];
        [statue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more);
            make.width.equalTo(@70);
            make.height.equalTo(@30);
            make.top.equalTo(time.mas_bottom).offset(15);
        }];
        
        [linkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.right.equalTo(more);
            make.top.equalTo(statue.mas_bottom).offset(20);
            make.bottom.equalTo(back).offset(-15);
        }];
        
        [link mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.right.equalTo(more);
            make.top.equalTo(statue.mas_bottom).offset(20);
            make.bottom.equalTo(back).offset(-15);
        }];
//        link.hidden = YES;
        //set
        back.backgroundColor = [UIColor whiteColor];
        back.layer.masksToBounds= YES;
        back.layer.cornerRadius = cornerRadius_width;
        more.image = ImageNamed(@"向右灰色");

        name.numberOfLines = 0;
        name.font = PingFangSC_Regular(14);
        name.textColor = ColorWithHex(0x00000, 0.87);
        money.font = PingFangSC_Regular(14);
        money.textColor = ColorWithHex(0x00000, 0.54);
        time.font = PingFangSC_Regular(14);
        time.textColor = ColorWithHex(0x00000, 0.87);
        
        [statue setTitleColor:ColorWithHex(0x00000, 0.54) forState:UIControlStateNormal];
        statue.titleLabel.font = PingFangSC_Regular(14);
        statue.layer.cornerRadius = cornerRadius_width;
        statue.layer.masksToBounds = YES;
        
        [statue setTitleColor:ColorWithHex(0x7496F4, 1.0) forState:UIControlStateSelected];
//        [statue setTitleColor:ColorWithHex(0xFFFFFF, 0.87) forState:UIControlStateSelected];
//        [statue setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x7496F4, 1.0)] forState:UIControlStateSelected];
        
        [linkBtn setTitleColor:ColorWithHex(0x00000, 0.3) forState:UIControlStateNormal];
        linkBtn.titleLabel.font = PingFangSC_Regular(12);
        
        link.font = PingFangSC_Regular(12);
        link.textColor = ColorWithHex(0x00000, 0.3);
        
        [moreBtn addTarget:self action:@selector(BtnClickWithTag:) forControlEvents:UIControlEventTouchUpInside];
        [statue addTarget:self action:@selector(BtnClickWithTag:) forControlEvents:UIControlEventTouchUpInside];
        moreBtn.tag = list_myStageVcAllCell_btnEnum;
        statue.tag = pay_myStageVcAllCell_btnEnum;
        self.name  =name;
        self.money  =money;
        self.time  =time;
        self.statue  =statue;
        self.link = link;
        
//        link.lineBreakMode = NSLineBreakByWordWrapping;
        link.numberOfLines = 1;
//        link.delegate = self;
//        link.lineSpacing = 12;
//        //要放在`text`, with either `setText:` or `setText:afterInheritingLabelAttributesAndConfiguringWithBlock:前面才有效
//        link.enabledTextCheckingTypes = NSTextCheckingTypeLink;
        //链接正常状态文本属性
//        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.3),NSForegroundColorAttributeName,@(1),NSUnderlineStyleAttributeName, nil];
//
//        link.linkAttributes = dic1;
//        link.activeLinkAttributes = dic1;
        self.linkBtn = linkBtn;
        [linkBtn addTarget:self action:@selector(btnClickagrrment:) forControlEvents:UIControlEventTouchUpInside];
//        link.linkAttributes = @{NSForegroundColorAttributeName:ColorWithHex(0x000000, 0.3),NSUnderlineStyleAttributeName:@(1)};
        //链接高亮状态文本属性
//        link.activeLinkAttributes = @{NSForegroundColorAttributeName:ColorWithHex(0x000000, 0.3),NSUnderlineStyleAttributeName:@(1)};

        //test
//        name.text = @"芽庄游览滨海沙大学生毕业旅行四天五晚毕业季";
//        money.text = @"订单总额 2340.00";
//        time.text = @"12／12期";
//        statue.text = @"未结清";
//        statue.highlighted = YES;
    }
    return self;
}

- (void)setDate:(myStageHomeListForOne *)date{
    if (date) {
        _date = date;

//        self.statue.text = date.statusCh;
//        date.status = cleared;
        if ([date.status isEqualToString:cleared]) {
            self.statue.selected = NO;
//            self.statue.enabled = NO;
        } else if ([date.status isEqualToString:uncleared]) {
            self.statue.selected = YES;
//            self.statue.enabled = YES;
        }
        UIControlState type;
        if (self.statue.highlighted) {
            type = UIControlStateHighlighted;
        } else {
            type = UIControlStateNormal;
        }
        [self.statue setTitle:date.statusCh forState:type];
        self.name.text = date.travelName;
        self.money.text = [NSString stringWithFormat:@"订单总额  %@",date.amount];
        self.time.text = date.idx;
        
        NSString *text = @"";
        NSInteger index = 0;
        for (agreementS *one in date.agreement) {
            text = [text stringByAppendingString:one.name];
            if (index != date.agreement.count) {
                text = [text stringByAppendingString:@" "];
            }
            index++;
        }
        self.link.text = text;
//        [self.linkBtn setTitle:text forState:UIControlStateNormal];
        
        /*
//        [date.agreement addObjectsFromArray:date.agreement];
        if (date.agreement.count) {
            NSString *text = @"";
            NSInteger index = 0;
            for (agreementS *one in date.agreement) {
                text = [text stringByAppendingString:one.name];
                if (index != date.agreement.count) {
                    text = [text stringByAppendingString:@"    "];
                }
                index++;
            }
            
            [self.link setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//                for (agreementS *two in date.agreement) {
//                    NSRange fontRange = [[mutableAttributedString string] rangeOfString:two.name
//                                                                                options:NSCaseInsensitiveSearch];
//                    
//                    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(50),NSFontAttributeName,ColorWithHex(0x000000, 0.3),NSForegroundColorAttributeName, nil];
//
//                    [mutableAttributedString addAttributes:dic1 range:fontRange];
//                }
                return mutableAttributedString;
            }];
            
            for (agreementS *three in date.agreement) {
                NSRange fontRange = [text rangeOfString:three.name];
                [self.link addLinkToURL:[NSURL URLWithString:three.url]
                              withRange:fontRange];
            }
        }
         */
    }
}

- (void)btnClickagrrment:(UIButton *)btn{
    if (self.btnClickAgrrment) {
        self.btnClickAgrrment();
    }
}

- (void)BtnClickWithTag:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(btn.tag,nil);
    }
}
//btnClick
- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    if (self.btnClick) {
        self.btnClick(viewUrl_myStageVcAllCell_btnEnum,url);
    }
}
@end
