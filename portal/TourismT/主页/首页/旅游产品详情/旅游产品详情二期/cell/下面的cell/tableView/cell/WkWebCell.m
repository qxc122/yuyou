//
//  WkWebCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "WkWebCell.h"
#import <WebKit/WKFoundation.h>
#import <WebKit/WebKit.h>


@interface WkWebCell ()
@property (nonatomic, weak) WKWebView *WkwebView;
@property (nonatomic, weak) UILabel *title;
@end

@implementation WkWebCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    WkWebCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[WkWebCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *lineTop = [UIView new];
        [self.contentView addSubview:lineTop];
        
        UILabel *title = [UILabel new];
        self.title  =title;
        [self.contentView addSubview:title];
        
        WKWebView *WkwebView = [WKWebView new];
        self.WkwebView  =WkwebView;
        WkwebView.userInteractionEnabled = NO;
        [self.contentView addSubview:WkwebView];
        
//
        UIImageView *WhileBack = [UIImageView new];
        [self.contentView addSubview:WhileBack];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        UIView *btnBack = [UIView new];
        [self.contentView addSubview:btnBack];
        
        UIButton *btn = [UIButton new];
        [self.contentView addSubview:btn];
        
        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(50);
            make.height.equalTo(@0.5);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(lineTop.mas_top);
        }];
        
        
        [WkwebView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(lineTop.mas_bottom);
            make.height.equalTo(@341);
        }];
        [WhileBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.bottom.equalTo(btn.mas_top);
            make.height.equalTo(@150);
        }];
        
        WkwebView.scrollView.showsHorizontalScrollIndicator = NO;
        WkwebView.scrollView.showsVerticalScrollIndicator = NO;
        WkwebView.scrollView.scrollEnabled = NO;
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(WkwebView.mas_bottom);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-30);
            make.width.equalTo(@90);
            make.height.equalTo(@35);
        }];
        [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(btn);
            make.bottom.equalTo(line.mas_top);
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
        }];
        title.textAlignment = NSTextAlignmentCenter;
        btnBack.backgroundColor = [UIColor whiteColor];
        lineTop.backgroundColor = ColorWithHex(0x979797, 0.3);
        line.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        title.font = PingFangSC_Medium(16);
        title.textColor = ColorWithHex(0x000000, 0.87);
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        [btn setTitle:@"查看详情" forState:UIControlStateNormal];
        [btn setTitleColor:ColorWithHex(0x789BF1, 1.0) forState:UIControlStateNormal];
        btn.titleLabel.font = PingFangSC_Regular(14);
        LRViewBorder(btn, 0.5, ColorWithHex(0x789BF1, 1.0));
        LRViewRadius(btn, cornerRadius_width);
        WhileBack.image = ImageNamed(@"白色透明背景");
        IMAGEsetCONTENTMODE(WhileBack);
    }
    return self;
}
- (void)setUrl:(NSURL *)url{
    _url = url;
    [self.WkwebView loadRequest:[NSURLRequest requestWithURL:url]];
}
- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.title.text = titleStr;
}
- (void)btnClick{
    if (self.lookDetail) {
        self.lookDetail(self.url,self.title.text);
    }
}
@end
