//
//  homeTwoTypeCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoTypeCell.h"
#import "homeTwoTypeCoCell.h"


@interface homeTwoTypeCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation homeTwoTypeCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    homeTwoTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[homeTwoTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.contentInset = UIEdgeInsetsMake(0, 7.5, 0, 7.5);
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[homeTwoTypeCoCell class] forCellWithReuseIdentifier:NSStringFromClass([homeTwoTypeCoCell class])];
        [self.contentView addSubview:collectionView];

        
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(99+6-45+45*HEIGHTICON));
        }];
    }
    return self;
}


//- (void)setRow:(NSInteger)Row{
//    _Row = Row;
//    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForItem:Row inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
//}

#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.SelectionType && indexPath.row != self.Row) {
//        self.Row = indexPath.row;
        self.SelectionType(indexPath.row);
        homeTwoTypeCoCell *cell =  (homeTwoTypeCoCell *)[collectionView cellForItemAtIndexPath:indexPath];
        cell.isShake = YES;
        cell.selected = YES;
        
        homeTwoTypeCoCell *cellPre =  (homeTwoTypeCoCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.Row inSection:0]];
        cellPre.selected = NO;
        self.Row = indexPath.row;
        NSNotification *notification =[NSNotification notificationWithName:Slide_to_the_top object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}


#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.date.travelThemeListArry.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    homeTwoTypeCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([homeTwoTypeCoCell class]) forIndexPath:indexPath];
    cell.date = self.date.travelThemeListArry[indexPath.row];
    if (indexPath.row == self.Row) {
        cell.selected = YES;
    }else{
        cell.selected = NO;
    }
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth-7.5*2)/4.0,99+6-45+45*HEIGHTICON);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    
    return 0;
}

- (void)setDate:(homeDataV2 *)date{
    if (date) {
        _date = date;
        [self.collectionView reloadData];
    }
}
@end
