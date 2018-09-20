//
//  SelectDateTwo.m
//  TourismT
//
//  Created by Store on 2017/7/26.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectDateTwo.h"
#import "UIImage+cir.h"
#import "SelectDateTwoTypeCoCell.h"
#import "SelectDateTwoMonthCoCell.h"
#import "SelectDateTwoDateCoCell.h"
#import "NSString+check.h"

typedef NS_ENUM(NSInteger, collectionView_type)
{
    type_collectionView_type,// 类型
    Month_collectionView_type,// 月份
    Date_collectionView_type,// 具体天数
};

@interface SelectDateTwo ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (nonatomic,weak) UICollectionView *collectionViewtype;
@property (nonatomic,weak) UICollectionView *collectionViewMonth;
@property (nonatomic,weak) UICollectionView *collectionViewDate;

@property (nonatomic,weak) UIButton *closeBtn;
@property (nonatomic,weak) UILabel *titletype;
@property (nonatomic,weak) UIView *lineTop;
@property (nonatomic,weak) UILabel *titleMonth;
@property (nonatomic,weak) UIButton *NextBtn;


@end

@implementation SelectDateTwo

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.type = 0;
//        self.Month = 0;
        
        self.close.hidden = YES;
        LRViewRadius(self.back, 0.0);
        [self.blcak removeGestureRecognizer:self.tap];
        
        UIButton *NextBtn = [UIButton new];
        [self addSubview:NextBtn];
        
        UICollectionViewFlowLayout *flowLayOutDate = [[UICollectionViewFlowLayout alloc]init];
        flowLayOutDate.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionViewDate = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOutDate];
        self.collectionViewDate = collectionViewDate;
        collectionViewDate.dataSource = self;
        collectionViewDate.delegate = self;
        collectionViewDate.pagingEnabled = YES;
        collectionViewDate.showsVerticalScrollIndicator = NO;
        collectionViewDate.showsHorizontalScrollIndicator = NO;
        collectionViewDate.backgroundColor = [UIColor clearColor];
        [collectionViewDate registerClass:[SelectDateTwoDateCoCell class] forCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoDateCoCell class])];
        [self addSubview:collectionViewDate];
        
        UICollectionViewFlowLayout *flowLayOutMonth = [[UICollectionViewFlowLayout alloc]init];
        flowLayOutMonth.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionViewMonth = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOutMonth];
        self.collectionViewMonth = collectionViewMonth;
        collectionViewMonth.dataSource = self;
        collectionViewMonth.delegate = self;
        collectionViewMonth.showsVerticalScrollIndicator = NO;
        collectionViewMonth.showsHorizontalScrollIndicator = NO;
        collectionViewMonth.backgroundColor = [UIColor clearColor];
        [collectionViewMonth registerClass:[SelectDateTwoMonthCoCell class] forCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoMonthCoCell class])];
        [self addSubview:collectionViewMonth];
        
        UILabel *titleMonth = [UILabel new];
        [self addSubview:titleMonth];
        
        UIView *lineTop = [UIView new];
        [self addSubview:lineTop];
        
        UICollectionViewFlowLayout *flowLayOuttype = [[UICollectionViewFlowLayout alloc]init];
        flowLayOuttype.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        UICollectionView *collectionViewtype = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayOuttype];
        self.collectionViewtype = collectionViewtype;
        collectionViewtype.dataSource = self;
        collectionViewtype.delegate = self;
        collectionViewtype.showsVerticalScrollIndicator = NO;
        collectionViewtype.showsHorizontalScrollIndicator = NO;
        collectionViewtype.backgroundColor = [UIColor clearColor];
        [collectionViewtype registerClass:[SelectDateTwoTypeCoCell class] forCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoTypeCoCell class])];
        [self addSubview:collectionViewtype];
        
        UILabel *titletype = [UILabel new];
        [self addSubview:titletype];
        
        UIButton *closeBtn = [UIButton new];
        [self addSubview:closeBtn];

        [NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.equalTo(@50);
        }];
        [collectionViewDate mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(NextBtn.mas_top);
//            make.height.equalTo(@(294+30));
        }];
        [collectionViewMonth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(collectionViewDate.mas_top);
            make.height.equalTo(@(12+12+14));
        }];
        [titleMonth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(collectionViewMonth.mas_top).offset(-21.5+12);
            make.height.equalTo(@(14));
        }];
        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(titleMonth.mas_top).offset(-20);
            make.height.equalTo(@(0.5));
        }];
        [collectionViewtype mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(lineTop.mas_top).offset(-20);
            make.height.equalTo(@(32));
        }];
        [titletype mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.bottom.equalTo(collectionViewtype.mas_top).offset(-13);
            make.height.equalTo(@(14));
        }];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-6);
            make.centerY.equalTo(titletype);
            make.width.equalTo(@(40));
            make.height.equalTo(@(40));
        }];
        
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.top.equalTo(titletype.mas_top).offset(-20);
        }];
        
        //set
        self.closeBtn = closeBtn;
        self.titletype = titletype;
        self.lineTop = lineTop;
        self.titleMonth = titleMonth;
        self.NextBtn = NextBtn;
        
        self.collectionViewDate.tag = Date_collectionView_type;
        self.collectionViewMonth.tag = Month_collectionView_type;
        self.collectionViewtype.tag = type_collectionView_type;
        
        [self.NextBtn addTarget:self action:@selector(NextBtnClisck) forControlEvents:UIControlEventTouchUpInside];
        [self.NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [self.NextBtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        [self.NextBtn setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0xFB704B, 1.0)] forState:UIControlStateNormal];
        self.NextBtn.titleLabel.font = PingFangSC_Regular(17);
        [self.closeBtn setImage:ImageNamed(@"删除s") forState:UIControlStateNormal];
        self.lineTop.backgroundColor = ColorWithHex(0x979797, 0.3);
        
        [self.closeBtn setImage:ImageNamed(@"删除s") forState:UIControlStateNormal];
        [self.closeBtn addTarget:self action:@selector(CloseViewBtn) forControlEvents:UIControlEventTouchUpInside];
        
        self.titletype.font = PingFangSC_Regular(14);
        self.titletype.textColor = ColorWithHex(0x000000, 0.87);
        self.titleMonth.font = PingFangSC_Regular(14);
        self.titleMonth.textColor = ColorWithHex(0x000000, 0.87);
        
        self.titletype.text = @"产品类型";
        self.titleMonth.text = @"出发日期";
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(ReloadCalendarFunc:)
                                                     name:ReloadCalendar
                                                   object:nil];
        
    
        //test
