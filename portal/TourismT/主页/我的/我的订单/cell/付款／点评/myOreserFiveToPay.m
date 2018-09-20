//
//  myOreserFiveToPay.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserFiveToPay.h"



@interface myOreserFiveToPay ()
@property (nonatomic,weak)UIButton *btn;
@end

@implementation myOreserFiveToPay
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myOreserFiveToPay *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myOreserFiveToPay alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.view1 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.height.equalTo(@(149+45));
        }];
        
        UIButton *btnBakc = [[UIButton alloc]init];
        [self.contentView addSubview:btnBakc];
        [btnBakc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(0);
            make.right.equalTo(self.contentView).offset(0);
            make.top.equalTo(self.view2.mas_bottom).offset(0);
            make.bottom.equalTo(self.view1).offset(0);
        }];
        
        
        UIButton *btn = [[UIButton alloc]init];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.view2.mas_bottom).offset(15);
            make.bottom.equalTo(self.view1).offset(-15);
            make.width.equalTo(@(70));
        }];
        [btn addTarget:self action:@selector(btnClicl:) forControlEvents:UIControlEventTouchUpInside];
        
        //set
        self.btn = btn;
//        [btn setBackgroundColor:RGBACOLOR(255, 107, 78, 1.0)];
        LRViewRadius(btn, cornerRadius_width);
//        [btn setTitle:@"支付" forState:UIControlStateNormal];
        btn.titleLabel.font = PingFangSC_Regular(14);
    }
    return self;
}
- (void)setDatessTwo:(orderlistForOneS *)datessTwo{
    _datessTwo = datessTwo;
    if (datessTwo) {
        self.datess = datessTwo;
        NSString *titit;
        if ([datessTwo.orderStatus isEqualToString:TOPAY_myOreserFiveAll_type_str]) {
            if (datessTwo.expired) {
                self.btn.enabled = NO;
                titit = @"支付";
//                [self.btn setBackgroundColor:ColorWithHex(0x979797, 0.4)];
//                [self.btn setTitle:@"支付" forState:UIControlStateNormal];
            } else {
                self.btn.enabled = YES;
                titit = @"支付";
//                [self.btn setBackgroundColor:RGBACOLOR(255, 107, 78, 1.0)];
//                [self.btn setTitle:@"支付" forState:UIControlStateNormal];
            }
        } else if ([datessTwo.orderStatus isEqualToString:toGo_myOreserFiveAll_type_str]){
            if (!datessTwo.commentable) {
                self.btn.enabled = NO;
                titit = @"已点评";
            } else {
                self.btn.enabled = YES;
                titit = @"发布游记";
            }
        }
        [self.btn setTitle:titit forState:UIControlStateNormal];
        if (self.btn.enabled) {
            [self.btn setBackgroundColor:RGBACOLOR(255, 107, 78, 1.0)];
        }else{
            [self.btn setBackgroundColor:ColorWithHex(0x979797, 0.4)];
        }
    }
}
- (void)btnClicl:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(self.datessTwo);
    }
}

@end
