//
//  myOreserFive.m
//  TourismT
//
//  Created by Store on 17/1/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myOreserFive.h"
#import "WJItemsControlView.h"
#import "myOreserFiveAll.h"
#define HEIGHT_itemControlView  50
#define HEIGHT_viewLine  0.5

@interface myOreserFive ()<UIScrollViewDelegate>
{
    WJItemsControlView *_itemControlView;
}

@end

@implementation myOreserFive

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的订单";
    // Do any additional setup after loading the view.

    NSArray *array = @[@"全部",@"待付款",@"待出游",@"待点评",@"退款/取消"];
    //4页内容的scrollView
    UIScrollView *scroll;
    if (ScreenHeight==812){
            scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HEIGHT_itemControlView+HEIGHT_viewLine, ScreenWidth, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_NavbarX)];
    }else{
           scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HEIGHT_itemControlView+HEIGHT_viewLine, ScreenWidth, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_Navbar)];
    }

    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    if (ScreenHeight==812){
            scroll.contentSize = CGSizeMake(ScreenWidth*array.count, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_NavbarX);
    }else{
        
        scroll.contentSize = CGSizeMake(ScreenWidth*array.count, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_Navbar);
    }
    
    for (int i=0; i<array.count; i++) {
        myOreserFiveAll *vc = [[myOreserFiveAll alloc]init];
        vc.type = i;
        [self addChildViewController:vc];
        if (ScreenHeight==812){
                    vc.view.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_NavbarX);
        }else{
                  vc.view.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight-HEIGHT_itemControlView-HEIGHT_viewLine-HEIGHT_Navbar);
        }

        [scroll addSubview:vc.view];
    }
    [self.view addSubview:scroll];

    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];

    config.lineHieght= 3.0;
    config.itemWidth = ScreenWidth/5.0;
    config.itemFont = PingFangSC_Regular(14);
    config.selectedColor = ColorWithHex(0x779CF4, 1.0);
    config.textColor = ColorWithHex(0x000000, 0.86);
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, HEIGHT_itemControlView)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    
    
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT_itemControlView, ScreenWidth, HEIGHT_viewLine)];
    [self.view addSubview:viewLine];
    viewLine.backgroundColor = ColorWithHex(0x979797, 0.4);
    
    __weak typeof (scroll)weakScrollView = scroll;
    kWeakSelf(self);
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        [weakScrollView setContentOffset:CGPointMake(index*ScreenWidth, 0) animated:YES];
        if (weakself.lookType) {
            weakself.lookType(index);
        }
//        [weakScrollView scrollRectToVisible:CGRectMake(index*weakScrollView.frame.size.width, 0.0, weakScrollView.frame.size.width,weakScrollView.frame.size.height) animated:animation];
    }];
    [self.view addSubview:_itemControlView];
    [_itemControlView moveToIndex:self.index];
    [scroll setContentOffset:CGPointMake(self.index*scroll.contentSize.width/5.0, 0) animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
    if (self.lookType) {
        self.lookType((NSInteger)offset);
    }
}



@end
