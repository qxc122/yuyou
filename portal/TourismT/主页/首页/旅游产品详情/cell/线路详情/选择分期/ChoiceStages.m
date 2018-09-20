//
//  ChoiceStages.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "ChoiceStages.h"
#import "ChoiceStageCell.h"
#import "UIImage+cir.h"
#import "TTTAttributedLabel.h"
#import "NSString+check.h"
@interface ChoiceStages ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,TTTAttributedLabelDelegate>

@property (nonatomic,weak) UICollectionView *collectionView;

@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UILabel *titleTwo;
@property (nonatomic,weak) UIButton *closeBtn;
@property (nonatomic,weak) UIView *lineTop;

@property (nonatomic,weak) UILabel *collectionViewTitle;
@property (nonatomic,weak) UIView *lineBottom;

@property (nonatomic,weak) TTTAttributedLabel *xieyi;
@property (nonatomic,strong) NSString *strAll;

@property (nonatomic,weak) UIButton *okBtn;

@property (nonatomic,strong) NSIndexPath *Selectedpath; //选中的分期数
@end


@implementation ChoiceStages

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.close.hidden = YES;
        LRViewRadius(self.back, 0.0);
        [self.blcak removeGestureRecognizer:self.tap];
        
        UILabel *title = [UILabel new];
        [self addSubview:title];
        
        UILabel *titleTwo = [UILabel new];
        [self addSubview:titleTwo];
        
        UIButton *closeBtn = [UIButton new];
        [self addSubview:closeBtn];
        
        UIView *lineTop = [UIView new];
        [self addSubview:lineTop];
        
        UILabel *collectionViewTitle = [UILabel new];
        [self addSubview:collectionViewTitle];
        
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        //        collectionView.scrollEnabled = NO;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.bounces = YES;
//        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[ChoiceStageCell class] forCellWithReuseIdentifier:NSStringFromClass([ChoiceStageCell class])];
        [self addSubview:collectionView];
        
        UIView *lineBottom = [UIView new];
        [self addSubview:lineBottom];
        
        TTTAttributedLabel *xieyi = [TTTAttributedLabel new];
        [self addSubview:xieyi];
        
        UIButton *okBtn = [UIButton new];
        [self addSubview:okBtn];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20);
            make.top.equalTo(self.back).offset(23);
            make.height.equalTo(@14);
        }];
        [titleTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title.mas_right).offset(10);
            make.centerY.equalTo(title);
            make.height.equalTo(@14);
        }];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(title);
            make.right.equalTo(self.back).offset(-6);
            make.width.equalTo(@40);
            make.height.equalTo(@40);
        }];
        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.height.equalTo(@0.5);
            make.top.equalTo(title.mas_bottom).offset(23);
        }];
        [collectionViewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(title);
            make.top.equalTo(lineTop.mas_bottom).offset(12);
            make.height.equalTo(@14);
        }];
        
        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20-7.5);
            make.right.equalTo(self.back).offset(7.5-20);
            make.top.equalTo(collectionViewTitle.mas_bottom).offset(12);
            make.height.equalTo(@100);
        }];
        
        [lineBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.height.equalTo(@0.5);
            make.top.equalTo(collectionView.mas_bottom).offset(8);
        }];
        [xieyi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back).offset(20);
            make.right.equalTo(self.back).offset(-20);
            make.top.equalTo(lineBottom.mas_bottom).offset(24);
        }];
        [okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.back);
            make.right.equalTo(self.back);
            make.top.equalTo(xieyi.mas_bottom).offset(24);
            make.bottom.equalTo(self.back);
            make.height.equalTo(@50);
        }];
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
//                        make.top.equalTo(self).offset(153*HEIGHTICON);
//            make.top.equalTo(self.title).offset(-20);
        }];
        //set
        collectionView.contentInset =  UIEdgeInsetsMake(12, 0, 12, 0);
        self.title = title;
        self.titleTwo = titleTwo;
        self.closeBtn = closeBtn;
        self.lineTop = lineTop;
        self.collectionViewTitle = collectionViewTitle;
        self.lineBottom = lineBottom;
        self.xieyi = xieyi;
        self.okBtn = okBtn;
        
        self.title.font = PingFangSC_Regular(14);
        self.titleTwo.font = PingFangSC_Regular(16);
        self.collectionViewTitle.font = PingFangSC_Regular(14);
//        self.xieyi.font = PingFangSC_Regular(11);
        
        self.title.textColor = ColorWithHex(0x000000, 0.87);
        self.titleTwo.textColor = ColorWithHex(0xFB704B, 1.0);
        self.collectionViewTitle.textColor = ColorWithHex(0x000000, 0.87);
//        self.xieyi.textColor = ColorWithHex(0x000000, 0.54);
        

        [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.okBtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
//        self.okBtn.backgroundColor = ColorWithHex(0xFB704B, 1.0);
        [self.okBtn setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0xFB704B, 1.0)] forState:UIControlStateNormal];
        self.okBtn.titleLabel.font = PingFangSC_Regular(17);
        
        [self.closeBtn setImage:ImageNamed(@"删除s") forState:UIControlStateNormal];
        self.lineTop.backgroundColor = ColorWithHex(0x979797, 0.3);
        self.lineBottom.backgroundColor = ColorWithHex(0x979797, 0.3);
        
        self.title.text = @"商品单价";
