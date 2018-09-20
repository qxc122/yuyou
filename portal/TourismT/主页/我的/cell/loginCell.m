//
//  loginCell.m
//  TourismT
//
//  Created by Store on 17/1/3.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "loginCell.h"
#import "loginCoCell.h"
#import "loginMoreCell.h"
@interface loginCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property (nonatomic,weak) UIImageView *btnIcon;
@property (nonatomic,weak) UITextField *name;
@property (nonatomic,weak) UIButton *guangzhuBtn;
@property (nonatomic,weak) UIButton *beiguangzhuBtn;
@property (nonatomic,weak) UIButton *one;


@property (nonatomic,weak) UIButton *photo;
@property (nonatomic,weak) UIView *foot;
@property (nonatomic,weak) UIView *line;
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UIImageView *left;
@end

@implementation loginCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    loginCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[loginCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
        [backIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
        }];
        
        
        UIView *backIconBack = [[UIView alloc]init];
        [self.contentView addSubview:backIconBack];
        
        UIImageView *btnIcon = [[UIImageView alloc]init];
        [self.contentView addSubview:btnIcon];
        
        UITextField *name = [[UITextField alloc]init];
        name.userInteractionEnabled = NO;
        [self.contentView addSubview:name];
        
        UIButton *guangzhuBtn = [[UIButton alloc]init];
        [self.contentView addSubview:guangzhuBtn];

        UIButton *beiguangzhuBtn = [[UIButton alloc]init];
        [self.contentView addSubview:beiguangzhuBtn];
        
        UIButton *card = [[UIButton alloc]init];
        [self.contentView addSubview:card];
        
        UIView *foot = [[UIView alloc]init];
        [self.contentView addSubview:foot];
        
        UIButton *photo = [[UIButton alloc]init];
        [self.contentView addSubview:photo];
        
        UIView *line = [[UIView alloc]init];
        self.line = line;
        [foot addSubview:line];
        
        UIButton *one = [[UIButton alloc]init];
        [foot addSubview:one];
        
        
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.bounces = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[loginCoCell class] forCellWithReuseIdentifier:NSStringFromClass([loginCoCell class])];
        [collectionView registerClass:[loginMoreCell class] forCellWithReuseIdentifier:NSStringFromClass([loginMoreCell class])];
        [foot addSubview:collectionView];
        
        UIImageView *left = [UIImageView new];
