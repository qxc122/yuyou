//
//  myDevcKeepCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myDevcKeepCell.h"


@interface myDevcKeepCell ()
@property (nonatomic,weak) UILabel *didian;
@property (nonatomic,weak) UILabel *riqi;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *price;
@property (nonatomic,weak) UIImageView *image;
@end

@implementation myDevcKeepCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myDevcKeepCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myDevcKeepCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *price = [[UILabel alloc]init];
        [self.contentView addSubview:price];
        
        UIImageView *didianImage = [[UIImageView alloc]init];
        [self.contentView addSubview:didianImage];
        
        UILabel *didian = [[UILabel alloc]init];
        [self.contentView addSubview:didian];

        UIImageView *riqiImage = [[UIImageView alloc]init];
        [self.contentView addSubview:riqiImage];
        
        UILabel *riqi = [[UILabel alloc]init];
        [self.contentView addSubview:riqi];
        
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
            make.width.mas_equalTo(image.mas_height).multipliedBy(120/90.0);
            make.height.equalTo(@(90));
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(image);
//            make.height.equalTo(@(55));
        }];
        
        [price mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.bottom.equalTo(didian.mas_top).offset(-11);
        }];
        
        [didianImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(price);
            make.bottom.equalTo(image);
            make.height.equalTo(@(12));
            make.width.equalTo(@(12));
        }];
        
        [didian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(didianImage.mas_right).offset(5);
//            make.bottom.equalTo(image);
            make.centerY.equalTo(didianImage);
//            make.height.equalTo(@(12));
        }];

        [riqiImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(didian.mas_right).offset(32);
            make.bottom.equalTo(image);
            make.height.equalTo(@(12));
            make.width.equalTo(@(12));
        }];
        
        [riqi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(riqiImage.mas_right).offset(5);
//            make.right.equalTo(title);
//            make.bottom.equalTo(image);
            make.centerY.equalTo(riqiImage);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);;
            make.bottom.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-15);
            make.height.equalTo(@(0.5));
        }];
        
        
        //set
        self.didian  =didian;
        self.title  =title;
        self.price  =price;
        self.image  =image;
        self.riqi = riqi;
        title.numberOfLines = 2;
        line.backgroundColor = ColorWithHex(0x979797, 0.4);
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.87);
        price.font = PingFangSC_Regular(14);
        price.textColor = ColorWithHex(0xFB704B, 1.0);
        IMAGEsetCONTENTMODE(image);
        didianImage.image = ImageNamed(@"定位绿色");
//        riqiImage.image = ImageNamed(@"日历绿色");
        [didian settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
        [riqi settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(12)];
//        [didian setImage:ImageNamed(@"定位绿色") forState:UIControlStateNormal];
//        [didian setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
//        didian.titleLabel.font = PingFangSC_Regular(12);
        
//        [title setContentMode:UIViewContentModeTop];
//        title.backgroundColor = [UIColor redColor];
        //test
//        [didian setTitle:@"深圳" forState:UIControlStateNormal];
//        title.text =@"清迈5天4晚单身派对无购物高品质精品小团游";
//        price.text = @"￥2100";
//        image.image = ImageNamed(IMAGE_bigBack);
    }
    return self;
}
- (void)setOneone:(contentS *)oneone{
    _oneone = oneone;
    if (oneone) {
        NSString *sss = @"";
        for (CityS *citt in oneone.fromCitysA) {
            sss = [sss stringByAppendingString:citt.name];
        }
        self.didian.text = sss;
//        self.riqi.text = oneone.days;
        [self.image sd_setImageWithURL:[NSURL URLWithString:oneone.coverImage] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.title.text = oneone.name;
        
        if (oneone.isPeriod) {
//            if (oneone.firstRepayment && oneone.firstRepayment.length && oneone.periodRepayment && oneone.periodRepayment.length) {
//                self.price.text = nil;
//                NSString *first = @"首付";
//                oneone.firstRepayment = [oneone.firstRepayment stringByReplacingOccurrencesOfString:first withString:@""];
//                NSString *all = [oneone.firstRepayment stringByAppendingString:detailD.periodRepayment];
//                all = [first stringByAppendingString:all];
//                
//                NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
//                NSRange range1 = [all rangeOfString:first];
//                NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
//                [attri setAttributes:dic1 range:range1];
//                
//                NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Medium(20),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
//                [attri setAttributes:dic2 range:NSMakeRange(range1.location+range1.length,detailD.firstRepayment.length)];
//                
//                NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
//                [attri setAttributes:dic3 range:NSMakeRange(range1.location+range1.length+detailD.firstRepayment.length,detailD.periodRepayment.length)];
//                self.price.attributedText = attri;
//            }
        } else {
            self.price.text = oneone.price;
        }
    }
}
@end
