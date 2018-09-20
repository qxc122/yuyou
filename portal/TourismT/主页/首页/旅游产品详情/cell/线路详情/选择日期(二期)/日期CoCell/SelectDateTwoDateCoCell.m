//
//  SelectDateTwoDateCoCell.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectDateTwoDateCoCell.h"
#import "SelectDateTwoDateChildCoCell.h"
#import "NSString+check.h"

@interface SelectDateTwoDateCoCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,weak) UICollectionView *collectionView;
@property (nonatomic,assign) NSInteger weekday; //本月的第一天是 星期几

@end

@implementation SelectDateTwoDateCoCell
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *backTop = [[UIView alloc]init];
        [self.contentView addSubview:backTop];
        
        UILabel *one = [[UILabel alloc]init];
        [self.contentView addSubview:one];
        
        UILabel *Two = [[UILabel alloc]init];
        [self.contentView addSubview:Two];
        
        UILabel *Three = [[UILabel alloc]init];
        [self.contentView addSubview:Three];
        
        UILabel *Four = [[UILabel alloc]init];
        [self.contentView addSubview:Four];
        
        UILabel *Five = [[UILabel alloc]init];
        [self.contentView addSubview:Five];
        
        UILabel *Six = [[UILabel alloc]init];
        [self.contentView addSubview:Six];
        
        UILabel *Seven = [[UILabel alloc]init];
        [self.contentView addSubview:Seven];

        UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc]init];
        flowLayOut.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOut];
        self.collectionView = collectionView;
        collectionView.contentInset = UIEdgeInsetsMake(15, 0, 20, 0);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.showsVerticalScrollIndicator = NO;
        collectionView.showsHorizontalScrollIndicator = NO;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[SelectDateTwoDateChildCoCell class] forCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoDateChildCoCell class])];
        [self.contentView addSubview:collectionView];
        
        [backTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.height.equalTo(@30);
        }];
        
        [one mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
            make.width.equalTo(@[Two,Three,Four,Five,Six,Seven]);
        }];
        [Two mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(one.mas_right);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [Three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Two.mas_right);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [Four mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Three.mas_right);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [Five mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Four.mas_right);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [Six mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Five.mas_right);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [Seven mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(Six.mas_right);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(backTop);
            make.bottom.equalTo(backTop);
        }];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20);
            make.right.equalTo(self.contentView).offset(-20);
            make.top.equalTo(backTop.mas_bottom);
            make.bottom.equalTo(self.contentView);
        }];
        one.textAlignment = NSTextAlignmentCenter;
        Two.textAlignment = NSTextAlignmentCenter;
        Three.textAlignment = NSTextAlignmentCenter;
        Four.textAlignment = NSTextAlignmentCenter;
        Five.textAlignment = NSTextAlignmentCenter;
        Six.textAlignment = NSTextAlignmentCenter;
        Seven.textAlignment = NSTextAlignmentCenter;

        one.text = @"日";
        Two.text = @"一";
        Three.text = @"二";
        Four.text = @"三";
        Five.text = @"四";
        Six.text = @"五";
        Seven.text = @"六";
        backTop.backgroundColor = ColorWithHex(0xF7F7F7, 1.0);
        
        one.font = PingFangSC_Regular(14);
        one.textColor = ColorWithHex(0x000000, 0.4);
        Two.font = PingFangSC_Regular(14);
        Two.textColor = ColorWithHex(0x000000, 0.4);
        Three.font = PingFangSC_Regular(14);
        Three.textColor = ColorWithHex(0x000000, 0.4);
        Four.font = PingFangSC_Regular(14);
        Four.textColor = ColorWithHex(0x000000, 0.4);
        Five.font = PingFangSC_Regular(14);
        Five.textColor = ColorWithHex(0x000000, 0.4);
        Six.font = PingFangSC_Regular(14);
        Six.textColor = ColorWithHex(0x000000, 0.4);
        Seven.font = PingFangSC_Regular(14);
        Seven.textColor = ColorWithHex(0x000000, 0.4);

    }
    return self;
}


#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectDateTwoDateChildCoCell *cell = (SelectDateTwoDateChildCoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (self.ChoiceData) {
        self.ChoiceData(cell.data);
        NSNotification *notification =[NSNotification notificationWithName:ReloadCalendar object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}

#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString *time = self.data.month;
    NSDate *date = [NSDate dateWithYear:[NSString returnYear:time] month:[NSString returnMonth:time] day:1 hour:0 minute:0 second:0];

    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *loaclData = [date dateByAddingTimeInterval:interval];
    self.weekday = loaclData.weekday;
    NSLog(@"date.day=%ld",(long)loaclData.weekday);
    return [NSString howManyDaysInThisYear:[NSString returnYear:time] withMonth:[NSString returnMonth:time]] +  loaclData.weekday -1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelectDateTwoDateChildCoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoDateChildCoCell class]) forIndexPath:indexPath];
//    cell.data = self.data.pricesA[indexPath.row];
    cell.data = nil;
    if (indexPath.row<(self.weekday-1)) {
        cell.hidden = YES;
    }else{
        cell.hidden = NO;
        cell.dataStr = [NSString stringWithFormat:@"%ld",indexPath.row+1-(self.weekday-1)];
        for (pricesS *data in self.data.Arry_monthPrice) {
            NSString *tmp = data.date;
            if (tmp.length>2) {
                tmp = [tmp substringFromIndex:tmp.length-2];
            }
            if ([tmp integerValue] == (indexPath.row-self.weekday+2)) {
                cell.data = data;
                if ([data.date isEqualToString:self.dataDate.date]) {
                    cell.selected = YES;
                } else {
                    cell.selected = NO;
                }
                break;
            }
        }
        if (cell.data) {
            cell.isShowPic = NO;
            if (cell.data.stock > 0) {
                cell.userInteractionEnabled = YES;
                cell.isShowbackImage = YES;
            }else{
                cell.userInteractionEnabled = NO;
                cell.isShowbackImage = NO;
            }
        } else {
            cell.isShowPic = YES;
            cell.isShowbackImage = NO;
            cell.userInteractionEnabled = NO;
        }
    }
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ScreenWidth-20*2-4.3*6)/7.0,48);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{

    return 4.3;
}

- (void)setData:(priceMonthsTwoS *)data{
    _data = data;
    [self.collectionView reloadData];
//    NSArray* indexPaths = [self.collectionView indexPathsForSelectedItems];
//    for (NSIndexPath *path in indexPaths) {
//        [self.collectionView deselectItemAtIndexPath:path animated:NO];
//    }
}


@end
