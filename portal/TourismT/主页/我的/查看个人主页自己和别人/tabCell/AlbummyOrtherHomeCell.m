//
//  AlbummyOrtherHomeCell.m
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "AlbummyOrtherHomeCell.h"

@interface AlbummyOrtherHomeCell ()
//@property (nonatomic,weak) UIImageView *image;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *time;
@property (nonatomic,weak) UIButton *num;
@property (nonatomic,weak) UIButton *Givethethumbsupnum;
@end

@implementation AlbummyOrtherHomeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    AlbummyOrtherHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[AlbummyOrtherHomeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc]init];
        [self.contentView addSubview:image];
        
        UIView *imageBack = [[UIView alloc]init];
        [self.contentView addSubview:imageBack];
        
        UILabel *title = [[UILabel alloc]init];
        [self.contentView addSubview:title];
        
        UILabel *time = [[UILabel alloc]init];
        [self.contentView addSubview:time];
        
        UIButton *num = [[UIButton alloc]init];
        num.userInteractionEnabled = NO;
        [self.contentView addSubview:num];
        
        UIButton *Givethethumbsupnum = [[UIButton alloc]init];
        [self.contentView addSubview:Givethethumbsupnum];
        
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
        [imageBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image);
            make.right.equalTo(image);
            make.top.equalTo(image);
            make.bottom.equalTo(image);
        }];
        imageBack.backgroundColor = ColorWithHex(0x000000, 0.3);
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(15);
            make.right.equalTo(image).offset(-15);
            make.top.equalTo(image).offset(30);
        }];
        
        [time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(image).offset(20);
            make.bottom.equalTo(image).offset(-20);
        }];
        
        [Givethethumbsupnum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(image.mas_right).offset(-15);
            make.centerY.equalTo(time);
            make.height.equalTo(@44);
        }];
        
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(Givethethumbsupnum.mas_left).offset(-20);
            make.centerY.equalTo(time);
            make.height.equalTo(@44);
        }];
        
        //set
        self.image  =image;
        self.title  =title;
        self.time  =time;
        self.num  =num;
        self.Givethethumbsupnum  = Givethethumbsupnum;
        LRViewRadius(imageBack, cornerRadius_width);
        LRViewRadius(image, cornerRadius_width);
        IMAGEsetCONTENTMODE(image);
        title.font = PingFangSC_Regular(18);
        title.textColor = ColorWithHex(0xFFFFFF, 1.0);
        time.font = PingFangSC_Regular(10);
        time.textColor = ColorWithHex(0xFFFFFF, 0.53);
        [num setTitleColor:ColorWithHex(0xFFFFFF, 0.53) forState:UIControlStateNormal];
        num.titleLabel.font = PingFangSC_Regular(10);
        [num setImage:ImageNamed(@"查看眼睛") forState:UIControlStateNormal];
        [Givethethumbsupnum setTitleColor:ColorWithHex(0xFFFFFF, 0.53) forState:UIControlStateNormal];
        Givethethumbsupnum.titleLabel.font = PingFangSC_Regular(10);
        [Givethethumbsupnum setImage:ImageNamed(@"点赞") forState:UIControlStateNormal];
//        [Givethethumbsupnum setImage:ImageNamed(@"点赞1") forState:UIControlStateHighlighted];
//        [Givethethumbsupnum setImage:ImageNamed(@"点赞1") forState:UIControlStateSelected];
        [Givethethumbsupnum addTarget:self action:@selector(GivethethumbsupnumClick:) forControlEvents:UIControlEventTouchUpInside];
//        点赞 点击效果
        //test
        //        image.image = ImageNamed(IMAGE_bigBack);
//                title.text = @"mas_makeConstra mas_makeConstra";
        //        time.text = @"16-12-20";
        //        [num setTitle:@" 30" forState:UIControlStateNormal];

    }
    return self;
}
- (void)GivethethumbsupnumClick:(UIButton *)btn{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appusersharingthumbsWithIdd:self.oneData.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        if (weakself.Givethethumbsupnum.selected) {
            weakself.Givethethumbsupnum.selected = !self.Givethethumbsupnum.selected;
            weakself.oneData.thumbsUpCounts -= 1;
            [weakself.Givethethumbsupnum setTitle:[NSString stringWithFormat:@" %ld",(long)weakself.oneData.thumbsUpCounts] forState:UIControlStateNormal];
        } else {
            weakself.oneData.thumbsUpCounts += 1;
            [weakself.Givethethumbsupnum setTitle:[NSString stringWithFormat:@" %ld",(long)weakself.oneData.thumbsUpCounts] forState:UIControlStateNormal];
            
            btn.selected = YES;
            int i = 0;
            [btn setImage:[UIImage imageNamed:(i%2==0?@"点赞1":@"点赞 点击效果")] forState:UIControlStateNormal];
            CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
            k.values = @[@(0.1),@(1.0),@(1.5)];
            k.keyTimes = @[@(0.0),@(0.5),@(0.8),@(1.0)];
            k.calculationMode = kCAAnimationLinear;
            i++;
            [btn.layer addAnimation:k forKey:@"SHOW"];
        }
        if (weakself.Givethethumbsupnum.selected) {
            [weakself.Givethethumbsupnum setImage:ImageNamed(@"点赞1") forState:UIControlStateNormal];
        } else {
            [weakself.Givethethumbsupnum setImage:ImageNamed(@"点赞") forState:UIControlStateNormal];
        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD showPrompt:msg];
    }];
}
- (void)setOneData:(travelSharingsS *)oneData{
    if (oneData) {
        _oneData = oneData;
        NSLog(@"oneData.coverImage=%@",oneData.coverImage);
        [self.image sd_setImageWithURL:[NSURL URLWithString:oneData.coverImage] placeholderImage:ImageNamed(IMAGE_bigBack)];
        self.title.text = oneData.title;
        self.time.text = oneData.createDateStr;
        [self.num setTitle:[NSString stringWithFormat:@" %ld",(long)oneData.hits] forState:UIControlStateNormal];
        
        [self.Givethethumbsupnum setTitle:[NSString stringWithFormat:@" %ld",(long)oneData.thumbsUpCounts] forState:UIControlStateNormal];
        if (oneData.isThumbsUp) {
            [self.Givethethumbsupnum setImage:ImageNamed(@"点赞1") forState:UIControlStateNormal];
        } else {
            [self.Givethethumbsupnum setImage:ImageNamed(@"点赞") forState:UIControlStateNormal];
        }
    }
}
- (void)setData:(NSString *)data{
    if (data) {
        _data = data;
        draftForOne *one = [NSKeyedUnarchiver unarchiveObjectWithFile:[PATH_OF_DOCUMENT stringByAppendingPathComponent:data]];
        self.image.image = [UIImage imageWithData:one.image];
        self.title.text = one.content;
        self.time.text = one.creatTime;
        self.num.hidden = YES;
        self.Givethethumbsupnum.hidden = YES;
    }
}
- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    if (indexPath && indexPath.section == 0 && indexPath.row == 0) {
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }else{
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }
}
- (void)setTheLastOne:(BOOL)TheLastOne{
    if (TheLastOne) {
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15-50);
        }];
    }else{
        [self.image mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.right.equalTo(self.contentView).offset(-15);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
    }
}
@end