//        left.contentMode =  UIViewContentModeScaleAspectFill;
        left.image = ImageNamed(@"Rectangle 14");
        self.left = left;
        [foot addSubview:left];
        
        [backIconBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(btnIcon);
            make.centerX.equalTo(btnIcon);
            make.width.equalTo(@(64));
            make.height.equalTo(@(64));
        }];
        
        [btnIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(65);
            make.width.equalTo(@(60));
            make.height.equalTo(@(60));
        }];
        
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btnIcon.mas_right).offset(30);
            make.right.equalTo(self.contentView).offset(0);
            make.top.equalTo(self.contentView).offset(74);
        }];
        [guangzhuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(name);
            make.top.equalTo(name.mas_bottom).offset(0);
            make.height.equalTo(@(44));
        }];
        [beiguangzhuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(guangzhuBtn.mas_right).offset(30*WIDTHICON);
            make.centerY.equalTo(guangzhuBtn);
            make.height.equalTo(@(44));
        }];
        [card mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(beiguangzhuBtn.mas_right).offset(30*WIDTHICON);
            make.centerY.equalTo(guangzhuBtn);
            make.height.equalTo(@(44));
        }];
        
        [foot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(beiguangzhuBtn.mas_bottom).offset(27);
            make.bottom.equalTo(self.contentView);
//            make.height.equalTo(@(115));
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(foot).offset(15);
            make.right.equalTo(foot).offset(-15);
            make.top.equalTo(foot);
            make.height.equalTo(@(1));
        }];
        [one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line);
            make.top.equalTo(foot).offset(15);
            make.bottom.equalTo(foot).offset(-20);
            make.width.equalTo(@(80*WIDTHICON));
            make.height.mas_equalTo(one.mas_width).multipliedBy(1.0);
        }];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(one.mas_right).offset(15);
            make.right.equalTo(self.contentView);
            make.top.equalTo(one);
            make.bottom.equalTo(one);
        }];
        [left mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(collectionView.mas_left);
            make.width.equalTo(@(15));
            make.top.equalTo(collectionView);
            make.bottom.equalTo(collectionView);
        }];
        
        [photo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(foot);
            make.top.equalTo(guangzhuBtn.mas_bottom).offset(45);
//            make.top.equalTo(beiguangzhuBtn.mas_bottom).offset(30);
//            make.bottom.equalTo(self.contentView).offset(-56);
            make.height.equalTo(@(40));
            make.width.equalTo(@(167));
        }];
        
        //set
        backIconBack.backgroundColor = ColorWithHex(0xFFFFFF, 0.5);
        self.btnIcon = btnIcon;
        self.name = name;
        self.guangzhuBtn = guangzhuBtn;
        self.beiguangzhuBtn = beiguangzhuBtn;
        self.one = one;
        self.photo = photo;
        self.name.placeholder = @"暂无昵称";
        btnIcon.tag = icon_loginCell_btnEnum;
        guangzhuBtn.tag = guanzhu_loginCell_btnEnum;
        beiguangzhuBtn.tag = beiguanzhu_loginCell_btnEnum;
        one.tag = fabu_loginCell_btnEnum;
        photo.tag = fabu_loginCell_btnEnum;
        card.tag = card_wishcard_btnEnum;
        
        [guangzhuBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [beiguangzhuBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [one addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [photo addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [card addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        btnIcon.userInteractionEnabled = YES;
        self.one.hidden = YES;
        self.photo.hidden  = YES;

        UITapGestureRecognizer *btnIconTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClick:)];
        [btnIcon addGestureRecognizer:btnIconTap];
        
        line.backgroundColor = ColorWithHex(0xFFFFFF, 0.19);
        name.font = PingFangSC_Medium(18);
        name.textColor = ColorWithHex(0xFFFFFF, 1.0);
        LRViewRadius(btnIcon, 60/2.0);
        LRViewRadius(backIconBack, 64/2.0);
//        LRViewBorder(btnIcon, 2.0, ColorWithHex(0xFFFFFF, 1.0));
        backIcon.image = ImageNamed(@"bgMyDe");
//        [backIcon sd_setImageWithURL:[NSURL URLWithString:@"http://s11.sinaimg.cn/bmiddle/4f0516b944cdb850877ca"]];
        [photo setTitle:@"  发布旅程风景" forState:UIControlStateNormal];
        photo.titleLabel.font = PingFangSC_Regular(12);
        [photo setImage:ImageNamed(@"拍照我的My") forState:UIControlStateNormal];
        [photo setBackgroundColor:ColorWithHex(0xFFFFFF, 1.0)];
        LRViewRadius(photo, 40/2.0);
        [photo setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
        
        [card setImage:ImageNamed(@"心愿卡3") forState:UIControlStateNormal];
        [card setTitle:@"  旅行心愿卡" forState:UIControlStateNormal];
        [card setTitleColor:ColorWithHex(0xFFFFFF, 0.8) forState:UIControlStateNormal];
        card.titleLabel.font = PingFangSC_Regular(12);
        
        photo.hidden = YES;
        one.hidden = YES;
        [one setImage:ImageNamed(@"拍照我的My") forState:UIControlStateNormal];
        one.backgroundColor = [UIColor whiteColor];
        //test
//        photo.backgroundColor = [UIColor redColor];
//        Two.backgroundColor = [UIColor redColor];
//        three.backgroundColor = [UIColor redColor];
//        four.backgroundColor = [UIColor redColor];

    }
    return self;
}

#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.btnClick) {
        self.btnClick(index_loginCell_btnEnum,indexPath.row);
    }
}

