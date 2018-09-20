//
//  logoutCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "logoutCell.h"
//#import "UIButton+direction.h"

@interface logoutCell ()

@end

@implementation logoutCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    logoutCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[logoutCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *backIcon = [[UIImageView alloc]init];
        [self.contentView addSubview:backIcon];
        
        UIButton *des = [[UIButton alloc]init];
        [self.contentView addSubview:des];
        
        [backIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];

        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView).offset(64);
            make.bottom.equalTo(self.contentView).offset(-77);
            make.height.equalTo(@(124));
            make.width.equalTo(@(95));
        }];
        
        //set
        IMAGEsetCONTENTMODE(backIcon);
        backIcon.image = ImageNamed(@"bgMyDe");
        [des setImage:ImageNamed(@"Group 9appLofin") forState:UIControlStateNormal];
        [des setTitle:@"请先注册/登录" forState:UIControlStateNormal];
        des.imageView.contentMode = UIViewContentModeScaleAspectFill;
        des.titleLabel.font = PingFangSC_Regular(14);
        [des setTitleColor:ColorWithHex(0xFFFFFF, 0.54) forState:UIControlStateNormal];
        [UIButton setdirectionV:des withSpa:20];
        [des addTarget:self action:@selector(toGologin:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)toGologin:(UIButton *)btn{
    if (self.toGologinbtnClick) {
        self.toGologinbtnClick();
    }
}
@end
