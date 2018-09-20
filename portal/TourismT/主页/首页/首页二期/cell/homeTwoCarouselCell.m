//
//  homeTwoCarouselCell.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwoCarouselCell.h"
#import "SDCycleScrollView.h"


@interface homeTwoCarouselCell ()<SDCycleScrollViewDelegate>
@property (nonatomic,weak) SDCycleScrollView *cycleScrollView;
@property (nonatomic,weak) UILabel *num;
@end

@implementation homeTwoCarouselCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    homeTwoCarouselCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[homeTwoCarouselCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:IMAGE_bigBack]];
        self.cycleScrollView = cycleScrollView;
        self.cycleScrollView.autoScroll = YES;
        self.cycleScrollView.infiniteLoop = YES;
        self.cycleScrollView.showPageControl = NO;
        [self.contentView addSubview:cycleScrollView];
        
        UILabel *num = [UILabel new];
        [self.contentView addSubview:num];
        
        [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@(HeightCarousel));
        }];
        
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.bottom.equalTo(self.contentView).offset(-15);
        }];
        
        self.num = num;
        self.cycleScrollView = cycleScrollView;
        num.font = PingFangSC_Regular(10);
        num.textColor = ColorWithHex(0xFFFFFF, 1.0);
        //test
//        num.text = @"1";
//        self.cycleScrollView.imageURLStringsGroup = @[@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg",@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg",@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg"];
    }
    return self;
}
- (void)setDate:(homeDataV2 *)date{
    if (date) {
        _date = date;
        
        NSMutableArray *muarry = [NSMutableArray array];
        for (ads_one *one in self.date.adsArry) {
            if (one.path) {
                [muarry addObject:one.path];
            }
        }
        self.cycleScrollView.imageURLStringsGroup = muarry;
    }
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    self.num.text =[NSString stringWithFormat:@"%ld / %lu",(long)index+1,(unsigned long)self.date.adsArry.count];
}
//- (void)btnClick:(UIButton *)btn{
//    if (self.btnClick) {
//        self.btnClick(self.btn.selected?Top_bannerImageCell:Bottom_bannerImageCell);
//    }
//}
//- (void)setArryA:(NSArray *)arryA{
//    _arryA = arryA;
//    NSMutableArray *muarry = [NSMutableArray array];
//    for (ImageS *image in arryA) {
//        [muarry addObject:image.fullUrl];
//    }
//    self.cycleScrollView.imageURLStringsGroup = muarry;
//}
#pragma SDCycleScrollViewDelegate /** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"index=%ld",index);
    if (self.SelectionIndex) {
        self.SelectionIndex(self.date.adsArry[index]);
    }
}
@end
