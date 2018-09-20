//
//  myDeVcSehzhiCell.m
//  TourismT
//
//  Created by Store on 2017/1/11.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myDeVcSehzhiCell.h"


@interface myDeVcSehzhiCell ()
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UILabel *desTwo;

@property (nonatomic,weak) UIImageView *more;
@property (nonatomic,weak) UISwitch *swifp;
@end



@implementation myDeVcSehzhiCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myDeVcSehzhiCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myDeVcSehzhiCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];

        UILabel *des = [[UILabel alloc]init];
        [self.contentView addSubview:des];
        
        UILabel *desTwo = [[UILabel alloc]init];
        [self.contentView addSubview:desTwo];
        
        
        UIImageView *more = [[UIImageView alloc]init];
        [self.contentView addSubview:more];
        
//        UISwitch *swifp = [[UISwitch alloc]init];
//        [self.contentView addSubview:swifp];
        
        UISwitch *swifp = [[UISwitch alloc] initWithFrame:CGRectMake(ScreenWidth-30-30, 7, 30, 20)];
//        [switchButton setOn:YES];
        [self.contentView addSubview:swifp];
        
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
//            make.right.equalTo(self.contentView).offset(-200);
            make.top.equalTo(self.contentView).offset(20);
//            make.bottom.equalTo(self.contentView).offset(-20);
        }];
        [desTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title.mas_right).offset(20);
            make.centerY.equalTo(title);
        }];

        [des mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(title.mas_right).offset(5);
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(title);
        }];
        [more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(6));
            make.height.equalTo(@(12));
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(title);
        }];

//        [swifp mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(@(30));
//            make.height.equalTo(@(21));
//            make.right.equalTo(self.contentView).offset(-30);
//            make.centerY.equalTo(title);
//        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).offset(20);
            make.bottom.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(0.5));
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
        }];

        //set
        [swifp addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        line.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        [title settextColorhex:0x000000 alpa:0.87 font:PingFangSC_Regular(14)];
        [desTwo settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(14)];
        [des settextColorhex:0x000000 alpa:0.54 font:PingFangSC_Regular(14)];
        title.textAlignment = NSTextAlignmentLeft;
        des.textAlignment = NSTextAlignmentRight;
        more.image = ImageNamed(@"点击");
        swifp.hidden = YES;
        des.hidden = YES;
        more.hidden = YES;
        self.desTwo = desTwo;
        self.title = title;
        self.des = des;
        self.more = more;
        self.swifp = swifp;
        //test
        title.text  =@"sdf";
        des.text  =@"sdf";
    }
    return self;
}
- (void)switchAction:(UISwitch *)btn{
    if (btn.isOn) {
        // 去设置权限
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    } else {
        XAlertView *aler = [[XAlertView alloc]initWithTitle:@"是否关闭推送" message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
            if (!canceled) {
                // 去设置权限
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                if ([[UIApplication sharedApplication] canOpenURL:url]) {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }else{
                [self.swifp setOn:YES];
            }
        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [aler show];
    }
}
- (void)setTit:(NSString *)tit{
    _tit = tit;
    self.title.text = tit;
}
- (void)setIsHiedes:(BOOL)isHiedes{
    _isHiedes = isHiedes;
    self.des.hidden = isHiedes;
}
- (void)setIsHiemore:(BOOL)isHiemore{
    _isHiemore = isHiemore;
    self.more.hidden = isHiemore;
}
- (void)setIsHieswifp:(BOOL)isHieswifp{
    _isHieswifp = isHieswifp;
    self.swifp.hidden = isHieswifp;
}
- (void)setDess:(NSString *)dess{
    _dess = dess;
    self.des.text = dess;
}
- (void)setIsHiedessTwo:(BOOL)isHiedessTwo{
    _isHiedessTwo =  isHiedessTwo;
    self.desTwo.hidden = isHiedessTwo;
}
- (void)setDessTwo:(NSString *)dessTwo{
    _dessTwo = dessTwo;
    self.desTwo.text = dessTwo;
}
- (void)setIsAllowNotication:(BOOL)isAllowNotication{
    _isAllowNotication = isAllowNotication;
    if (_isHieswifp == NO) {
        [self.swifp setOn:isAllowNotication];
    }
}


//-(void)setIsClear:(BOOL)isClear{
//    _isClear = isClear;
//    if (isClear) {
//        UIActivityIndicatorView *ActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        ActivityIndicator.backgroundColor = [UIColor redColor];
//        ActivityIndicator.color = [UIColor grayColor]; // 改变圈圈的颜色为红色； iOS5引入
//        [ActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
//        ActivityIndicator.hidden = YES;
//        [self.contentView addSubview:ActivityIndicator];
//        
//        [ActivityIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self.more);
//            make.centerY.equalTo(self.more);
//            make.width.equalTo(@(30));
//            make.height.equalTo(@(30));
//        }];
//        [ActivityIndicator startAnimating]; // 开始旋转
//
//        
////        UIActivityIndicatorView *testActivityIndicator = [UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite]];
////        testActivityIndicator.center = CGPointMake(100.0f, 100.0f);//只能设置中心，不能设置大小
////        [testActivityIndicator setFrame = CGRectMack(100, 100, 100, 100)];//不建议这样设置，因为UIActivityIndicatorView是不能改变大小只能改变位置，这样设置得到的结果是控件的中心在（100，100）上，而不是和其他控件的frame一样左上角在（100， 100）长为100，宽为100.
////        [self addSubview:testActivityIndicator];
////        testActivityIndicator.color = [UIColor redColor]; // 改变圈圈的颜色为红色； iOS5引入
////        [testActivityIndicator startAnimating]; // 开始旋转
////        [testActivityIndicator stopAnimating]; // 结束旋转
////        [testActivityIndicator setHidesWhenStopped:YES]; //当旋转结束时隐藏
//    } else {
//        
//    }
//}
@end
