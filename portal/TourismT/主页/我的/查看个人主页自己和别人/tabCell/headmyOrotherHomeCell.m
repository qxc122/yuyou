//
//  headmyOrotherHomeCell.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "headmyOrotherHomeCell.h"

#import "NSString+check.h"

@interface headmyOrotherHomeCell ()
@property (nonatomic,weak) UIButton *goedit;
@property (nonatomic,weak) UIImageView *icon;
@property (nonatomic,weak) UIImageView *back;
@property (nonatomic,weak) UITextField *name;
@property (nonatomic,weak) UIImageView *sex;
@property (nonatomic,weak) UITextField *des;

@property (nonatomic,weak) UILabel *one;
@property (nonatomic,weak) UILabel *two;
@property (nonatomic,weak) UILabel *three;
@end


@implementation headmyOrotherHomeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    headmyOrotherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[headmyOrotherHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *back = [[UIImageView alloc]init];
        [self.contentView addSubview:back];
        
        //        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        //        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        //        [self.contentView addSubview:effectView];
        
        //        UIButton *btnBack = [[UIButton alloc]init];
        //        [self.contentView addSubview:btnBack];
        
        UIView *iconBack = [[UIView alloc]init];
        [self.contentView addSubview:iconBack];
        
        UIImageView *icon = [[UIImageView alloc]init];
        [self.contentView addSubview:icon];
        
        UITextField *name = [[UITextField alloc]init];
        [self.contentView addSubview:name];
        
        UIImageView *sex = [[UIImageView alloc]init];
        sex.userInteractionEnabled = NO;
        [self.contentView addSubview:sex];
        
        UITextField *des = [[UITextField alloc]init];
        [self.contentView addSubview:des];
        UIButton *goedit = [[UIButton alloc]init];
        [self.contentView addSubview:goedit];
        
        UILabel *one1 = [[UILabel alloc]init];
        [self.contentView addSubview:one1];
        UILabel *one = [[UILabel alloc]init];
        [self.contentView addSubview:one];
        
        UILabel *two1 = [[UILabel alloc]init];
        [self.contentView addSubview:two1];
        UILabel *two = [[UILabel alloc]init];
        [self.contentView addSubview:two];
        
        UILabel *three1 = [[UILabel alloc]init];
        [self.contentView addSubview:three1];
        UILabel *three = [[UILabel alloc]init];
        [self.contentView addSubview:three];
        
        UIButton *btn1 = [[UIButton alloc]init];
        [self.contentView addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc]init];
        [self.contentView addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc]init];
        [self.contentView addSubview:btn3];
        
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(280));
        }];
        //        [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(back);
        //            make.right.equalTo(back);
        //            make.top.equalTo(back);
        //            make.bottom.equalTo(back);
        //        }];
        
        //        [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.left.equalTo(back).offset(back_btn_left_to_superView);
        //            make.top.equalTo(back).offset(back_btn_top_to_superView);
        //            make.width.equalTo(@(40));
        //            make.height.equalTo(@(40));
        //        }];
        
        
        [iconBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(icon);
            make.centerY.equalTo(icon);
            make.width.equalTo(@(64));
            make.height.equalTo(@(64));
        }];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(back);
            make.top.equalTo(back).offset(64);
            make.width.equalTo(@(60));
            make.height.equalTo(@(60));
        }];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(icon);
            make.left.equalTo(self.contentView).offset(44);
            make.right.equalTo(self.contentView).offset(-44);
            make.top.equalTo(icon.mas_bottom).offset(20);
        }];
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(name.mas_top).offset(5);
            make.left.equalTo(name.mas_right).offset(8);
            make.width.equalTo(@(10));
            make.height.equalTo(@(10));
        }];
        
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(back);
            make.left.equalTo(self.contentView).offset(44);
            make.right.equalTo(self.contentView).offset(-44);
            make.top.equalTo(name.mas_bottom).offset(10);
        }];
        [goedit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(-15);
            make.centerY.equalTo(des);
            make.width.equalTo(@(44));
            make.height.equalTo(@(44));
        }];
        
        [two mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(back);
            //make.top.equalTo(des.mas_bottom).offset(24);
            //make.width.equalTo(@[two1,one,one1,three,three1]);
            make.height.equalTo(@[two1,one,one1,three,three1]);
        }];
        [two1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(two);
            make.top.equalTo(two.mas_bottom).offset(4);
            make.bottom.equalTo(back).offset(-22);
        }];
        
        [one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(two);
            make.left.equalTo(back);
            make.right.equalTo(two.mas_left);
        }];
        [one1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(one);
            make.top.equalTo(one.mas_bottom).offset(4);
            make.bottom.equalTo(back).offset(-22);
        }];
        [three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(two);
            make.left.equalTo(two.mas_right);
            make.right.equalTo(back);
        }];
        [three1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(three);
            make.top.equalTo(one.mas_bottom).offset(4);
            make.bottom.equalTo(back).offset(-22);
        }];
        [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(one1);
            make.right.equalTo(one1);
            make.top.equalTo(one);
            make.bottom.equalTo(one1);
        }];
        [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(two1);
            make.right.equalTo(two1);
            make.top.equalTo(two);
            make.bottom.equalTo(two1);
        }];
        [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(three1);
            make.right.equalTo(three1);
            make.top.equalTo(three);
            make.bottom.equalTo(three1);
        }];
        //set
        self.back = back;
        self.icon = icon;
        self.name = name;
        self.sex = sex;
        self.des = des;
        self.one = one;
        self.two = two;
        self.three = three;
        self.goedit  =goedit;
        back.tag = backheadmyOrotherHomeCell_enmu;
        btn1.tag = numheadmyOrotherHomeCell_enmu;
        btn2.tag = guanzhuheadmyOrotherHomeCell_enmu;
        btn3.tag = beiguanzhuheadmyOrotherHomeCell_enmu;
        [btn1 addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn2 addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn3 addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        icon.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(iconClick:)];
        [icon addGestureRecognizer:tap];
        icon.tag = iconheadmyOrotherHomeCell_enmu;
        
        //        LRViewBorder(icon, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        
        sex.image = ImageNamed(@"男");
        sex.highlightedImage = ImageNamed(@"女");
        name.textColor = ColorWithHex(0xFFFFFF, 1.0);
        name.font = PingFangSC_Regular(18);
        //        name.backgroundColor = [UIColor redColor];////////////.
        des.textColor = ColorWithHex(0xFFFFFF, 0.8);
        des.font = PingFangSC_Regular(12);
        name.textAlignment = NSTextAlignmentCenter;
        des.textAlignment = NSTextAlignmentCenter;
        
        one1.textColor = ColorWithHex(0xFFFFFF, 0.8);
        one1.font = PingFangSC_Regular(12);
        two1.textColor = ColorWithHex(0xFFFFFF, 0.8);
        two1.font = PingFangSC_Regular(12);
        three1.textColor = ColorWithHex(0xFFFFFF, 0.8);
        three1.font = PingFangSC_Regular(12);
        
        one.textColor = ColorWithHex(0xFFFFFF, 1.0);
        one.font = PingFangSC_Medium(14);
        two.textColor = ColorWithHex(0xFFFFFF, 1.0);
        two.font = PingFangSC_Medium(14);
        three.textColor = ColorWithHex(0xFFFFFF, 1.0);
        three.font = PingFangSC_Medium(14);
        
        one1.textAlignment = NSTextAlignmentCenter;
        two1.textAlignment = NSTextAlignmentCenter;
        three1.textAlignment = NSTextAlignmentCenter;
        two.textAlignment = NSTextAlignmentCenter;
        one.textAlignment = NSTextAlignmentCenter;
        three.textAlignment = NSTextAlignmentCenter;
        IMAGEsetCONTENTMODE(back);
        IMAGEsetCONTENTMODE(icon);
        LRViewRadius(icon,60/2.0);
        LRViewRadius(iconBack,60/2.0);
        iconBack.backgroundColor = ColorWithHex(0xFFFFFF, 0.5);
        //        [btnBack setImage:[UIImage imageNamed:IMAGE_back] forState:UIControlStateNormal];
        //        [btnBack addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        two1.text = @"关注";
        one1.text = @"旅程";
        three1.text = @"被关注";
        goedit.tag = eidtdmyOrotherHomeCell_enmu;
        self.goedit = goedit;
        [goedit setImage:ImageNamed(@"编辑adf") forState:UIControlStateNormal];
        [goedit addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
        back.image = ImageNamed(IMAGE_bigALLBack);
        //test
        //        two.text = @"20";
        //        one.text = @"10";
        //        three.text = @"30";
        name.placeholder = @"暂无昵称";
        des.placeholder = @"暂无签名";
        name.userInteractionEnabled = NO;
        des.userInteractionEnabled = NO;
        //        icon.image = ImageNamed(IMAGE_bigBack);
        
        //        CIContext *context = [CIContext contextWithOptions:nil];
        //        CIImage *inputImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"back1"]];
        //        // create gaussian blur filter
        //        CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
        //        [filter setValue:inputImage forKey:kCIInputImageKey];
        ////        [filter setValue:[NSNumber numberWithFloat:10.0] forKey:@"inputRadius"];
        //        // blur image
        //        CIImage *result = [filter valueForKey:kCIOutputImageKey];
        //        CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
        //        UIImage *image = [UIImage imageWithCGImage:cgImage];
        //        CGImageRelease(cgImage);
        //        back.image = image;
        
    }
    return self;
}
- (void)BtnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(btn.tag);
    }
}
- (void)iconClick:(UITapGestureRecognizer *)tap{
    if (self.btnClick) {
        self.btnClick(tap.view.tag);
    }
}
- (void)setIsMy:(BOOL)isMy{
    _isMy = isMy;
    self.goedit.hidden = !isMy;
}
- (void)setOneData:(peoHome_page *)oneData{
    _oneData = oneData;
    if (oneData) {
        kWeakSelf(self);
        [[tourHelper sharedInstance]blurryGPUImage:oneData.user.avatar :nil success:^(UIImage *tmpIMage) {
            weakself.back.image  = tmpIMage;
        }];
        
        [self.icon sd_setImageWithURL:[NSURL URLWithString:oneData.user.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        //        NSLog(@"self.decodedBag.name ＝ %@ %@",self.oneData.user.name,self.oneData.user.gender);

        if ([oneData.user.gender isEqualToString:SEX_male]) {
            self.sex.highlighted = NO;
        } else if ([oneData.user.gender isEqualToString:SEX_female]){
            self.sex.highlighted = YES;
        }
        if (!oneData.user.nickName  || !oneData.user.nickName.length) {//不可以去掉
            oneData.user.nickName = @"暂无昵称";
        }
        CGFloat width = [NSString WidthForText:oneData.user.nickName withFont:PingFangSC_Regular(18)];
        if (width> (ScreenWidth-88)) {
            [self.sex mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.name.mas_top).offset(5);
                make.left.equalTo(self.name.mas_right).offset(8);
                make.width.equalTo(@(10));
                make.height.equalTo(@(10));
            }];
        }else{
            [self.sex mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.name.mas_top).offset(5);
                make.centerX.equalTo(self.contentView).offset(width/2.0+8);
                make.width.equalTo(@(10));
                make.height.equalTo(@(10));
            }];
        }
        
        if (!oneData.user.signature || !oneData.user.signature.length) { //不可以去掉
            oneData.user.signature = @"说点什么吧～";
        }
        self.name.text = oneData.user.nickName;
        self.des.text = oneData.user.signature;
        CGFloat width2 = [NSString WidthForText:oneData.user.signature withFont:PingFangSC_Regular(12)];
        if (width2> (ScreenWidth-88)) {
            [self.goedit mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.des.mas_right).offset(-15);
                make.centerY.equalTo(self.des);
                make.width.equalTo(@(44));
                make.height.equalTo(@(44));
            }];
        }else {
            [self.goedit mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.contentView).offset(width2/2.0+8);
                make.centerY.equalTo(self.des);
                make.width.equalTo(@(44));
                make.height.equalTo(@(44));
            }];
        }
        
        self.one.text = [NSString stringWithFormat:@"%ld",(long)oneData.travelCount];
        self.two.text = [NSString stringWithFormat:@"%ld",(long)oneData.followCount];;
        self.three.text = [NSString stringWithFormat:@"%ld",(long)oneData.followerCount];;
    }
}
@end