//        [collectionViewDate mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self);
//            make.right.equalTo(self);
//            make.bottom.equalTo(NextBtn.mas_top);
//            make.height.equalTo(@(294+30));
//        }];
    }
    return self;
}
- (void)CloseViewBtn{
    if (self.CloseView) {
        self.CloseView();
    }
}


- (void)ReloadCalendarFunc:(NSNotification *)user{
    [self.collectionViewDate reloadData];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark--<点击了cell>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView.tag == type_collectionView_type) {
        if (indexPath.row != self.type) {
            self.type = indexPath.row;
            self.dataDate = nil;
            [self.collectionViewtype reloadData];
            [self.collectionViewMonth reloadData];
            [self.collectionViewDate reloadData];
        }
    } else if (collectionView.tag == Month_collectionView_type) {
        if (indexPath.row != self.Month) {
            self.Month = indexPath.row;
            [self.collectionViewMonth reloadData];
            [self.collectionViewDate  scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
//            [self.collectionViewDate reloadData];
        }
    } else if (collectionView.tag == Date_collectionView_type) {
         [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    }
}

- (void)CalculatedHeight{
    tourDetaisData_Specifications *dataType = self.data.Arry_initiateMonthPrice[self.type];
    priceMonthsS *dataOne = dataType.Arry_monthPrice[self.Month];
    NSString *time = dataOne.month;
    NSDate *date = [NSDate dateWithYear:[NSString returnYear:time] month:[NSString returnMonth:time] day:1 hour:0 minute:0 second:0];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *loaclData = [date dateByAddingTimeInterval:interval];
    
    NSLog(@"date.day=%ld",(long)loaclData.weekday);
    NSInteger all = [NSString howManyDaysInThisYear:[NSString returnYear:time] withMonth:[NSString returnMonth:time]] +  loaclData.weekday -1;
    NSInteger allSec = all/7 + ((all%7)?1:0);
    
//    154.5
    CGFloat heightDate = allSec*48.0+(allSec-1)*5.0+30.0+15+20;
    if ((ScreenHeight - heightDate - 154.5) <112) {
        [self.collectionViewDate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.NextBtn.mas_top);
        }];
        [self.back mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.top.equalTo(self.titletype.mas_top).offset(-20);
            make.height.equalTo(@(ScreenHeight-112));
        }];
    } else {
        [self.collectionViewDate mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self.NextBtn.mas_top);
            make.height.equalTo(@(heightDate));
        }];
    }
}


