//
//  togetherLYCell.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "togetherLYCell.h"


@interface togetherLYCell ()
@property (nonatomic,weak) UIImageView * selectImage;

@property (nonatomic,weak) UIImageView * image;
@property (nonatomic,weak) UIButton * didian;
@property (nonatomic,weak) UIButton * time;
@property (nonatomic,weak) UILabel * des;
@end

@implementation togetherLYCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    togetherLYCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[togetherLYCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        UILabel *des = [[UILabel alloc]init];
        [self.contentView addSubview:des];
        
        
        UIImageView *selectImage = [[UIImageView alloc]init];
        self.selectImage = selectImage;
        [self.contentView addSubview:selectImage];

        UIButton *didian = [[UIButton alloc]init];
        [self.contentView addSubview:didian];
        
        UIButton *time = [[UIButton alloc]init];
        [self.contentView addSubview:time];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);;
            make.top.equalTo(self.contentView).offset(15);;
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(160*HEIGHTICON));
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(image);
            make.centerX.equalTo(image);
            make.left.equalTo(image).offset(12);
            make.right.equalTo(image).offset(-12);
        }];
        
        
        [selectImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(image).offset(-15);
            make.top.equalTo(image).offset(15);
            make.width.equalTo(@(25));
            make.height.equalTo(@(25));
        }];

        [didian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(17);
            make.bottom.equalTo(image).offset(-11);
        }];
        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(didian.mas_right).offset(30);
            make.centerY.equalTo(didian);
        }];
        //set
        self.image = image;
        self.didian = didian;
        self.time = time;
        self.des= des;
        des.numberOfLines = 0;
        des.font = PingFangSC_Medium(20);
        des.textColor = ColorWithHex(0xFFFFFF, 1.0);
        selectImage.image = ImageNamed(@"选择框");
        selectImage.highlightedImage = ImageNamed(@"选中");
        IMAGEsetCONTENTMODE(selectImage);
        IMAGEsetCONTENTMODE(image);
        LRViewRadius(image, cornerRadius_width);
        [didian setImage:[UIImage imageNamed:@"定位绿色"] forState:UIControlStateNormal];
        [time setImage:[UIImage imageNamed:@"日历绿色"] forState:UIControlStateNormal];
        [didian setTitleColor:ColorWithHex(0xFFFFFF, 0.87) forState:UIControlStateNormal];
        [time setTitleColor:ColorWithHex(0xFFFFFF, 0.87) forState:UIControlStateNormal];
        didian.titleLabel.font = PingFangSC_Regular(12);
        time.titleLabel.font = PingFangSC_Regular(12);
        des.textAlignment = NSTextAlignmentCenter;
        didian.userInteractionEnabled = NO;
        time.userInteractionEnabled = NO;
        //test
//        des.text = @"sdfsfsdfsfsdfsdfsdfsdfsdf";
        image.image = ImageNamed(IMAGE_bigBack);
//        [didian setTitle:@"sdf" forState:UIControlStateNormal];
//        [time setTitle:@"sdfsdfsdf" forState:UIControlStateNormal];
    }
    return self;
}
- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    self.selectImage.highlighted = isSelected;
}
- (void)setIsNumberOfJourneys:(BOOL)isNumberOfJourneys{
    _isNumberOfJourneys = isNumberOfJourneys;
    self.selectImage.hidden = isNumberOfJourneys;
}
- (void)setOne:(OtherpeoLcOneS *)one{
    if (one) {
        _one = one;
        [self.image sd_setImageWithURL:[NSURL URLWithString:one.url] placeholderImage:ImageNamed(IMAGE_bigBack)];
        [self.didian setTitle:[NSString stringWithFormat:@" %@",one.toCity] forState:UIControlStateNormal];
        [self.time setTitle:[NSString stringWithFormat:@" %@",one.beginDate] forState:UIControlStateNormal];
        
        self.des.text = one.travelName;
    }
}
- (void)setDateHeart:(contentS *)dateHeart{
    if (dateHeart) {
        self.didian.hidden= YES;
        self.time.hidden= YES;
        self.selectImage.hidden= YES;
        _dateHeart = dateHeart;
        if (dateHeart.imagesA.count) {
            ImageS *tmp = dateHeart.imagesA.firstObject;
            [self.image sd_setImageWithURL:[NSURL URLWithString:tmp.fullUrl] placeholderImage:ImageNamed(IMAGE_bigBack)];
        }
        self.des.text = dateHeart.name;
    }
}

- (void)setDate:(orderlistForOneS *)date{
    _date = date;
    [self.image sd_setImageWithURL:[NSURL URLWithString:date.travelInfoD.image] placeholderImage:ImageNamed(IMAGE_bigBack)];
    self.des.text = date.travelInfoD.name;
    [self.didian setTitle:[NSString stringWithFormat:@" %@",date.travelInfoD.city] forState:UIControlStateNormal];
    [self.time setTitle:[NSString stringWithFormat:@" %@",date.travelInfoD.time] forState:UIControlStateNormal];
}
@end
