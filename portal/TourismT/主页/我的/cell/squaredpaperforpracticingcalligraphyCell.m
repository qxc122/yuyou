//
//  squaredpaperforpracticingcalligraphyCell.m
//  TourismT
//
//  Created by Store on 2017/6/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "squaredpaperforpracticingcalligraphyCell.h"
#import "SqCoCell.h"

@interface squaredpaperforpracticingcalligraphyCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;

@end

@implementation squaredpaperforpracticingcalligraphyCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    squaredpaperforpracticingcalligraphyCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[squaredpaperforpracticingcalligraphyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = ColorWithHex(0xF0F1F5, 1.0);
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        collectionView.scrollEnabled = NO;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.bounces = YES;
        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[SqCoCell class] forCellWithReuseIdentifier:NSStringFromClass([SqCoCell class])];
        [self.contentView addSubview:collectionView];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(85*3+10*3));
        }];
    }
    return self;
}
- (void)setDate:(NSArray *)date{
    _date =date;
    [self.collectionView reloadData];
}
#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.shareORkeep) {
        self.shareORkeep(indexPath);
    }
}

#pragma mark----UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.date.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arry = self.date[section];
    return arry.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SqCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SqCoCell class]) forIndexPath:indexPath];
    NSArray *arry = self.date[indexPath.section];
    cell.date = arry[indexPath.row];
    
    bool top = YES;
    bool bottom = YES;
    bool left = YES;
    bool right = YES;
    bottom = NO;
    if (indexPath.row < 3) {
        top = NO;
    }else{
        top = YES;
    }
    if ((indexPath.row+1) %3 == 1) {
        left = YES;
    }else{
        left = NO;
    }
    if ((indexPath.row+1) == arry.count && arry.count<3) {
        right = NO;
    }else{
        right = YES;
    }
    
    cell.Top = top;
    cell.Bottom = bottom;
    cell.Left = left;
    cell.Right = right;
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cgsize = CGSizeMake(ScreenWidth/3.0,85);
    return cgsize;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(10, 0, 0, 0);
    } else if (section == 1){
        return UIEdgeInsetsMake(10, 0, 10, 0);
    }
    return  UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
@end
