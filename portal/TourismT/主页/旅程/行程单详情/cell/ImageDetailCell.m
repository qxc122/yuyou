//
//  ImageDetailCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ImageDetailCell.h"


@interface ImageDetailCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIImageView *Tip;
@property (nonatomic,weak) UILabel *content;
@end

@implementation ImageDetailCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    ImageDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ImageDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *image = [[UIImageView alloc] init];
        [self.contentView addSubview:image];
        
        UILabel *content = [[UILabel alloc]init];
        [self.contentView addSubview:content];
        
        UIImageView *Tip = [[UIImageView alloc]init];
        [self.contentView addSubview:Tip];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineV).offset(23);
            make.right.equalTo(self.contentView).offset(-14);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@180);
//            make.height.mas_equalTo(image.mas_height).multipliedBy(310.0/180.0);
        }];
        
        [Tip mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(content.mas_left).offset(-10);
            make.centerY.equalTo(content);
            make.width.equalTo(@12);
            make.height.equalTo(@9.6);
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(image);
            make.top.equalTo(image.mas_bottom).offset(12);
            make.bottom.equalTo(self.contentView).offset(-14);
        }];
        //set
        self.image  =image;
        self.content  =content;
        self.Tip  =Tip;
        
        LRViewRadius(image, cornerRadius_width);
        IMAGEsetCONTENTMODE(image);
        content.font = PingFangSC_Regular(12);
        content.textColor = ColorWithHex(0x000000, 0.4);
        Tip.image = ImageNamed(@"图片说明");

        //test
        content.text = @"百年";
        image.image = ImageNamed(@"背景色");
    }
    return self;
}

@end
