//
//  ContentDetailCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ContentDetailCell.h"
#import "YYText.h"
#import "NSAttributedString+YYText.h"

@interface ContentDetailCell ()
@property (nonatomic,weak) UIView *backLabel;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) YYLabel *content;
@property (nonatomic,weak) UIImageView *staue;
@end

@implementation ContentDetailCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    ContentDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[ContentDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *staue = [[UIImageView alloc]init];
        [self.contentView addSubview:staue];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UIView *backLabel = [[UIView alloc] init];
        [self.contentView addSubview:backLabel];
        
        YYLabel *content = [[YYLabel alloc]init];
        [self.contentView addSubview:content];
        
        [staue mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.lineV);
            make.top.equalTo(self.contentView).offset(0);
            make.width.equalTo(@20);
            make.height.equalTo(@20);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(staue.mas_right).offset(14);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
        }];
        
        [content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineV).offset(23+15);
            make.right.equalTo(self.contentView).offset(-15-15);
            make.top.equalTo(title.mas_bottom).offset(18+15);
            make.bottom.equalTo(self.contentView).offset(-18-15);
//            make.height.equalTo(@500);
        }];
        
        [backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(content).offset(-15);
            make.right.equalTo(content).offset(15);
            make.top.equalTo(content).offset(-15);
            make.bottom.equalTo(content).offset(15);
        }];
        
        //set
        self.title  =title;
        self.staue  =staue;
        self.backLabel  =backLabel;
        IMAGEsetCONTENTMODE(staue);
        title.font = PingFangSC_Medium(14);
        title.textColor = ColorWithHex(0x000000, 0.87);
        
//        content.font = PingFangSC_Regular(14);
//        content.textColor = ColorWithHex(0x000000, 0.87);
        
        backLabel.backgroundColor = ColorWithHex(0xF7F7F7, 1.0);
        LRViewRadius(backLabel, cornerRadius_width);
        title.numberOfLines = 0;
        
        
        UIFont *font = PingFangSC_Regular(14);
        content.numberOfLines = 0;
//        content.textVerticalAlignment = YYTextVerticalAlignmentTop;



        //test
        staue.image = ImageNamed(@"1");
        title.text = @"发asdfad放";
//        content.text = @"阿斯顿发asdfad发asdfadfadf发asdfadfadf发asdfadfadf发asdfadfadffadf多发的发放";
        
       NSMutableAttributedString *textAll = [NSMutableAttributedString new];
        {
            NSMutableAttributedString *text = [NSMutableAttributedString new];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];

            [imageView sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1044108495,4024655387&fm=173&s=5998209B1852F8CA0C148A53030000F5&w=218&h=146&img.JPEG"] placeholderImage:ImageNamed(place_image_image)];

            NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:imageView contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(20, 14) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            [text appendAttributedString:attachText];
            [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"通常11text-indent缩进属性将对段落首行开头文本文字进行缩进显示。如果使用html br换行标签，第二个换行开始也不会出现缩进效果。如果使用了html P段落标签段落换行，将会出现每个p段落\n" attributes:nil]];
            
            text.yy_font = font;
            text.yy_color = ColorWithHex(0x000000, 0.87);
            text.yy_headIndent = 20.0;
            text.yy_paragraphSpacing = 30;
            [textAll appendAttributedString:text];
            
            
            NSMutableAttributedString *text1 = [NSMutableAttributedString new];
            UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
            
            [imageView1 sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1044108495,4024655387&fm=173&s=5998209B1852F8CA0C148A53030000F5&w=218&h=146&img.JPEG"] placeholderImage:ImageNamed(place_image_image)];
            
            NSMutableAttributedString *attachText1 = [NSMutableAttributedString yy_attachmentStringWithContent:imageView1 contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(20, 14) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            [text1 appendAttributedString:attachText1];
            [text1 appendAttributedString:[[NSAttributedString alloc] initWithString:@"通22常text-indent缩进属性将对段落首行开头文本文字进行缩进显示。如果使用html br换行标签，第二个换行开始也不会出现缩进效果。如果使用了html P段落标签段落换行，将会出现每个p段落\n" attributes:nil]];
            
            text1.yy_font = font;
            text1.yy_color = ColorWithHex(0x000000, 0.87);
            text1.yy_headIndent = 20.0;
            text1.yy_paragraphSpacing = 30;
            [textAll appendAttributedString:text1];
            
            NSMutableAttributedString *text2 = [NSMutableAttributedString new];
            [text2 appendAttributedString:[[NSAttributedString alloc] initWithString:@"通22常text-indent缩进属性将对段落首行开头文本文字进行缩进显示。如果使用html br换行标签，第二个换行开始也不会出现缩进效果。如果使用了html P段落标签段落换行，将会出现每个p段落\n" attributes:nil]];
            
            text2.yy_font = font;
            text2.yy_color = ColorWithHex(0x000000, 0.87);
            //            text3.yy_lineSpacing = 10;
            text2.yy_paragraphSpacing = 30;
//            text2.yy_paragraphSpacingBefore = 30;
            [textAll appendAttributedString:text2];
            
            
            NSMutableAttributedString *text3 = [NSMutableAttributedString new];
            UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
            
            [imageView3 sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1044108495,4024655387&fm=173&s=5998209B1852F8CA0C148A53030000F5&w=218&h=146&img.JPEG"] placeholderImage:ImageNamed(place_image_image)];
            
            NSMutableAttributedString *attachText3 = [NSMutableAttributedString yy_attachmentStringWithContent:imageView3 contentMode:UIViewContentModeCenter attachmentSize:CGSizeMake(20, 14) alignToFont:font alignment:YYTextVerticalAlignmentCenter];
            [text3 appendAttributedString:attachText3];
            [text3 appendAttributedString:[[NSAttributedString alloc] initWithString:@"通常11text-indent缩进属性将对段落首行开头文本文字进行缩进显示。如果使用html br换行标签，第二个换行开始也不会出现缩进效果。如果使用了html P段落标签段落换行，将会出现每个p段落\n" attributes:nil]];
            
            text3.yy_font = font;
            text3.yy_color = ColorWithHex(0x000000, 0.87);
            text3.yy_headIndent = 20.0;
            [textAll appendAttributedString:text3];
        }
        
        CGSize maxSize = CGSizeMake(ScreenWidth-15-15-50-15, MAXFLOAT);
        YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:textAll];
        [content mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lineV).offset(23+15);
            make.right.equalTo(self.contentView).offset(-15-15);
            make.top.equalTo(title.mas_bottom).offset(18+15);
            make.bottom.equalTo(self.contentView).offset(-18-15);
            make.height.equalTo(@(layout.textBoundingSize.height));
        }];
        content.attributedText = textAll;
        
    }
    return self;
}

@end
