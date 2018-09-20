//
//  HaveMemo.m
//  TourismT
//
//  Created by Store on 2017/8/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "HaveMemo.h"



@interface HaveMemo ()
@property (nonatomic,weak) UILabel *momoTitle;
@property (nonatomic,weak) UILabel *momoContent;
@end

@implementation HaveMemo
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    HaveMemo *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[HaveMemo alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *momoTitle = [[UILabel alloc]init];
        [self.contentView addSubview:momoTitle];
        
        UILabel *momoContent = [[UILabel alloc]init];
        [self.contentView addSubview:momoContent];
        
        [self.content mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.right.equalTo(self.more);
            make.top.equalTo(self.line.mas_bottom).offset(15);
        }];
        
        [momoTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.content);
            make.top.equalTo(self.content.mas_bottom).offset(15);
            make.height.equalTo(@14);
        }];
        
        [momoContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.content);
            make.right.equalTo(self.content);
            make.top.equalTo(momoTitle.mas_bottom).offset(12);
            make.bottom.equalTo(self.contentView).offset(-30);
        }];
        
        self.momoTitle = momoTitle;
        self.momoContent = momoContent;
        [momoTitle settextColorhex:0x000000 alpa:0.4 font:PingFangSC_Regular(14)];
        [momoContent settextColorhex:0x000000 alpa:0.4 font:PingFangSC_Regular(14)];
        self.momoTitle.text  =@"备注：";
        //test
//        self.momoContent.text  =@"2323123142342342342342342342342342342344";
    }
    return self;
}
- (void)setOneDate:(banyouNoticationForOneS *)oneDate{
    [super setOneDate:oneDate];
    self.momoContent.text = oneDate.memo;
}
@end
