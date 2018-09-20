//
//  MZGuidePages.m
//  MZGuidePages
//
//  Created by boco on 15/11/13.
//  Copyright © 2015年 Machelle. All rights reserved.
//

#import "MZGuidePages.h"
#import "PageControl.h"
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define WIDTH_Cir 8.f
#define spaceing_Cir 8.f
#define WIDTH_MAXCir 10.f
#define hiden_tag 8
@interface MZGuidePages () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
//@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *actionButton;
//@property (nonatomic, assign) NSInteger index;

@property (nonatomic, weak) PageControl *pageCon;
@end

@implementation MZGuidePages

// init
- (instancetype)init
{
    return [self initWithImageDatas:nil completion:nil];
}

// init with imageDatas and completion
- (instancetype)initWithImageDatas:(NSArray *)imageDatas completion:(void (^)(void))buttonAction
{
    self = [super init];
    if (self)
    {
        [self initView];
        //因为使用了懒加载，_imageDatas = imageDatas不会调用initContentView
        [self setImageDatas:imageDatas];
        _buttonAction = buttonAction;
    }
    return self;
}

//懒加载，并初始化内容
- (void)setImageDatas:(NSArray *)imageDatas
{
    _imageDatas = imageDatas;
    [self initContentView];
}

//基础视图初始化
- (void)initView
{
    // init view
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

    // init scrollView
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    // init pageControl
//    _pageControl =
//        [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 30, SCREEN_WIDTH, 10)];
//    _pageControl.currentPage = 0;
//    _pageControl.hidesForSinglePage = YES;
//    _pageControl.pageIndicatorTintColor = [UIColor grayColor];
//    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
//    [self addSubview:_pageControl];

    // init button
    _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIButton *SkipBoot = [UIButton new];
    [self addSubview:SkipBoot];
    [SkipBoot mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-21+11);
        make.top.equalTo(self).offset(40-11);
        make.width.equalTo(@44);
        make.height.equalTo(@44);
    }];
    [SkipBoot setImage:ImageNamed(@"-g-skip") forState:UIControlStateNormal];