#pragma mark----UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView.tag == type_collectionView_type) {
        return  self.data.Arry_initiateMonthPrice.count;
    } else if (collectionView.tag == Month_collectionView_type) {
        tourDetaisData_Specifications *tmp = self.data.Arry_initiateMonthPrice[self.type];
        return  tmp.Arry_monthPrice.count;
    } else if (collectionView.tag == Date_collectionView_type) {
        tourDetaisData_Specifications *tmp = self.data.Arry_initiateMonthPrice[self.type];
        return  tmp.Arry_monthPrice.count;
    }
    return 1;
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView.tag == Month_collectionView_type) {
        [self CalculatedHeight];
    }
    if (collectionView.tag == Date_collectionView_type) {
        NSIndexPath *path =[self.collectionViewDate indexPathForItemAtPoint:self.collectionViewDate.contentOffset];
        if (path.row != self.Month) {
            [self.collectionViewDate scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.Month inSection:indexPath.section] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        }
    }
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    NSInteger tmp = 0;
    if (collectionView.tag == type_collectionView_type) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoTypeCoCell class]) forIndexPath:indexPath];
        tourDetaisData_Specifications *data =self.data.Arry_initiateMonthPrice[indexPath.row];
        [cell setValue:data forKey:@"data"];
        tmp = self.type;
    } else if (collectionView.tag == Month_collectionView_type) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoMonthCoCell class]) forIndexPath:indexPath];
        tourDetaisData_Specifications *dataType =self.data.Arry_initiateMonthPrice[self.type];
        priceMonthsS *data =dataType.Arry_monthPrice[indexPath.row];
        [cell setValue:data forKey:@"data"];
        tmp = self.Month;
    } else if (collectionView.tag == Date_collectionView_type) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SelectDateTwoDateCoCell class]) forIndexPath:indexPath];
        tourDetaisData_Specifications *dataType =self.data.Arry_initiateMonthPrice[self.type];
        priceMonthsS *data =dataType.Arry_monthPrice[indexPath.row];
        [cell setValue:data forKey:@"data"];
        SelectDateTwoDateCoCell *tmpCell = (SelectDateTwoDateCoCell *)cell;
        tmpCell.dataDate = self.dataDate;
        kWeakSelf(self);
        tmpCell.ChoiceData = ^(pricesS *data) {
                weakself.dataDate = data;
            NSLog(@"选中了日期data=%@",data.date);
        };
    }
    if (collectionView.tag != Date_collectionView_type) {
        if (tmp == indexPath.row) {
            cell.selected = YES;
        }else{
            cell.selected = NO;
        }
    }
    return cell;
}
#pragma mark----UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize cgsize;
    if (collectionView.tag == type_collectionView_type) {
        tourDetaisData_Specifications *data =self.data.Arry_initiateMonthPrice[indexPath.row];
        CGFloat width = [NSString WidthForText:data.name withFont:PingFangSC_Regular(14)];
        width += 15;
        cgsize = CGSizeMake(width,CGRectGetHeight(collectionView.frame));
    } else if (collectionView.tag == Month_collectionView_type) {
        cgsize = CGSizeMake(60,CGRectGetHeight(collectionView.frame));
    } else {
        cgsize = CGSizeMake(ScreenWidth,CGRectGetHeight(collectionView.frame));
//        cgsize = CGSizeMake((ScreenWidth-20*2-4.3*6)/7.0,48);
    }
    return cgsize;
}
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
////    if (collectionView.tag == type_collectionView_type) {
////        
////    } else if (collectionView.tag == Month_collectionView_type) {
////        
////    } else if (collectionView.tag == Date_collectionView_type) {
////        
////    }
////    return  UIEdgeInsetsMake(0, 7.5, 0, 7.5);
//    return UIEdgeInsetsZero;
//}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (collectionView.tag == type_collectionView_type) {
        return 15;
    } else if (collectionView.tag == Month_collectionView_type) {
        return 30;
    } else if (collectionView.tag == Date_collectionView_type) {
        return 0;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (collectionView.tag == type_collectionView_type) {
        return 15;
    } else if (collectionView.tag == Month_collectionView_type) {
        return 30;
    } else if (collectionView.tag == Date_collectionView_type) {
        return 0;
    }
    return 0;
}

- (void)setData:(tourDetaisData *)data{
    _data = data;
    [self.collectionViewtype reloadData];
    [self.collectionViewMonth reloadData];
    [self.collectionViewDate reloadData];
}

- (void)NextBtnClisck{
    if (self.NextBtnClisckBlock) {
        if (self.dataDate) {
            [self closeClisck];
            self.NextBtnClisckBlock(self.type,self.Month,self.dataDate);
        }else{
            [MBProgressHUD showPrompt:@"请先选择日期"];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == Date_collectionView_type) {
        NSLog(@"sdf");
        CGFloat x_offset = scrollView.contentOffset.x;
        if (x_offset>0) {
            NSInteger index_month = x_offset/ScreenWidth;
            self.Month = index_month;
            [self.collectionViewMonth selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.Month inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
        }
    }
}
@end
