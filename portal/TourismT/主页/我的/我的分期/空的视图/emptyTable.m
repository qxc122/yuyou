//
//  emptyTable.m
//  TourismT
//
//  Created by Store on 2017/5/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "emptyTable.h"

@implementation emptyTable

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UILabel *label = [UILabel new];
        [self addSubview:label];
        
        UIButton *btn =[UIButton new];
        [self addSubview:btn];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.top.equalTo(self).offset(100);
        }];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@44);
            make.width.equalTo(@100);
            make.centerX.equalTo(self);
            make.top.equalTo(label.mas_bottom).offset(65);
        }];
        //set
        btn.layer.borderColor = ColorWithHex(0x779FF6, 1.0).CGColor;
        btn.layer.borderWidth = 0.5;
        btn.layer.cornerRadius = cornerRadius_width;
        btn.layer.masksToBounds = YES;
        
        [btn setTitle:@"去逛逛" forState:UIControlStateNormal];
        [btn setTitleColor:ColorWithHex(0x779FF6, 1.0) forState:UIControlStateNormal];
        btn.titleLabel.font = PingFangSC_Regular(17);
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        
        label.textColor = ColorWithHex(0x779FF6, 1.0);
        label.font = PingFangSC_Regular(14);
        label.textAlignment= NSTextAlignmentCenter;
        label.text = @"目前暂无账单，点滴信用，重在积累";
    }
    return self;
}
- (void)btnClick{
    NSLog(@"%s",__func__);
    NSNotification *notification =[NSNotification notificationWithName:Goshopping object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}
@end
