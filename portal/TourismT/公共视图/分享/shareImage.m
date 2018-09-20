//
//  shareImage.m
//  TourismT
//
//  Created by Store on 2017/8/16.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "shareImage.h"

#define dellyshareImage 3

@interface shareImage ()<UIScrollViewDelegate>
@property (nonatomic,weak) UIView *backWhile;

@property (nonatomic,weak) UIScrollView *ScrollView;
@property (nonatomic,weak) UIImageView *capturedImageView;

@property (nonatomic,weak) UIImageView *shareIcon;
@property (nonatomic,weak) UILabel *shareTitle;
@property (nonatomic,weak) UIButton *shareBtn;

@property (nonatomic,weak) UIImageView *Bottom;

@property (nonatomic,strong) NSTimer *scrollTimer;
@property (nonatomic,assign) NSInteger num;
@end


@implementation shareImage

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.close removeFromSuperview];
        [self.back removeFromSuperview];
        [self.blcak removeGestureRecognizer:self.tap];
        
        UIView *backWhile = [UIView new];
        backWhile.backgroundColor = [UIColor whiteColor];
        [self addSubview:backWhile];
        
        UIScrollView *ScrollView = [UIScrollView new];
        [self addSubview:ScrollView];
        
        UIImageView *capturedImageView = [UIImageView new];
        [ScrollView addSubview:capturedImageView];
        
        UIImageView *shareIcon = [UIImageView new];
        [self addSubview:shareIcon];
        
        UILabel *shareTitle = [UILabel new];
        [self addSubview:shareTitle];
        
        UIButton *shareBtn = [UIButton new];
        [self addSubview:shareBtn];
        
        UIImageView *Bottom = [UIImageView new];
        [self addSubview:Bottom];
        
        [backWhile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(192);
            make.right.equalTo(self).offset(-25);
            make.width.equalTo(@(80*WIDTHICON));
            make.height.equalTo(@((235-9)*HEIGHTICON));
        }];
        
        [ScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backWhile).offset(6);
            make.right.equalTo(backWhile).offset(-6);
            make.left.equalTo(backWhile).offset(6);
             make.bottom.equalTo(shareIcon.mas_top).offset(-6);
        }];
        
        [shareIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(backWhile).offset(-9);
            make.left.equalTo(backWhile).offset(15*WIDTHICON);
            make.width.equalTo(@(15));
            make.height.equalTo(@(15));
        }];
        
        [shareTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(shareIcon.mas_right);
            make.right.equalTo(backWhile);
            make.centerY.equalTo(shareIcon);
        }];
        
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(backWhile);
            make.right.equalTo(backWhile);
            make.top.equalTo(ScrollView.mas_bottom);
            make.bottom.equalTo(backWhile);
        }];
        
        [Bottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backWhile.mas_bottom);
            make.centerX.equalTo(backWhile);
            make.width.equalTo(@(18));
            make.height.equalTo(@(9));
        }];
        
        //set
        ScrollView.showsVerticalScrollIndicator = NO;
        ScrollView.delegate = self;
        [shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.num = dellyshareImage;
        self.ScrollView = ScrollView;
        self.capturedImageView = capturedImageView;
        shareTitle.textAlignment = NSTextAlignmentCenter;
        shareTitle.text = @"分享";
        shareTitle.textColor = ColorWithHex(0x000000, 0.54);
        shareTitle.font = PingFangSC_Regular(12);
        IMAGEsetCONTENTMODE(shareIcon);
        shareIcon.image = ImageNamed(@"分享");
        Bottom.image = ImageNamed(@"sanjiao");
    }
    return self;
}
- (void)shareBtnClick{
    if (self.shareImageClick) {
        [self closeClisck];
        self.shareImageClick();
    }
    NSLog(@"%s",__func__);
}
- (void)setCapturedImage:(UIImage *)capturedImage{
    _capturedImage = capturedImage;
    self.capturedImageView.image = capturedImage;
    self.capturedImageView.frame = CGRectMake(0, 0,80*WIDTHICON-12, capturedImage.size.height*(80*WIDTHICON-12.0)/capturedImage.size.width);
    self.ScrollView.contentSize = self.capturedImageView.frame.size;
    [self creatTimer];
}

#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
}
#pragma mark----倒计时
-(void)daojishiRunning{
    self.num--;
    if (self.num <= 0) {
        [self removeTimer];
        [self closeClisck];
    }
}
#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}
- (void)dealloc{
    [self removeTimer];
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
    [self removeTimer];
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%s",__func__);
    [self creatTimer];
}
@end
