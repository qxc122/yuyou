//
//  TravelItineraryCell.m
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelItineraryCell.h"
#import "UIImage+cir.h"

@interface TravelItineraryCell ()
@property (nonatomic,weak) UIImageView *back;
@property (nonatomic,weak) UILabel *staue;
@property (nonatomic,weak) UIImageView *staueBack;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *content;
@end

@implementation TravelItineraryCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    TravelItineraryCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[TravelItineraryCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *back = [[UIImageView alloc] init];
        [self.contentView addSubview:back];
        
        UIView *Imageback = [[UIView alloc] init];
        [self.contentView addSubview:Imageback];
        
        UIImageView *staueBack = [[UIImageView alloc] init];
        [self.contentView addSubview:staueBack];
        
        UILabel *staue = [[UILabel alloc]init];
        [self.contentView addSubview:staue];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(7.5);
            make.bottom.equalTo(self.contentView).offset(-7.5);
            make.height.mas_equalTo(back.mas_width).multipliedBy(150.0/345.0);
        }];
        [Imageback mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(back);
            make.top.equalTo(back);
            make.bottom.equalTo(back);
        }];
        
        [staue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(7);
            make.top.equalTo(back).offset(17);
        }];
        
        [staueBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back);
            make.right.equalTo(staue.mas_right).offset(7);
            make.top.equalTo(staue.mas_top).offset(-4);
            make.bottom.equalTo(staue.mas_bottom).offset(4);
        }];
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.right.equalTo(back).offset(-15);
            make.bottom.equalTo(back).offset(-15);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content);
            make.right.equalTo(content);
            make.bottom.equalTo(content.mas_top).offset(-20);
        }];
        //set
        Imageback.backgroundColor = ColorWithHex(0x000000,0.1);
        self.title  =title;
        self.content  =content;
        self.staueBack  =staueBack;
        self.staue  =staue;
        self.back  =back;
        staueBack.image = [UIImage returnImageWithImage:ImageNamed(@"状态背景") WithInsets:UIEdgeInsetsMake(5, 5, 5, 10)];
        //      IMAGEsetCONTENTMODE(staueBack);
        
        IMAGEsetCONTENTMODE(back);
        LRViewRadius(back,cornerRadius_width);
        LRViewRadius(Imageback,cornerRadius_width);
        staue.font = PingFangSC_Regular(12);
        content.font = PingFangSC_Regular(12);
        title.font = PingFangSC_Regular(18);
        
        staue.textColor = ColorWithHex(0xFFFFFF, 1.0);
        content.textColor = ColorWithHex(0xFFFFFF, 0.87);
        title.textColor = ColorWithHex(0xFFFFFF, 1.0);
        
        //test
//        staue.text = @"进行中";
//        content.text = @"百年电车之旅asdfasdf";
//        title.text = @"百年电车之旅";
//        back.image = ImageNamed(@"背景色");
    }
    return self;
}
- (void)setData:(TravelItineraryList_one *)data{
    _data = data;
    if (data.statusCh && data.statusCh.length) {
        self.staueBack.hidden = NO;
    } else {
        self.staueBack.hidden = YES;
    }
    self.staue.text = data.statusCh;
    self.title.text = data.travelName;
    self.content.text = [NSString stringWithFormat:@"%@ | %@",data.beginDate,data.days];
    [self.back sd_setImageWithURL:data.images placeholderImage:ImageNamed(place_image_image)];
}
@end
