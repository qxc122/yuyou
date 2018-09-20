//
//  tongyonCell.m
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "tongyonCell.h"

@interface tongyonCell ()
@property (weak,nonatomic) UITextField *labelMid;
@property (weak,nonatomic) UIImageView *more;
@property (weak,nonatomic) UILabel *label;
@property (weak,nonatomic) UILabel *youhui;
@end

@implementation tongyonCell

+ (instancetype)returnCellWith:(UITableView *)tableView
{
    tongyonCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[tongyonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        
        
        UILabel *label = [[UILabel alloc]init];
        self.label = label;
        [self.contentView addSubview:label];
        
        UITextField *labelMid = [[UITextField alloc]init];
        [labelMid setValue:placeholderLabeltextColor forKeyPath:@"_placeholderLabel.textColor"];
        
        self.labelMid = labelMid;
        [self.contentView addSubview:labelMid];
        [labelMid addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        UILabel *youhui = [[UILabel alloc]init];
        self.youhui = youhui;
        [self.contentView addSubview:youhui];
        
        
        UIImageView *more = [[UIImageView alloc]init];
        self.more = more;
        more.hidden = YES;
        [self.contentView addSubview:more];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
            make.top.equalTo(self).offset(15);
            make.bottom.equalTo(self).offset(0);
        }];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(back).offset(15);
            make.width.equalTo(@(60));
            make.centerY.equalTo(back);
        }];
        
        [labelMid mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more.mas_left).offset(-5);
            make.left.equalTo(label.mas_right).offset(15);
            make.centerY.equalTo(back);
        }];
        
        [youhui mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(more.mas_left).offset(-5);
            make.centerY.equalTo(more);
        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(back).offset(-15);
            make.centerY.equalTo(back);
            make.width.equalTo(@(7));
            make.height.equalTo(@(12));
        }];
        //set
        labelMid.keyboardType = UIKeyboardTypePhonePad;//UIKeyboardTypeDecimalPad
        labelMid.textColor = ColorWithHex(0x000000, 1.0);//0.29
        label.textColor = ColorWithHex(0x000000, 1.0);
        labelMid.font = PingFangSC_Regular(14);
        label.font = PingFangSC_Regular(14);
        more.image = ImageNamed(@"点击");
        [youhui settextColorhex:0xFB704B alpa:1.0 font:PingFangSC_Regular(14)];
//        youhui.text = @"出行人";
        //labelMid.text = @"常用旅客123";
    }
    return self;
}
- (void)setUserEnaMidle:(BOOL)userEnaMidle{
    _userEnaMidle = userEnaMidle;
    self.labelMid.userInteractionEnabled = userEnaMidle;
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.label.text = title;
}
- (void)setDes:(NSString *)des{
    _des = des;
    self.labelMid.placeholder = des;
}
- (void)setDesOk:(NSString *)desOk{
    _desOk = desOk;
    self.labelMid.text = desOk;
}
- (void)setHidenMore:(BOOL)hidenMore{
    _hidenMore = hidenMore;
    self.more.hidden = hidenMore;
}
- (void)setHidenMidle:(BOOL)hidenMidle{
    _hidenMidle = hidenMidle;
    self.labelMid.hidden = hidenMidle;
}
- (void)setHidenyouhui:(BOOL)hidenyouhui{
    _hidenyouhui = hidenyouhui;
    self.youhui.hidden = hidenyouhui;
}
-(void)textFieldDidChange :(UITextField *)textField{
    if (self.textClick) {
        self.textClick(textField.text);
    }
}
- (void)setYHQSoneDate:(YHQoneS *)YHQSoneDate{
    _YHQSoneDate = YHQSoneDate;
    if (YHQSoneDate) {
        self.youhui.text = [NSString stringWithFormat:@"减¥%.0f",YHQSoneDate.price];
    }
}
@end
