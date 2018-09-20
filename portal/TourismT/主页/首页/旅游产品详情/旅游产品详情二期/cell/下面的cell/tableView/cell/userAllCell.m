//
//  userAllCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "userAllCell.h"
#import "UIImageView+CornerRadius.h"

#define widthIcon 45.f*WIDTHICON

@interface userAllCell ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIImageView *image1;
@property (nonatomic,weak) UIImageView *image2;
@property (nonatomic,weak) UIImageView *image3;
@property (nonatomic,weak) UIImageView *image4;
@property (nonatomic,weak) UIImageView *image5;
@property (nonatomic,weak) UIImageView *image6;
@end

@implementation userAllCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    userAllCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[userAllCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        UIView *lineBottom = [[UIView alloc]init];
        [self.contentView addSubview:lineBottom];
        
        UIButton *btnMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btnMore];
        
        UILabel *moreLabel = [[UILabel alloc]init];
        [self.contentView addSubview:moreLabel];
        
        UIImageView *moreImage = [[UIImageView alloc]init];
        [self.contentView addSubview:moreImage];
        
        UIView *suXian = [[UIView alloc]init];
        [self.contentView addSubview:suXian];
        
        UIImageView *image1 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewBorder(image1, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        //LRViewRadius(image1, widthIcon/2.0);
        
        UIImageView *image2 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewBorder(image2, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        //LRViewRadius(image2, widthIcon/2.0);
        
        UIImageView *image3 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewRadius(image3, widthIcon/2.0);
        //LRViewBorder(image3, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        
        UIImageView *image4 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewRadius(image4, widthIcon/2.0);
        //LRViewBorder(image4, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        
        UIImageView *image5 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewRadius(image5, widthIcon/2.0);
        //LRViewBorder(image5, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        
        UIImageView *image6 = [[UIImageView alloc] initWithRoundingRectImageView];
        //LRViewRadius(image6, widthIcon/2.0);
        //LRViewBorder(image6, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        
        [image1 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        [image2 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        [image3 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        [image4 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        [image5 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        [image6 zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        image1.contentMode = UIViewContentModeScaleAspectFill;
        image2.contentMode = UIViewContentModeScaleAspectFill;
        image3.contentMode = UIViewContentModeScaleAspectFill;
        image4.contentMode = UIViewContentModeScaleAspectFill;
        image5.contentMode = UIViewContentModeScaleAspectFill;
        image6.contentMode = UIViewContentModeScaleAspectFill;
        
        image1.clipsToBounds = YES;
        image2.clipsToBounds = YES;
        image3.clipsToBounds = YES;
        image4.clipsToBounds = YES;
        image5.clipsToBounds = YES;
        image6.clipsToBounds = YES;
        
        [self.contentView addSubview:image6];
        [self.contentView addSubview:image5];
        [self.contentView addSubview:image4];
        [self.contentView addSubview:image3];
        [self.contentView addSubview:image2];
        [self.contentView addSubview:image1];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(20);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(title.mas_bottom).offset(20);
            make.height.equalTo(@(0.5));
        }];
        
        [suXian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(1));
            make.height.equalTo(@(24));
            make.right.equalTo(moreLabel.mas_left).offset(-11.5);
            make.top.equalTo(line.mas_bottom).offset(25);
        }];
        
        [moreImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(suXian);
        }];
        
        [moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(moreImage.mas_left).offset(-12);
            make.centerY.equalTo(suXian);
        }];
        
        [btnMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(40));
            make.centerY.equalTo(moreLabel);
            make.left.equalTo(moreLabel);
            make.right.equalTo(moreImage);
        }];
        
        
        [image1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(self.contentView).offset(15);
            make.centerY.equalTo(suXian);
        }];
        
        [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(image1.mas_right).offset(-10);
            make.top.equalTo(image1);
        }];
        
        [image3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(image2.mas_right).offset(-10);
            make.top.equalTo(image1);
        }];
        
        [image4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(image3.mas_right).offset(-10);
            make.top.equalTo(image1);
        }];
        
        [image5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(image4.mas_right).offset(-10);
            make.top.equalTo(image1);
        }];
        
        [image6 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(widthIcon));
            make.height.equalTo(@(widthIcon));
            make.left.equalTo(image5.mas_right).offset(-10);
            make.top.equalTo(image1);
        }];
        
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.top.equalTo(image6.mas_bottom).offset(15);
            make.height.equalTo(@(10));
        }];
        //set
        self.title = title;
        title.font = PingFangSC_Regular(14);
        title.textColor = ColorWithHex(0x000000, 0.86);
        title.text = @"一同出游";
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        suXian.backgroundColor = ColorWithHex(0x979797, 0.3);
        lineBottom.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        moreLabel.text = @"查看全部";
        moreLabel.font = PingFangSC_Regular(12);
        moreLabel.textColor = ColorWithHex(0x000000, 0.54);
        moreImage.image = [UIImage imageNamed:@"向右灰色"];
        
        self.image1 = image1;
        self.image2 = image2;
        self.image3 = image3;
        self.image4 = image4;
        self.image5 = image5;
        self.image6 = image6;
        image1.tag = 0;
        image2.tag = 1;
        image3.tag = 2;
        image4.tag = 3;
        image5.tag = 4;
        image6.tag = 5;
//        image1.hidden = YES;
//        image2.hidden = YES;
//        image3.hidden = YES;
//        image4.hidden = YES;
//        image5.hidden = YES;
//        image6.hidden = YES;
        image1.image = [UIImage imageNamed:@"更多头像"];
        image2.image = [UIImage imageNamed:@"更多头像"];
        image3.image = [UIImage imageNamed:@"更多头像"];
        image4.image = [UIImage imageNamed:@"更多头像"];
        image5.image = [UIImage imageNamed:@"更多头像"];
        image6.image = [UIImage imageNamed:@"更多头像"];
        
        [btnMore addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        //        image6.image = [UIImage circleImageWithName:@"404" borderWidth:2.0 borderColor:[UIColor redColor]];
        
    }
    return self;
}
- (void)BtnClick:(UIButton *)sender{
    if (self.lookMore) {
        self.lookMore();
    }
}
- (void)setArryA:(NSArray *)arryA{
    _arryA = arryA;
    NSInteger index = 0;
    self.image1.hidden = YES;
    self.image2.hidden = YES;
    self.image3.hidden = YES;
    self.image4.hidden = YES;
    self.image5.hidden = YES;
    self.image6.hidden = YES;
    for (UserS *user in arryA) {
        UIImageView *image;
        if (index == 0) {
            image = self.image1;
        } else if (index == 1){
            image = self.image2;
        } else if (index == 2){
            image = self.image3;
        } else if (index == 3){
            image = self.image4;
        } else if (index == 4){
            image = self.image5;
        }
        image.hidden = NO;
        //        image.image = [UIImage circleImageWithName:@"背景色" borderWidth:2.0 borderColor:ColorWithHex(0xFFFFFF, 1.0)];
        [image sd_setImageWithURL:[NSURL URLWithString:user.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        index++;
    }
    if (index == 0) {
        self.image1.hidden = NO;
        self.image1.image = [UIImage imageNamed:@"更多头像"];
    }else if (index >0 && index<5) {
        for (UIImageView *noImage in self.contentView.subviews) {
            if ([noImage isKindOfClass:[UIImageView class]] && noImage.tag==index) {
                noImage.hidden = NO;
                noImage.image = [UIImage imageNamed:@"更多头像"];
                break;
            }
        }
    }else if(index >=5){
        self.image6.hidden = NO;
        self.image6.image = [UIImage imageNamed:@"更多头像"];
    }
}
@end
