//
//  CommodityAmountNoneCell.m
//  TourismT
//
//  Created by Store on 2017/5/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CommodityAmountNoneCell.h"


@interface CommodityAmountNoneCell ()<TTTAttributedLabelDelegate>
@property (nonatomic,weak) UILabel *liquan;

@end


@implementation CommodityAmountNoneCell


+ (instancetype)returnCellWith:(UITableView *)tableView
{
    CommodityAmountNoneCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[CommodityAmountNoneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIView *back = [[UIView alloc]init];
        back.backgroundColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(back, cornerRadius_width);
        [self.contentView addSubview:back];
        
        UILabel *title2 = [[UILabel alloc]init];
        [self.contentView addSubview:title2];
        
        UIView *line3 = [[UIView alloc]init];
        [self.contentView addSubview:line3];
        
        UILabel *liquan1 = [[UILabel alloc]init];
        [self.contentView addSubview:liquan1];
        
        UILabel *liquan = [[UILabel alloc]init];
        [self.contentView addSubview:liquan];
        UIButton *liquanSlecetBtn = [[UIButton alloc]init];
        [self.contentView addSubview:liquanSlecetBtn];
        
        
        UIImageView *liquanSlecet = [[UIImageView alloc]init];
        [self.contentView addSubview:liquanSlecet];
        
        UILabel *youhui1 = [[UILabel alloc]init];
        [self.contentView addSubview:youhui1];
        
        UILabel *youhui = [[UILabel alloc]init];
        [self.contentView addSubview:youhui];
        
        UIView *line4 = [[UIView alloc]init];
        [self.contentView addSubview:line4];
        
        UILabel *moneyAll = [[UILabel alloc]init];
        [self.contentView addSubview:moneyAll];

        TTTAttributedLabel *des = [TTTAttributedLabel new];
        [self.contentView addSubview:des];
        
        
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(moneyAll.mas_bottom).offset(15);
        }];

        [title2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(30);
            make.right.equalTo(self.contentView).offset(-30);
            make.top.equalTo(self.contentView).offset(30);
            make.height.equalTo(@14);
        }];
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(title2.mas_bottom).offset(15);
            make.height.equalTo(@[line4,@0.5]);
        }];
        [liquan1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.top.equalTo(line3.mas_bottom).offset(18);
        }];
        [liquanSlecet mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(title2);
            make.centerY.equalTo(liquan1);
            make.width.equalTo(@7);
            make.height.equalTo(@12);
        }];
        
        [liquan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(liquanSlecet.mas_left).offset(-10);
            make.top.equalTo(liquan1);
            make.bottom.equalTo(liquan1);
        }];
        [liquanSlecetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(liquan);
            make.right.equalTo(liquanSlecet);
            make.centerY.equalTo(liquan);
            make.height.equalTo(@44);
        }];
        
        [youhui1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title2);
            make.top.equalTo(liquan1.mas_bottom).offset(36);
        }];
        [youhui mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(liquan);
            make.top.equalTo(youhui1);
            make.bottom.equalTo(youhui1);
        }];
        [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(youhui1.mas_bottom).offset(17);
        }];
//        moneyAll.backgroundColor = [UIColor redColor];
        [moneyAll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(title2);
            make.top.equalTo(line4.mas_bottom).offset(18);
            make.height.equalTo(@14);
        }];

        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(back.mas_bottom).offset(21);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
//        des.backgroundColor = [UIColor redColor];
        
//        desTitle.text = @"我已经阅读并同意";
        
        line3.backgroundColor = ColorWithHex(0x979797, 0.4);
        line4.backgroundColor = ColorWithHex(0x979797, 0.4);
        liquanSlecet.image = ImageNamed(@"向右灰色");

        self.back = back;
        [liquanSlecetBtn addTarget:self action:@selector(liquanSlecetBtnClick:) forControlEvents:UIControlEventTouchUpInside];

        
        //set
//        des.lineBreakMode = NSLineBreakByWordWrapping;
        des.numberOfLines = 0;

        
        des.delegate = self;
//        des.lineSpacing = 5;
        //要放在`text`, with either `setText:` or `setText:afterInheritingLabelAttributesAndConfiguringWithBlock:前面才有效
        des.enabledTextCheckingTypes = NSTextCheckingTypeLink;
        //链接正常状态文本属性
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.87),NSForegroundColorAttributeName, nil];
        
        des.linkAttributes = dic1;
        des.activeLinkAttributes = dic1;
        
        
        line3.backgroundColor = ColorWithHex(0x979797, 0.4);
        line4.backgroundColor = ColorWithHex(0x979797, 0.4);
        title2.font = PingFangSC_Regular(14);
        title2.textColor  =ColorWithHex(0x000000, 0.87);
        
        liquan1.font = PingFangSC_Regular(14);
        liquan1.textColor  =ColorWithHex(0x000000, 0.87);
        liquan.font = PingFangSC_Regular(14);
        liquan.textColor  =ColorWithHex(0xFB704B, 1.0);
        liquan.highlightedTextColor  =ColorWithHex(0x000000, 0.3);
        youhui.highlightedTextColor  =ColorWithHex(0x000000, 0.3);
        
        
        youhui1.font = PingFangSC_Regular(14);
        youhui1.textColor  =ColorWithHex(0x000000, 0.87);
        youhui.font = PingFangSC_Regular(14);
        youhui.textColor  =ColorWithHex(0xFB704B, 1.0);
        
        moneyAll.font = PingFangSC_Regular(14);
        moneyAll.textColor  =ColorWithHex(0x000000, 0.87);
        
