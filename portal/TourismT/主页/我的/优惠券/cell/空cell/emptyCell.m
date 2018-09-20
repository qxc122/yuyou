//
//  emptyCell.m
//  TourismT
//
//  Created by Store on 2017/1/12.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "emptyCell.h"


@interface emptyCell ()
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *des;
@end

@implementation emptyCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    emptyCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[emptyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
//        UIView *viewBack =[[UIView alloc]init];
//        [self.contentView addSubview:viewBack];
        
        UIImageView *image =[[UIImageView alloc]init];
        [self.contentView addSubview:image];
        
        UILabel *des =[[UILabel alloc]init];
        [self.contentView addSubview:des];
        
//        [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.contentView);
//            make.bottom.equalTo(self.contentView);
//            make.left.equalTo(self.contentView);
//            make.right.equalTo(self.contentView);
//            make.height.equalTo(@(ScreenHeight-63-HEIGHT_Navbar-spaceing_line_to_bottom));
//        }];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(@(156));
//            make.height.equalTo(@(165));
            make.centerX.equalTo(self.contentView);
            make.centerY.equalTo(self.contentView).offset(-16);
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(0);
            make.right.equalTo(self.contentView).offset(0);
            make.top.equalTo(image.mas_bottom).offset(10);
        }];
        
        self.image = image;
        self.des = des;
        des.textAlignment = NSTextAlignmentCenter;
        IMAGEsetCONTENTMODE(image);
        [des settextColorhex:0x779CF4 alpa:1.0 font:PingFangSC_Regular(14)];
        
        //tset
//        des.text = @"暂无标签";
//        image.image = ImageNamed(@"linewubiaoq");
    }
    return self;
}

- (void)setImageStr:(NSString *)imageStr{
    _imageStr = imageStr;
    self.image.image = ImageNamed(imageStr);
}
- (void)setDesStr:(NSString *)desStr{
    _desStr = desStr;
    self.des.text = desStr;
}

@end
