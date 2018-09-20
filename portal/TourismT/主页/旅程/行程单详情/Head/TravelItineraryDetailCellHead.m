//
//  TravelItineraryDetailCellHead.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "TravelItineraryDetailCellHead.h"
#import "TravelItineraryDetailCellHeadCoCell.h"


@interface TravelItineraryDetailCellHead ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,assign) NSInteger rowOld;
@property (nonatomic,assign) NSInteger rowNew;
@end


@implementation TravelItineraryDetailCellHead
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.rowNew = 0;
        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[TravelItineraryDetailCellHeadCoCell class] forCellWithReuseIdentifier:NSStringFromClass([TravelItineraryDetailCellHeadCoCell class])];
        [self addSubview:collectionView];

        UIView *line = [[UILabel alloc]init];
        line.backgroundColor = ColorWithHex(0x979797, 0.3);
        [self addSubview:line];
        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(16);
            make.right.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self);
        }];
        
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.height.equalTo(@0.5);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}


#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row != self.rowOld) {
        self.rowNew = indexPath.row;
        [collectionView reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.rowOld inSection:0],indexPath]];
        self.rowOld = indexPath.row;
        
        CGRect cellInCollection = [collectionView convertRect:[collectionView cellForItemAtIndexPath:indexPath].frame toView:collectionView];
        CGRect cellInSuperview = [collectionView convertRect:cellInCollection toView:self];
        if ((cellInSuperview.origin.x + cellInSuperview.size.width) >= (ScreenWidth-16)) {
            NSInteger row = indexPath.row+3;
            if (row>=10) {
                row = 10-1;
            }
            [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }else if (cellInSuperview.origin.x <= 16){
            NSInteger row = indexPath.row-3;
            if (row<0) {
                row = 0;
            }
            [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:row inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
        }
    }
}


#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TravelItineraryDetailCellHeadCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TravelItineraryDetailCellHeadCoCell class]) forIndexPath:indexPath];
    if (indexPath.row == self.rowNew) {
        [cell setSelected:YES];
    } else {
        [cell setSelected:NO];
    }
    
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size;
    if (indexPath.row == self.rowNew) {
        size = CGSizeMake(70,50);
    } else {
        size = CGSizeMake(50,44);
    }
    return size;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 16);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 10;
}
@end