//        des.font = PingFangSC_Regular(12);
//        des.textColor  =ColorWithHex(0xFFFFFF, 0.87);
        
        
//        des.text = @"我已阅读并同意《预定协议》";
        des.numberOfLines = 0;
//        des.backgroundColor = [UIColor redColor];
        title2.text = @"优惠金额";
        liquan1.text = @"礼券";
        youhui1.text = @"活动优惠";
        self.title2 = title2;
        self.liquan = liquan;
        self.youhui = youhui;
        self.moneyAll = moneyAll;
        self.des = des;
        
        liquan.text = @"请选择优惠券";
        liquan.highlighted = YES;
        youhui.text = @"无";
        moneyAll.text = @"订单金额：0.00";
        //test
//        liquan.text = @"新手券￥100";
//        youhui.text = @"−￥100";
    }
    return self;
}
- (void)liquanSlecetBtnClick:(UIButton *)sender{
    if (self.goToSlecetYHQ) {
        self.goToSlecetYHQ();
        [MobClick event:xuanzeyouhuique];
    }
}

//
- (void)setYHQSoneDate:(YHQoneS *)YHQSoneDate{
    if (YHQSoneDate) {
        _YHQSoneDate = YHQSoneDate;
        self.liquan.text = [NSString stringWithFormat:@"-¥%.2f",YHQSoneDate.price];
        self.liquan.highlighted = NO;
//        if (YHQSoneDate.name && YHQSoneDate.name.length) {
//            self.liquan.highlighted = NO;
//            self.liquan.text = YHQSoneDate.name;
//        }
//        self.youhui.highlighted = NO;
//        self.youhui.text = [NSString stringWithFormat:@"-¥%.2f",YHQSoneDate.price];
    }else{
        self.liquan.text = @"请选择优惠券";
        self.liquan.highlighted = YES;
        
//        self.youhui.text = @"无";
//        self.youhui.highlighted = YES;
    }
}

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    if (self.goToViewXieYi && [url absoluteString] && [url absoluteString].length) {
        self.goToViewXieYi(url);
    }
}


- (void)setOrderinfoData:(orderInfo *)orderinfoData{
    if (orderinfoData) {
        _orderinfoData = orderinfoData;
        if (orderinfoData.discount && orderinfoData.discount.length) {
            self.youhui.highlighted = NO;
            self.youhui.text = orderinfoData.discount;
        }else{
            self.youhui.highlighted = YES;
            self.youhui.text = @"无";
        }
        self.moneyAll.text = [NSString stringWithFormat:@"订单金额：%.2f",[orderinfoData.amount doubleValue]];
        if (orderinfoData.agreement.count) {
            NSString *text = @"我已阅读并同意 ";
            NSInteger index = 0;
            for (agreementS *one in orderinfoData.agreement) {
                text = [text stringByAppendingString:one.name];
                if (index != orderinfoData.agreement.count) {
                    text = [text stringByAppendingString:@"   "];
                }
                index++;
            }
            
            [self.des setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
//                NSRange fontRange = [text rangeOfString:@"我已阅读并同意 "];
//                NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.87),NSForegroundColorAttributeName, nil];
//                [mutableAttributedString addAttributes:dic1 range:fontRange];
                
//                [mutableAttributedString addAttribute:NSFontAttributeName
//                                                value:PingFangSC_Regular(12)
//                                                range:fontRange];
//                //文字颜色
//                [mutableAttributedString addAttribute:NSForegroundColorAttributeName
//                                                value:ColorWithHex(0xFFFFFF, 0.87)
//                                                range:fontRange];
                
                return mutableAttributedString;
            }];
            
            for (agreementS *three in orderinfoData.agreement) {
                NSRange fontRange = [text rangeOfString:three.name];
                [self.des addLinkToURL:[NSURL URLWithString:three.url]
                             withRange:fontRange];
            }
            NSRange fontRange = [text rangeOfString:@"我已阅读并同意 "];
            [self.des addLinkToURL:[NSURL URLWithString:@""]
                         withRange:fontRange];
        }
        
    }
}
@end
