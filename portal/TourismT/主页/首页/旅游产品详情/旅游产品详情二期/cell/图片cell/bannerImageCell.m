//
//  bannerImageCell.m
//  TourismT
//
//  Created by Store on 2017/7/27.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "bannerImageCell.h"
#import "SDCycleScrollView.h"
#import "UIImage+cir.h"

@interface bannerImageCell ()<SDCycleScrollViewDelegate>
@property (nonatomic,weak) SDCycleScrollView *cycleScrollView;
@property (nonatomic,weak) UIButton *btn;
@property (nonatomic,weak) UIImageView *btnBack;
@property (nonatomic,weak) UIImageView *animationImages;

@end

@implementation bannerImageCell
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    bannerImageCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[bannerImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        // 网络加载 --- 创建自定义图片的pageControlDot的图片轮播器
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:IMAGE_bigBack]];
        self.cycleScrollView = cycleScrollView;
//        self.cycleScrollView.autoScroll = YES;
//        self.cycleScrollView.infiniteLoop = YES;
        self.cycleScrollView.showPageControl = NO;
        cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:cycleScrollView];
        
        
        UIImageView *btnBack = [[UIImageView alloc]init];
        self.btnBack = btnBack;
        btnBack.image = [UIImage imageWithColor:ColorWithHex(0x000000, 0.19)];
        btnBack.highlightedImage = [UIImage imageWithColor:[UIColor clearColor]];
        [self.contentView addSubview:btnBack];
        
        UIButton *btn = [[UIButton alloc]init];
        self.btn = btn;
        [self.contentView addSubview:btn];
//        [btn setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x000000, 0.19)] forState:UIControlStateNormal];
        [btn setImage:ImageNamed(@"上拉") forState:UIControlStateNormal];
        
//        [btn setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateSelected];
//        [btn setImage:ImageNamed(@"下拉") forState:UIControlStateSelected];
        [btn setImage:[UIImage imageWithColor:[UIColor clearColor]] forState:UIControlStateSelected];
        
        UIImageView *animationImages = [[UIImageView alloc]init];
        self.animationImages = animationImages;
        [self.contentView addSubview:animationImages];
        
        [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.top.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(ScreenHeight));
        }];

        [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(0);
            make.height.equalTo(@(60));
        }];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btnBack);
            make.centerY.equalTo(btnBack);
            make.width.equalTo(@40);
            make.height.equalTo(@(40));
        }];
        [animationImages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(self.contentView);
            make.width.equalTo(@(184*0.5*0.8));
            make.height.equalTo(@(128*0.5*0.8));
        }];
        
        
        [self configMainImageView];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //test
//        self.cycleScrollView.imageURLStringsGroup = @[@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg",@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg",@"http://i2.hdslb.com/bfs/archive/1ddac73202add4a689620fa62cbfb28461b2069f.jpg"];
    }
    return self;
}

// 配置imageview的序列帧动画属性
- (void)configMainImageView {
    self.animationImages.animationImages = @[ImageNamed(@"合成 2_00001"),ImageNamed(@"合成 2_00002"),ImageNamed(@"合成 2_00004"),ImageNamed(@"合成 2_00008"),ImageNamed(@"合成 2_00010"),ImageNamed(@"合成 2_00011"),ImageNamed(@"合成 2_00012"),ImageNamed(@"合成 2_00013")];
    self.animationImages.animationDuration = 2.f;// 序列帧全部播放完所用时间
    self.animationImages.animationRepeatCount = 1000000;// 序列帧动画重复次数
    [self.animationImages startAnimating];//开始动画
    [self performSelector:@selector(clearAinimationImageMemory) withObject:nil afterDelay:9.f];// 性能优化的重点来了，此处我在执行完序列帧以后我执行了一个清除内存的操作
}
// 清除animationImages所占用内存
- (void)clearAinimationImageMemory {
    [self.animationImages stopAnimating];
    self.animationImages.animationImages = nil;
}


- (void)btnClick:(UIButton *)btn{
    if (self.btnClick) {
        self.btnClick(self.btn.selected?Top_bannerImageCell:Bottom_bannerImageCell);
    }
}
- (void)setArryA:(NSArray *)arryA{
    _arryA = arryA;
    NSMutableArray *muarry = [NSMutableArray array];
    for (ImageS *image in arryA) {
        [muarry addObject:image.fullUrl];
    }
    self.cycleScrollView.imageURLStringsGroup = muarry;
}
//#pragma SDCycleScrollViewDelegate /** 点击图片回调 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//    NSLog(@"index=%ld",index);
//    if (self.clickIndex) {
//        self.clickIndex(index);
//    }
//}
- (void)setIsSelecetForBtn:(BOOL)isSelecetForBtn{
    _isSelecetForBtn = isSelecetForBtn;
    self.btn.selected = isSelecetForBtn;
    self.btnBack.highlighted = isSelecetForBtn;
    self.btnBack.hidden = isSelecetForBtn;
}
@end