#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.date.sharingsA.count+1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.date.sharingsA.count) {
        loginCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([loginCoCell class]) forIndexPath:indexPath];
        cell.onee = self.date.sharingsA[indexPath.row];
        return cell;
    } else {
        loginMoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([loginMoreCell class]) forIndexPath:indexPath];
        myhome *date = [myhome new];
        date.titleStr = @"更多";
        date.iconStr = @"更多";
        cell.date = date;
        return cell;
    }
    return nil;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cgsize;
    if (indexPath.row < self.date.sharingsA.count) {
        cgsize = CGSizeMake(80*WIDTHICON,80*WIDTHICON);
    } else {
        cgsize = CGSizeMake(80*WIDTHICON+15,80*WIDTHICON);
    }
    return  cgsize;
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return  UIEdgeInsetsZero;
//}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 15.0;
}

#pragma  --mark<点击了按钮>
- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(btn.tag,0);
    }
}
#pragma  --mark<点击了照片>
- (void)imageClick:(UIGestureRecognizer *)btn{
    if (self.btnClick) {
        if (btn.view.tag == icon_loginCell_btnEnum) {
            self.btnClick(btn.view.tag,0);
        } else {
            self.btnClick(index_loginCell_btnEnum,btn.view.tag-index_loginCell_btnEnum);
        }
    }
}

#pragma  --mark<设置数据>
- (void)setDate:(myAppInfoS *)date{
    _date = date;
    if (!date) {
        return;
    }

    if (date.sharingsA.count) {
        self.photo.hidden = YES;
        self.one.hidden = NO;
        self.line.hidden = NO;
        self.collectionView.hidden = NO;
        [self.collectionView reloadData];
    } else {
        self.photo.hidden = NO;
        self.one.hidden = YES;
        self.line.hidden = YES;
        self.collectionView.hidden = YES;
    }

    [self.btnIcon  sd_setImageWithURL:[NSURL URLWithString:date.avatar] placeholderImage:ImageNamed(load_fail_head_image)];
    self.name.text = date.nickName;
    
    NSString *str1 ;
    if (![date.followCount hasSuffix:@"关注"]) {
        str1 = [date.followCount stringByAppendingString:@" 关注"];
    } else {
        str1 = date.followCount;
    }
    NSRange range = [str1 rangeOfString:@"关注"];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:str1];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.8),NSForegroundColorAttributeName, nil];
    [attri setAttributes:dic1 range:range];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0xFFFFFF, 1.0),NSForegroundColorAttributeName, nil];
    [attri setAttributes:dic2 range:NSMakeRange(0,range.location)];
    [self.guangzhuBtn setAttributedTitle:attri forState:UIControlStateNormal];
    
    
    NSString *str2 ;
    if (![date.followCount hasSuffix:@"被关注"]) {
        str2 = [date.followerCount stringByAppendingString:@" 被关注"];
    } else {
        str2 = date.followerCount;
    }
//    NSString *str2 =[date.followerCount stringByAppendingString:@" 被关注"];// date.followerCount;
    NSRange range2 = [str2 rangeOfString:@"被关注"];
    NSMutableAttributedString *attri2 = [[NSMutableAttributedString alloc] initWithString:str2];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFFFFFF, 0.8),NSForegroundColorAttributeName, nil];
    [attri2 setAttributes:dic3 range:range2];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0xFFFFFF, 1.0),NSForegroundColorAttributeName, nil];
    [attri2 setAttributes:dic4 range:NSMakeRange(0,range2.location)];
    [self.beiguangzhuBtn setAttributedTitle:attri2 forState:UIControlStateNormal];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat contentOffsetx;
    if (scrollView.contentOffset.x>0) {
        contentOffsetx = scrollView.contentOffset.x;
        if (contentOffsetx>15) {
            contentOffsetx = 15;
        }
    } else {
        contentOffsetx = 0;
    }
    [self.left mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.collectionView.mas_left).offset(contentOffsetx);
        make.width.equalTo(@(15));
        make.top.equalTo(self.collectionView);
        make.bottom.equalTo(self.collectionView);
    }];
}
//icon_loginCell_btnEnum,//点击头像
//guanzhu_loginCell_btnEnum,//点击了关注
//beiguanzhu_loginCell_btnEnum,//点击了被关注
//fabu_loginCell_btnEnum,//点击了发布按钮
//index_loginCell_btnEnum,//点击了照片
@end
