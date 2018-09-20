//
//  shareCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "shareCell.h"
#import "shareCoCell.h"


@interface shareCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,weak) UILabel *des;
@property (nonatomic,weak) UIImageView *desimage;

@property (nonatomic,weak) UIView *lineOne;
@property (nonatomic,weak) UILabel *title;
@property (nonatomic,weak) UIView *line;

@end

@implementation shareCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    shareCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[shareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *des = [UILabel new];
        [self.contentView addSubview:des];
        
        UILabel *desHead = [UILabel new];
        [self.contentView addSubview:desHead];
        
        UILabel *desFoot = [UILabel new];
        [self.contentView addSubview:desFoot];
        
        UIImageView *desimage = [UIImageView new];
        [self.contentView addSubview:desimage];
        
        UIView *lineOne = [UIView new];
        [self.contentView addSubview:lineOne];
        
        UILabel *title = [UILabel new];
        [self.contentView addSubview:title];
        
        UIView *line = [UIView new];
        [self.contentView addSubview:line];
        
        
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[shareCoCell class] forCellWithReuseIdentifier:NSStringFromClass([shareCoCell class])];
        [self.contentView addSubview:collectionView];
        collectionView.contentInset = UIEdgeInsetsMake(0, 15, 0, 15);
        [desimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(15);
            make.top.equalTo(self.contentView).offset(18);
            make.height.equalTo(@24);
            make.width.equalTo(@24);
        }];
        
        [desHead mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(desimage.mas_right).offset(10);
            make.centerY.equalTo(desimage);
            make.width.equalTo(@60);
        }];
        [des mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(desHead.mas_right).offset(6);
            make.centerY.equalTo(desimage);
        }];
        
        [desFoot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(des.mas_right).offset(15);
//            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(desimage);
        }];
        [lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(desimage.mas_bottom).offset(18);
            make.height.equalTo(@10);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(lineOne.mas_bottom).offset(17);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(title.mas_bottom).offset(17);
            make.height.equalTo(@0.5);
        }];
        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(line.mas_bottom).offset(15);
            make.bottom.equalTo(self.contentView).offset(-20);
            make.height.equalTo(@(194*HEIGHTICON));
        }];
        
        //set
        title.textAlignment = NSTextAlignmentCenter;
        self.collectionView = collectionView;
        self.des = des;
        self.desimage = desimage;
        self.lineOne = lineOne;
        self.title = title;
        self.line = line;
        des.font = PingFangSC_Medium(14);
        des.textColor = ColorWithHex(0x000000, 0.87);
        desHead.font = PingFangSC_Regular(14);
        desHead.textColor = ColorWithHex(0x000000, 0.87);
        desFoot.font = PingFangSC_Regular(14);
        desFoot.textColor = ColorWithHex(0x000000, 0.87);
        title.font = PingFangSC_Medium(16);
        title.textColor = ColorWithHex(0x000000, 0.87);
        lineOne.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        title.text = @"旅途分享";
        desimage.image = ImageNamed(@"供应商");
        desHead.text = @"本产品由";
        desFoot.text = @"提供";
        //test
    }
    return self;
}

#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.lookSharedUrl) {
        self.lookSharedUrl(self.data.Arry_travelSharings[indexPath.row]);
    }
}

#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.Arry_travelSharings.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    shareCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([shareCoCell class]) forIndexPath:indexPath];
    cell.data = self.data.Arry_travelSharings[indexPath.row];
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = CGSizeMake(240*WIDTHICON,194*HEIGHTICON);
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15*WIDTHICON;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
}

- (void)setData:(tourDetaisData *)data{
    _data = data;
    self.des.text = data.company;
    [self.collectionView reloadData];
}
@end
