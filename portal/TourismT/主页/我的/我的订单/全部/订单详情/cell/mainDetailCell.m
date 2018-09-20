//
//  mainDetailCell.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "mainDetailCell.h"


@interface mainDetailCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIButton *didian;
@property (nonatomic,weak) UIButton *time;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *price;
@property (nonatomic,weak) UILabel *desPeo;

@property (nonatomic,weak) UIButton *btnStaue;
@end

@implementation mainDetailCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    mainDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[mainDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *back =[[UILabel alloc]init];
        [self.contentView addSubview:back];
        
        UIImageView *image =[[UIImageView alloc]init];
        [self.contentView addSubview:image];
        
        UILabel *title =[[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *price =[[UILabel alloc]init];
        [self.contentView addSubview:price];
        
        UIButton *didian =[[UIButton alloc]init];
        [self.contentView addSubview:didian];
        
        UIButton *time =[[UIButton alloc]init];
        [self.contentView addSubview:time];
        
        UILabel *desPeo =[[UILabel alloc]init];
        [self.contentView addSubview:desPeo];
        
        UIButton *btnStaue =[[UIButton alloc]init];
        [self.contentView addSubview:btnStaue];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(20);
            make.bottom.equalTo(self.contentView).offset(-42);
            make.height.equalTo(@(120));
        }];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.top.equalTo(back).offset(15);
            make.bottom.equalTo(back).offset(-15);
            make.width.equalTo(@(120));
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.top.equalTo(image);
            make.right.equalTo(self.contentView).offset(-15);
        }];
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(didian.mas_top).offset(-11);
        }];
        [didian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.bottom.equalTo(image);
        }];
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(didian.mas_right).offset(30);
            make.centerY.equalTo(didian);
        }];
        [desPeo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(back.mas_bottom);
            make.bottom.equalTo(self.contentView);
        }];
        [btnStaue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(desPeo);
            make.left.equalTo(image);
            make.width.equalTo(@(60));
            make.height.equalTo(@(24));
        }];
        
        //set
        self.btnStaue = btnStaue;
        self.image = image;
        self.didian = didian;
        self.time = time;
        self.title = title;
        self.price = price;
        self.desPeo = desPeo;
        back.backgroundColor = ColorWithHex(0xFAFAFA, 1.0);
        [didian setImage:ImageNamed(@"定位绿色") forState:UIControlStateNormal];
        [time setImage:ImageNamed(@"日历绿色") forState:UIControlStateNormal];
        [didian setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        [time setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        didian.titleLabel.font = PingFangSC_Regular(12);
        time.titleLabel.font = PingFangSC_Regular(12);
        IMAGEsetCONTENTMODE(image);
        title.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Regular(14);
        price.numberOfLines = 2;
        title.textAlignment = NSTextAlignmentLeft;
        price.textColor = ColorWithHex(0xFB704B, 1.0);
        price.font = PingFangSC_Regular(14);
        desPeo.textColor = ColorWithHex(0x00000, 1.0);
        desPeo.font = PingFangSC_Regular(12);
        self.btnStaue.titleLabel.font = PingFangSC_Regular(12);
        LRViewRadius(self.btnStaue, cornerRadius_width);
        //test
//        image.image = ImageNamed(IMAGE_bigBack);
//        [didian setTitle:@" shengze" forState:UIControlStateNormal];
//        [time setTitle:@" 2016*52-5" forState:UIControlStateNormal];
//        title.text = @"asd12d12asdfasdfasdfasdfasdfasdfasdf3sdfs";
//        price.text = @"asdf";
//        desPeo.text = @"asdasdadsff";
//        title.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)setDetail:(orderDeatailS *)detail{
    _detail = detail;
    if (detail) {
        [self.image  sd_setImageWithURL:[NSURL URLWithString:detail.orderD.travelInfoD.image] placeholderImage:ImageNamed(IMAGE_bigBack)];
        if (detail.orderD.dateFmt && detail.orderD.dateFmt.length) {
            [self.time setTitle:[@" " stringByAppendingString:detail.orderD.dateFmt] forState:UIControlStateNormal];
        }
        if (detail.orderD.travelInfoD.city && detail.orderD.travelInfoD.city.length) {
            [self.didian setTitle:[@" " stringByAppendingString:detail.orderD.travelInfoD.city] forState:UIControlStateNormal];
        }
        self.title.text = detail.orderD.travelInfoD.name;

        if (detail.orderD.travelInfoD.isPeriod) {
            if (detail.orderD.travelInfoD.firstPriceStr && detail.orderD.travelInfoD.firstPriceStr.length && detail.orderD.travelInfoD.firstPriceOtherStr && detail.orderD.travelInfoD.firstPriceOtherStr.length) {
                self.price.text = nil;

                NSString *all = [NSString stringWithFormat:@"%@%@",detail.orderD.travelInfoD.firstPriceStr,detail.orderD.travelInfoD.firstPriceOtherStr];
                NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
                NSRange range1 = [all rangeOfString:detail.orderD.travelInfoD.firstPriceStr];
                NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
                [attri setAttributes:dic1 range:NSMakeRange(0, range1.location+range1.length)];
                
                NSRange range2 = [all rangeOfString:detail.orderD.travelInfoD.firstPriceOtherStr];
                NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
                [attri setAttributes:dic2 range:range2];
                self.price.attributedText = attri;
            }
        } else {
            self.price.text = [NSString stringWithFormat:@"¥%.2f",detail.orderD.totalPrice];
        }
        
        
        self.desPeo.text = detail.orderD.quantityInfo;
        
        if ([detail.refundStatus isEqualToString:refundable_order_deatil_saues]) {
            self.btnStaue.hidden = NO;
            self.btnStaue.userInteractionEnabled = YES;
            [self.btnStaue setTitle:@"申请退款" forState:UIControlStateNormal];
            [self.btnStaue setTitleColor:RGBACOLOR(255, 107, 78, 1.0) forState:UIControlStateNormal];
            LRViewBorder(self.btnStaue, 0.5, RGBACOLOR(255, 107, 78, 1.0));
            [self.btnStaue addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        } else if ([detail.refundStatus isEqualToString:applying_order_deatil_saues]){
            self.btnStaue.hidden = NO;
            self.btnStaue.userInteractionEnabled = YES;
            [self.btnStaue setTitle:@"申请中" forState:UIControlStateNormal];
            [self.btnStaue setTitleColor:RGBACOLOR(142, 142, 142, 1.0) forState:UIControlStateNormal];
            LRViewBorder(self.btnStaue, 0.5, RGBACOLOR(142, 142, 142, 1.0));
        } else if ([detail.refundStatus isEqualToString:refunding_order_deatil_saues]){
            self.btnStaue.hidden = NO;
            self.btnStaue.userInteractionEnabled = YES;
            [self.btnStaue setTitle:@"退款中" forState:UIControlStateNormal];
            [self.btnStaue setTitleColor:RGBACOLOR(142, 142, 142, 1.0) forState:UIControlStateNormal];
            LRViewBorder(self.btnStaue, 0.5, RGBACOLOR(142, 142, 142, 1.0));
        } else if ([detail.refundStatus isEqualToString:refunded_order_deatil_saues]){
            self.btnStaue.hidden = NO;
            self.btnStaue.userInteractionEnabled = YES;
            [self.btnStaue setTitle:@"退款成功" forState:UIControlStateNormal];
            [self.btnStaue setTitleColor:RGBACOLOR(142, 142, 142, 1.0) forState:UIControlStateNormal];
            LRViewBorder(self.btnStaue, 0.5, RGBACOLOR(142, 142, 142, 1.0));
        }else{
            self.btnStaue.hidden = YES;
        }
    }
}
- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick();
    }
}
@end
