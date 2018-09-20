//
//  CusMWPhotoBrowser.m
//  TourismT
//
//  Created by Store on 2017/7/4.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "CusMWPhotoBrowser.h"
#import "MWPhotoBrowserPrivate.h"
#import "DACircularProgressView.h"
@interface CusMWPhotoBrowser ()

@end

@implementation CusMWPhotoBrowser

- (void)viewDidLoad {
    if (self.isChoosePhotos) {
        self.enableSwipeToDismiss = NO;//取消上滑 和 下滑
    }
    self.customImageSelectedIconName = @"选中";
    [super viewDidLoad];
    [self customNavigationBar];
    [self customBackButton];
    // Do any additional setup after loading the view.
    if (self.isChoosePhotos) {
        [self setRightBtn];
    }else{
        self.fd_prefersNavigationBarHidden = YES;
    }
    if (self.backColor) {
        [self CusBackcolor];
    }

}
#pragma --mark<改变菊花的颜色>

#pragma --mark<设置 控制器的背景颜色>
- (void)CusBackcolor{
    for (UIView *tmp in self.view.subviews) {
        if ([tmp isKindOfClass:[UIScrollView class]]) {
            tmp.backgroundColor = self.backColor;
        }
    }
}
- (void)setRightBtn{
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)customNavigationBar
{
    // 1.2设置所有导航条的标题颜色
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor whiteColor]];
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    md[NSFontAttributeName] = PingFangSC_Medium(17);
    md[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [navBar setTitleTextAttributes:md];
}

- (void)customBackButton
{
    UIImage* image = [[UIImage imageNamed:IMAGE_back] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem* leftBarutton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    self.navigationItem.leftBarButtonItem = leftBarutton;
}
//重写selectedButton 的位置
- (CGRect)frameForSelectedButton:(UIButton *)selectedButton atIndex:(NSUInteger)index {
    [selectedButton setImage:[UIImage imageNamed:@"未选中"] forState:UIControlStateNormal];
    return CGRectMake((ScreenWidth+20)*(index+1)-24-25, 15, 24, 24);
}

- (void)rightBtnClick{
    if (self.btnClick) {
        self.btnClick();
    }
    [self popSelf];
}
- (void)setNavBarAppearance:(BOOL)animated {
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
//    UINavigationBar *navBar = self.navigationController.navigationBar;
//    navBar.tintColor = [UIColor whiteColor];
//    navBar.barTintColor = nil;
//    navBar.shadowImage = nil;
//    navBar.translucent = YES;
//    navBar.barStyle = UIBarStyleBlackTranslucent;
//    [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
//    [navBar setBackgroundImage:nil forBarMetrics:UIBarMetricsLandscapePhone];
}

- (void)popSelf{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)toggleControls {
    if (!self.isChoosePhotos) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma --mark<修复只有一张图片的时候 无标题>
- (void)updateNavigation {
    [super updateNavigation];
    if ([self numberOfPhotos]==1) {
        if ([self.delegate respondsToSelector:@selector(photoBrowser:titleForPhotoAtIndex:)]) {
            self.title = [self.delegate photoBrowser:self titleForPhotoAtIndex:self.currentIndex];
        }
    }
}

#pragma --mark<修复控件的背景颜色>
- (void)configurePage:(MWZoomingScrollView *)page forIndex:(NSUInteger)index {
    [super configurePage:page forIndex:index];
    if (self.backColor) {
        NSInteger all = 0;
        for (UIView* tmp in page.subviews)
        {
            if ([tmp isKindOfClass:[MWTapDetectingView class]]) {
                tmp.backgroundColor = self.backColor;
                all++;
            }else if ([tmp isKindOfClass:[DACircularProgressView class]]) {
                DACircularProgressView *progress = (DACircularProgressView *)tmp;
                progress.trackTintColor = [UIColor grayColor];
                progress.progressTintColor = RGBACOLOR(255, 107, 78, 1.0);
                all++;
            }
            if (all==2) {
                break;
            }
        }
    }
}

#pragma --mark<修复右边按钮在 重新加载数据的时候被修改>
- (void)performLayout {
    [super performLayout];
    if (self.isChoosePhotos) {
        [self setRightBtn];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