//        self.titleTwo.text = [NSString stringWithFormat:@"¥%@",self.data.travel.minPeriodPrice];
        self.collectionViewTitle.text = @"分期期数";
        
        [self.okBtn addTarget:self action:@selector(okBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.closeBtn addTarget:self action:@selector(CloseViewBtn) forControlEvents:UIControlEventTouchUpInside];

        xieyi.numberOfLines = 0;
        xieyi.delegate = self;
        
        //链接正常状态文本属性
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0x000000, 0.54),NSForegroundColorAttributeName, nil];
        self.xieyi.linkAttributes = dic1;
        self.xieyi.activeLinkAttributes = dic1;
    }
    return self;
}

- (void)CloseViewBtn{
    if (self.CloseView) {
        self.CloseView();
    }
}

- (void)okBtnClick{
    NSLog(@"%s",__func__);
    if (self.Selectedpath) {
        if (self.ClickOKBtn) {
            self.ClickOKBtn(self.dateList.Arry_periodTypeList[self.Selectedpath.row]);
            [self closeClisck];
        }
    }else{
        [MBProgressHUD showPrompt:NSLocalizedString(@"Pleaseinstallments", @"Pleaseinstallments")];
    }
}


- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    NSLog(@"url=%@",url);
    if (url && self.goToViewXieYi) {
        self.goToViewXieYi(url);
    }
}

#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.Selectedpath.row != indexPath.row) {
        ChoiceStageCell *cell = (ChoiceStageCell *)[collectionView cellForItemAtIndexPath:self.Selectedpath];
        cell.selected = NO;
    }
    self.Selectedpath = indexPath;
}

#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dateList.Arry_periodTypeList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ChoiceStageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ChoiceStageCell class]) forIndexPath:indexPath];
    cell.data = self.dateList.Arry_periodTypeList[indexPath.row];
    if (self.Selectedpath.row == indexPath.row) {
        cell.selected = YES;
    } else {
        cell.selected = NO;
    }
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cgsize = CGSizeMake((ScreenWidth-15-40)*0.5,45);
    return cgsize;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(0, 7.5, 0, 7.5);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 11;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
/*
- (void)setData:(tourDetaisData *)data{
    _data = data;
    NSString *tmp = self.data.travel.price;
    if (tmp && tmp.length) {
        if (![tmp hasPrefix:@"￥"] && ![tmp hasPrefix:@"¥"] ) {
            tmp = [@"¥" stringByAppendingString:self.data.travel.price];
        }
        self.titleTwo.text = tmp;
    }
}
 */
- (void)setDayData:(pricesS *)dayData{
    _dayData = dayData;
    self.titleTwo.text = [NSString stringWithFormat:@"¥%@",dayData.price];
}
- (void)setDateList:(ChoiceStages_data *)dateList{
    _dateList = dateList;
    self.Selectedpath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.collectionView reloadData];
    
    NSString *strAll = @"";
    for (agreementS *tmp in dateList.Arry_agreement) {
        strAll = [strAll stringByAppendingString:tmp.name];
    }
    if (![strAll hasPrefix:@"我已阅读并同意"]) {
        strAll = [@"我已阅读并同意" stringByAppendingString:strAll];
    }
    self.strAll = strAll;
    
    [self.xieyi setText:strAll afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        return mutableAttributedString;
    }];
    
    for (agreementS *three in dateList.Arry_agreement) {
        NSRange fontRange = [strAll rangeOfString:three.name];
        [self.xieyi addLinkToURL:[NSURL URLWithString:three.url]
                     withRange:fontRange];
    }
    NSRange fontRange = [strAll rangeOfString:@"我已阅读并同意"];
    [self.xieyi addLinkToURL:nil withRange:fontRange];
    [self CalculatedHeight];
}


- (void)CalculatedHeight{
    NSInteger row = self.dateList.Arry_periodTypeList.count/2 +  ((self.dateList.Arry_periodTypeList.count%2==0)?0:1);
    CGFloat ColoHeight = row * (45.0+11.0) -11.0 +12.0+12.0;

    CGFloat heightBasic = 185;
    
    CGFloat heightXieyi = [NSString HeightForText:self.strAll withFont:PingFangSC_Regular(12) withTextWidth:ScreenWidth-40];
    if ((ScreenHeight - ColoHeight - heightBasic - heightXieyi) <112) {
        ColoHeight = ScreenHeight - 112 - heightXieyi - heightBasic;
    }
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.back).offset(20-7.5);
        make.right.equalTo(self.back).offset(7.5-20);
        make.top.equalTo(self.collectionViewTitle.mas_bottom).offset(12);
        make.height.equalTo(@(ColoHeight));
    }];
}
@end