//    SkipBoot.layer.cornerRadius = cornerRadius_width;
//    SkipBoot.layer.masksToBounds = YES;
//    SkipBoot.layer.borderWidth = 0.5;
//    SkipBoot.layer.borderColor = ColorWithHex(0x779CF, 1.0).CGColor;
//    [SkipBoot setTitle:@"跳过" forState:UIControlStateNormal];
//    [SkipBoot setTitleColor:ColorWithHex(0x7692F3, 1.0) forState:UIControlStateNormal];
//    SkipBoot.titleLabel.font = PingFangSC_Regular(12);
    [SkipBoot addTarget:self action:@selector(SkipBootBtn) forControlEvents:UIControlEventTouchUpInside];
}
- (void)SkipBootBtn{
    kWeakSelf(self);
    [UIView animateWithDuration:1.0f
                     animations:^{
                         weakself.alpha = 0.0;
                     }
                     completion:^(BOOL finished) {
                         [weakself removeFromSuperview];
                     }];
    
    [self sendTongzhi];
}
//指定数据后，初始化显示内容
- (void)initContentView
{
    if (_imageDatas.count)
    {
        PageControl *pageCon = [[PageControl alloc]initWithFrame:CGRectMake((ScreenWidth-14 * (_imageDatas.count + 1))*0.5, ScreenHeight-25*HEIGHTICON-6, 14 * (_imageDatas.count + 1), 6) andDotCount:_imageDatas.count];
        self.pageCon = pageCon;
        [self addSubview:pageCon];
        pageCon.backgroundColor = [UIColor clearColor];
//        pageCon.normalDotColor = ColorWithHex(0xFFFFFF, 0.5);
//        pageCon.selectedDotColor = ColorWithHex(0xFFFFFF, 0.8);
//        [pageCon mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(self);
//            make.bottom.equalTo(self).offset(-25);
//            make.width.equalTo(self).offset(100);
//            make.height.equalTo(self).offset(6);
//        }];
//        _pageControl.numberOfPages = _imageDatas.count;
        
        CGFloat first_pointx;
        if (_imageDatas.count%2 == 0) {
            first_pointx = ScreenWidth/2.0-(_imageDatas.count)/2.0*(spaceing_Cir+WIDTH_Cir)+spaceing_Cir;
        }else{
            first_pointx = ScreenWidth/2.0-WIDTH_Cir/2.0-(_imageDatas.count-1)/2.0*(spaceing_Cir+WIDTH_Cir)+spaceing_Cir;
        }
        
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * _imageDatas.count, SCREEN_HEIGHT);
        
        for (int i = 0; i < _imageDatas.count; i++)
        {
        
            /*
            UIView *viewCir = [[UIView alloc]init];
            viewCir.tag = hiden_tag+i;
            viewCir.frame = CGRectMake(first_pointx + i*(spaceing_Cir+WIDTH_Cir), SCREEN_HEIGHT - 50 - 35 +(50-WIDTH_Cir)/2.0, WIDTH_Cir, WIDTH_Cir);
            [self addSubview:viewCir];
            viewCir.backgroundColor = ColorWithHex(0x80A7F8, 0.2);
            LRViewRadius(viewCir, WIDTH_Cir/2.0);
            */
            NSString *imageName = _imageDatas[i];
            NSString *thumbnailFile = [NSString stringWithFormat:@"%@/%@.png", [[NSBundle mainBundle] resourcePath], imageName];
            UIImage *thumbnail = [UIImage imageWithContentsOfFile:thumbnailFile];
            
            UIImageView *imgView =
                [[UIImageView alloc] initWithImage:thumbnail];
            imgView.frame = CGRectMake(SCREEN_WIDTH * i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            [self.scrollView addSubview:imgView];

            if (i == _imageDatas.count - 1)
            {
//                if (iPhone6plus) {
//                    _actionButton.frame =
//                    CGRectMake(SCREEN_WIDTH / 2 - 90, SCREEN_HEIGHT - 100, 180, 50);
//                    _actionButton.titleLabel.font = [UIFont systemFontOfSize:24];
//                } else if (iPhone6) {
//                    _actionButton.frame =
//                    CGRectMake(SCREEN_WIDTH / 2 - 80, SCREEN_HEIGHT - 90, 160, 44);
//                    _actionButton.titleLabel.font = [UIFont systemFontOfSize:20];
//                } else if (iPhone5) {
//                    _actionButton.frame =
//                    CGRectMake(SCREEN_WIDTH / 2 - 60, SCREEN_HEIGHT - 80, 120, 40);
//                    _actionButton.titleLabel.font = [UIFont systemFontOfSize:16];
//                } else {
//                    _actionButton.frame =
//                    CGRectMake(SCREEN_WIDTH / 2 - 60, SCREEN_HEIGHT - 60, 120, 40);
//                    _actionButton.titleLabel.font = [UIFont systemFontOfSize:16];
//                }
                _actionButton.frame =
                CGRectMake(SCREEN_WIDTH / 2 - 111*0.5, SCREEN_HEIGHT - 49 - 35, 111, 68);
//                _actionButton.titleLabel.font = PingFangSC_Regular(15);
//                
//                _actionButton.layer.cornerRadius =cornerRadius_width;
//                _actionButton.layer.masksToBounds = YES;
//                _actionButton.layer.borderColor = ColorWithHex(0x7692F3, 1.0).CGColor;
//                _actionButton.layer.borderWidth = 0.5;
                
//                [_actionButton setTitle:@"立即体验" forState:UIControlStateNormal];
//                [_actionButton setImage:ImageNamed(@"") forState:UIControlStateNormal];
//                [_actionButton setTitleColor:ColorWithHex(0x7692F3, 1.0) forState:UIControlStateNormal];
//                [_actionButton setBackgroundImage:[UIImage imageNamed:@"按钮Groupyd"] forState:UIControlStateNormal];
                [_actionButton setImage:ImageNamed(@"button_tea") forState:UIControlStateNormal];
                
                [_actionButton addTarget:self
                                  action:@selector(enterButtonClick)
                        forControlEvents:UIControlEventTouchUpInside];
                [imgView addSubview:_actionButton];
                //设置可以响应交互，UIImageView的默认值为NO
                imgView.userInteractionEnabled = YES;
            }
        }
//        self.index = 100;
//        [self zhidingIndex:0];
    }
}
/*
- (void)zhidingIndex:(NSInteger )index{
    if (index == self.index) {
        return;
    }else{
        CGFloat first_pointx;
        if (_imageDatas.count%2 == 0) {
            first_pointx = ScreenWidth/2.0-(_imageDatas.count)/2.0*(spaceing_Cir+WIDTH_Cir)+spaceing_Cir;
        }else{
            first_pointx = ScreenWidth/2.0-WIDTH_Cir/2.0-(_imageDatas.count-1)/2.0*(spaceing_Cir+WIDTH_Cir)+spaceing_Cir;
        }
        NSLog(@"index=%ld",index);
        for (UIView *tmp in self.subviews) {
            if (tmp.tag >= hiden_tag) {
                NSLog(@"tmp.tag=%ld",tmp.tag);
                if ((tmp.tag - hiden_tag) == index) {
                    [tmp.layer setMasksToBounds:NO];
                    tmp.backgroundColor = ColorWithHex(0x80A7F8, 1.0);
                    LRViewRadius(tmp, WIDTH_MAXCir/2.0);
                    [UIView animateWithDuration:0.3 animations:^{
                        tmp.frame =  CGRectMake(first_pointx-(WIDTH_MAXCir-WIDTH_Cir)/2.0 + index*(spaceing_Cir+WIDTH_Cir), SCREEN_HEIGHT - 50 - 35 +(50-WIDTH_Cir)/2.0-(WIDTH_MAXCir-WIDTH_Cir)/2.0, WIDTH_MAXCir, WIDTH_MAXCir);
                    }];
                }else if ((tmp.tag - hiden_tag) == self.index){
                    [tmp.layer setMasksToBounds:NO];
                    tmp.backgroundColor = ColorWithHex(0x80A7F8, 0.2);
                    LRViewRadius(tmp, WIDTH_Cir/2.0);
                    [UIView animateWithDuration:0.3 animations:^{
                        tmp.frame =  CGRectMake(first_pointx + self.index*(spaceing_Cir+WIDTH_Cir), SCREEN_HEIGHT - 50 - 35 +(50-WIDTH_Cir)/2.0, WIDTH_Cir, WIDTH_Cir);
                    }];
                }
            }
        }
        self.index = index;
    }
}
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x/ScreenWidth;
    if (index*ScreenWidth == scrollView.contentOffset.x) {
        [self.pageCon setSelectedIndex:index];
        if (index == (_imageDatas.count-1)) {
            self.pageCon.hidden = YES;
        } else {
            self.pageCon.hidden = NO;
        }
//        [self zhidingIndex:index];
//        for (UIView *tmp in self.subviews) {
//            if (tmp.tag >= hiden_tag) {
//                if (index == (_imageDatas.count-1)) {
//                    tmp.hidden = YES;
//                }else{
//                    tmp.hidden = NO;
//                }
//            }
//        }
    }
}

- (void)sendTongzhi{
    NSNotification *notification =[NSNotification notificationWithName:yingdaoyeXiaoshile object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

#pragma mark
#pragma mark Action
- (void)enterButtonClick
{
    if (_buttonAction)
    {
        [self sendTongzhi];
        _buttonAction();
    }
}

#pragma mark
#pragma mark UIScrollView delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    _pageControl.currentPage = (_scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
//}

//在结束滚动时设置页面，比滚动中改变页面性能更好，因为滚动一次只调用一次
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
//    _pageControl.currentPage = (_scrollView.contentOffset.x + SCREEN_WIDTH / 2) / SCREEN_WIDTH;
}

@end
