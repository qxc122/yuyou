//
//  lastOkOneCell.m
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "lastOkOneCell.h"


@interface lastOkOneCell ()
@property (nonatomic,weak) UILabel *label1;
@property (nonatomic,weak) UILabel *label2;
@property (nonatomic,weak) UIImageView *image;
@end

@implementation lastOkOneCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    lastOkOneCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[lastOkOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *label1 = [[UILabel alloc]init];
        [self.contentView addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc]init];
        [self.contentView addSubview:label2];
        
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        self.label1 = label1;
        self.label2 = label2;
        self.image = image;
        
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(self.contentView).offset(15);
        }];

        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label1);
            make.right.equalTo(label1);
            make.top.equalTo(label1.mas_bottom).offset(10);
            make.bottom.equalTo(self.contentView);
        }];

        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-20);
            make.centerY.equalTo(label2);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        
        

        //set
        label1.numberOfLines = 0;
        label2.numberOfLines = 0;

        label1.textColor = ColorWithHex(0x000000, 0.87);
        label2.textColor = ColorWithHex(0x000000, 0.87);
        
        label1.font = PingFangSC_Regular(14);
        label2.font = PingFangSC_Regular(14);
        
        image.image = ImageNamed(@"选中");
        self.image.hidden = YES;
        //title.text = @"旅程信息";
        //test
        //label1.text = @"常用";
        //label2.text = @"2016-5-5";
    }
    return self;
}
/*
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.title sizeThatFits:size].height;
    totalHeight += [self.label1 sizeThatFits:size].height;
    totalHeight += [self.label2 sizeThatFits:size].height;
    totalHeight += [self.image sizeThatFits:size].height;
    totalHeight += self.margins; // margins
    return CGSizeMake(size.width, totalHeight);
}
 */
- (void)setLabel1Str:(NSString *)label1Str{
    _label1Str = label1Str;
    self.label1.text = label1Str;
}
- (void)setLabel2Srt:(NSString *)label2Srt{
    _label2Srt = label2Srt;
    self.label2.text = label2Srt;
}
- (void)setIsHidenImage:(BOOL)isHidenImage{
    _isHidenImage = isHidenImage;
    self.image.hidden = isHidenImage;
}
@end
