//
//  myContactsPeoplesCell.m
//  TourismT
//
//  Created by Store on 2017/1/14.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myContactsPeoplesCell.h"
#import "NSString+check.h"
//#import "UIImageView+CornerRadius.h"


@interface myContactsPeoplesCell ()
@property (nonatomic,weak) UIImageView *sex;
@property (nonatomic,weak) UILabel *name;
@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UIButton *yesOrno;

@property (nonatomic,weak) UIImageView *imageONE;
@property (nonatomic,weak) UIImageView *imageTwo;
@property (nonatomic,weak) UIImageView *imageThrww;
@property (nonatomic,weak) UIImageView *imageFour;
@end

@implementation myContactsPeoplesCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    myContactsPeoplesCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[myContactsPeoplesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *image = [[UIImageView alloc] init];
        [self.contentView addSubview:image];
        
        UIImageView *imageFour = [[UIImageView alloc] init];
        [self.contentView addSubview:imageFour];
        
        UIImageView *imageTwo = [[UIImageView alloc] init];
        [self.contentView addSubview:imageTwo];
        
        UIImageView *imageONE = [[UIImageView alloc] init];
        [self.contentView addSubview:imageONE];
        
        UIImageView *imageThrww = [[UIImageView alloc] init];
        [self.contentView addSubview:imageThrww];
        

        
        UILabel *name = [[UILabel alloc]init];
        [self.contentView addSubview:name];
        
        UIImageView *sex = [[UIImageView alloc]init];
        [self.contentView addSubview:sex];
        
        UIButton *yesOrno = [[UIButton alloc]init];
        [self.contentView addSubview:yesOrno];
        
        UIView *line = [[UIView alloc]init];
        [self.contentView addSubview:line];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(12);
            make.bottom.equalTo(line.mas_top).offset(-12);
            make.width.mas_equalTo(image.mas_height).multipliedBy(1.0);
            make.height.equalTo(@(44));
        }];
        
        [imageONE mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image);
            make.top.equalTo(image);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        
        [imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(image);
            make.top.equalTo(image);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        [imageThrww mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image);
            make.bottom.equalTo(image);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        [imageFour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(image);
            make.bottom.equalTo(image);
            make.width.equalTo(@(30));
            make.height.equalTo(@(30));
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image.mas_right).offset(15);
//            make.right.equalTo(yesOrno.mas_left).offset(-15);
            make.top.equalTo(image).offset(2);
        }];
        
        [sex mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name.mas_right).offset(1);
            make.centerY.equalTo(name.mas_top).offset(5);
            make.width.mas_equalTo(sex.mas_height).multipliedBy(1.0);
            make.height.equalTo(@(10));
        }];
        
        [yesOrno mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_right).offset(-35);
            make.centerY.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(18+12+7));
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);;
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(0.5));
        }];
        
        //set
        self.sex  =sex;
        self.name  =name;
        self.image  =image;
        self.yesOrno  =yesOrno;
        
        self.imageONE  =imageONE;
        self.imageTwo  =imageTwo;
        self.imageThrww  =imageThrww;
        self.imageFour  =imageFour;
        self.imageONE.hidden  =YES;
        self.imageTwo.hidden   =YES;
        self.imageThrww.hidden   =YES;
        self.imageFour.hidden   =YES;
        self.image.hidden   =YES;
        
        sex.image = ImageNamed(@"男");
        sex.highlightedImage = ImageNamed(@"女");
        line.backgroundColor = ColorWithHex(0x979797, 0.1);
        name.font = PingFangSC_Regular(16);
        name.textColor = ColorWithHex(0x000000, 0.87);
        
        /*
         
        //image.contentMode = UIViewContentModeScaleAspectFill;
        //image.clipsToBounds = YES;
        
        //imageONE.contentMode = UIViewContentModeScaleAspectFill;
        //imageONE.clipsToBounds = YES;
        [imageONE zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        //imageTwo.contentMode = UIViewContentModeScaleAspectFill;
        //imageTwo.clipsToBounds = YES;
        [imageTwo zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        //imageThrww.contentMode = UIViewContentModeScaleAspectFill;
        //imageThrww.clipsToBounds = YES;
        [imageThrww zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        
        //imageFour.contentMode = UIViewContentModeScaleAspectFill;
        //imageFour.clipsToBounds = YES;
        [imageFour zy_attachBorderWidth:2.f color:ColorWithHex(0xFFFFFF, 1.0)];
        */
        
        IMAGEsetCONTENTMODE(image);
        LRViewRadius(image, 44/2.0);
        LRViewRadius(imageONE, 30/2.0);
        LRViewRadius(imageTwo, 30/2.0);
        LRViewRadius(imageThrww, 30/2.0);
        LRViewRadius(imageFour, 30/2.0);
        LRViewBorder(imageONE, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(imageTwo, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(imageThrww, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        LRViewBorder(imageFour, 2.0, ColorWithHex(0xFFFFFF, 1.0));
         
        
        //        [self.yesOrno setImage:ImageNamed(@"已关注111") forState:UIControlStateNormal];
        //        [self.yesOrno setTitle:@"已关注" forState:UIControlStateNormal];
        //        [self.yesOrno setTitleColor:ColorWithHex(0x000000, 0.54) forState:UIControlStateNormal];
        yesOrno.titleLabel.font = PingFangSC_Regular(12);
        [yesOrno addTarget:self action:@selector(yesOrnoBTnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)setOneoe:(id )oneoe{
    _oneoe = oneoe;
    if (!oneoe) {
        return;
    }
    if ([oneoe isKindOfClass:[UserS class]]) {
        UserS *one = (UserS *)oneoe;
        [self.image sd_setImageWithURL:[NSURL URLWithString:one.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.name.text = one.nickName;
        if ([one.gender isEqualToString:SEX_male]) {
            self.sex.highlighted = NO;
        } else if ([one.gender isEqualToString:SEX_female]){
            self.sex.highlighted = YES;
        }
        if (one.isFollow) {
            self.yesOrno.selected = NO;
            [self.yesOrno setBtnWithImage:@"已关注111" font:nil Title:@"已关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        } else {
            self.yesOrno.selected = YES;
            [self.yesOrno setBtnWithImage:@"加关注111" font:nil  Title:@"加关注" color:0xFB704B alpa:1.0 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        }
        [self isUserSORgroupsS:NO images:nil];
    }else if([oneoe isKindOfClass:[groupsS class]]){
        groupsS *one = (groupsS *)oneoe;
        self.name.text = one.name;
        [self isUserSORgroupsS:YES images:one.images];
    }else if([oneoe isKindOfClass:[groupsForOneS class]]){
        
        groupsForOneS *one = (groupsForOneS *)oneoe;
        [self.image sd_setImageWithURL:[NSURL URLWithString:one.avatar] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.name.text = one.nickName;
        
        if ([one.gender isEqualToString:SEX_male]) {
            self.sex.highlighted = NO;
        } else if ([one.gender isEqualToString:SEX_female]){
            self.sex.highlighted = YES;
        }
        if (one.isFollow) {
            self.yesOrno.selected = NO;
            [self.yesOrno setBtnWithImage:@"已关注111" font:nil Title:@"已关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        } else {
            self.yesOrno.selected = YES;
            [self.yesOrno setBtnWithImage:@"加关注111" font:nil  Title:@"加关注" color:0xFB704B alpa:1.0 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        }
        [self isUserSORgroupsS:NO images:nil];
    }
    /*
    NSLog(@"self.name.text=%@",self.name.text);
    CGFloat tmp = [NSString WidthForText:self.name.text withFont:PingFangSC_Regular(16)];
    //TODO
    [self.sex mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.mas_left).offset(tmp);
        make.centerY.equalTo(self.name.mas_top).offset(5);
        make.width.mas_equalTo(self.sex.mas_height).multipliedBy(1.0);
        make.height.equalTo(@(10));
    }];
     */
}
- (void)isUserSORgroupsS:(BOOL)isGroupsS images:(NSMutableArray *)images{
    if (isGroupsS) {
        self.sex.hidden = YES;
        self.yesOrno.hidden = YES;
        self.imageONE.hidden  =YES;
        self.imageTwo.hidden   =YES;
        self.imageThrww.hidden   =YES;
        self.imageFour.hidden   =YES;
        self.image.hidden   =YES;
        NSInteger tmp=0;
        UIImageView *imageTmp;
        for (NSString *url in images) {
            if (images.count == 1) {
                imageTmp = self.image;
            } else {
                if (tmp == 0) {
                    imageTmp = self.imageFour;
                } else if (tmp == 1){
                    if (images.count == 2) {
                        imageTmp = self.imageONE;
                    } else {
                        imageTmp = self.imageTwo;
                    }
                } else if (tmp == 2){
                    imageTmp = self.imageONE;
                } else if (tmp == 3){
                    imageTmp = self.imageThrww;
                }else{
                    break;
                }
            }
            NSLog(@"adfa===%@",[NSThread currentThread]);
            NSLog(@"头像地址=%@",url);
            //imageTmp.image = [UIImage imageNamed:@"1"];
            [imageTmp sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:ImageNamed(load_fail_head_image)];
            imageTmp.hidden =NO;
            
            //[imageTmp sd_setImageWithURL:[NSURL URLWithString:@"http://tour.tempus.cn/t-file-test/upload/image/201702/09/b9d36c0d-fd98-41ab-816d-4a0e7bb601d4.png"] placeholderImage:ImageNamed(IMAGE_bigALLBack)];
            tmp++;
        }
    }else{
        self.imageONE.hidden  =YES;
        self.imageTwo.hidden   =YES;
        self.imageThrww.hidden   =YES;
        self.imageFour.hidden   =YES;
        self.image.hidden   =NO;
        self.sex.hidden = NO;
        self.yesOrno.hidden = NO;
        
        
        if([self.oneoe isKindOfClass:[groupsForOneS class]]){
            groupsForOneS *one = (groupsForOneS *)self.oneoe;
            if (self.MySelf == one.idd) {
                self.yesOrno.hidden = YES;
            }
        }
    }
}
- (void)yesOrnoBTnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (self.YESorNOClick) {
        self.YESorNOClick(self.index);
        if (btn.selected) {
            [self.yesOrno setBtnWithImage:@"加关注111"  font:nil Title:@"加关注" color:0xFB704B alpa:1.0 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        } else {
            [self.yesOrno setBtnWithImage:@"已关注111"  font:nil Title:@"已关注" color:0x000000 alpa:0.54 forState:UIControlStateNormal];
            [UIButton setdirectionV:self.yesOrno withSpa:7.0];
        }
    }
}

- (void)setIsChat:(BOOL)isChat{
    _isChat = isChat;
    self.yesOrno.hidden = isChat;
}
@end
