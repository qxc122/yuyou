//
//  homeTwoTypeListCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoTypeListCell.h"
#import "homeTwoTypeListCocell.h"


@interface homeTwoTypeListCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation homeTwoTypeListCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    homeTwoTypeListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[homeTwoTypeListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
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
//        collectionView.pagingEnabled = YES;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        collectionView.contentInset = UIEdgeInsetsMake(9, 15, 20, 15);
        [collectionView registerClass:[homeTwoTypeListCocell class] forCellWithReuseIdentifier:NSStringFromClass([homeTwoTypeListCocell class])];
        [self.contentView addSubview:collectionView];

        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(335-250+250*HEIGHTICON));
        }];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(returnMyViewController:)
                                                     name:Slide_to_the_top
                                                   object:nil];
    
    }
    return self;
}


- (void)returnMyViewController:(NSNotification *)user{
    if (self.collectionView.contentOffset.x != -15.0) {
        homeDataV2_Type *type = self.date.travelThemeListArry[self.RowType];
        if (type.travels_Arry.count) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
        }
    }
}


#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.SelectionIndex) {
        self.SelectionIndex(indexPath.row);
    }
}
#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.date.travelThemeListArry.count) {
        homeDataV2_Type *type = self.date.travelThemeListArry[self.RowType];
        return type.travels_Arry.count;
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    homeTwoTypeListCocell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([homeTwoTypeListCocell class]) forIndexPath:indexPath];
    homeDataV2_Type *type = self.date.travelThemeListArry[self.RowType];
    cell.date = type.travels_Arry[indexPath.row];
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(180*WIDTHICON,335-250+250*HEIGHTICON-9-20);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
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

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
