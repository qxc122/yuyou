//
//  MWeditImageOK.m
//  TourismT
//
//  Created by Store on 2017/7/5.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "MWeditImageOK.h"
#import "UIImageView+cir.h"

typedef NS_ENUM(NSInteger, editImageOK_btnEnum)
{
    ok_editImageOK_btnEnum = 1,//轮船
    change_editImageOK_btnEnum = 3,//巴士
};

#define PADDINGMy                  10.0 //覆盖 PADDING

@interface MWeditImageOK ()
@property (nonatomic,weak) UIImageView  *imageView;
@end

@implementation MWeditImageOK

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *letf = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    letf.tag = change_editImageOK_btnEnum;
    self.navigationItem.leftBarButtonItem = letf;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    right.tag = ok_editImageOK_btnEnum;
    self.navigationItem.rightBarButtonItem = right;
    self.title = @"设定头像";
    self.fd_prefersNavigationBarHidden = NO;
    
    
    UIImageView  *imageView = [[UIImageView alloc] init];
    self.imageView  =imageView;
    imageView.alpha = 0.5;
    [imageView setImage:ImageNamed(@"Combined Shape")];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.centerY.equalTo(self.view);
        make.height.equalTo(self.view.mas_width);
    }];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIView  *viewTop = [[UIView alloc] init];
//    viewTop.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:viewTop];
//    [viewTop mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.bottom.equalTo(imageView.mas_top);
//    }];
//    
//    UIView  *viewBottom = [[UIView alloc] init];
//    viewBottom.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:viewBottom];
//    [viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.top.equalTo(imageView.mas_bottom);
//        make.bottom.equalTo(self.view);
//    }];
//    
    
}
- (void)leftClick:(UIBarButtonItem *)btn{
    if (btn.tag == ok_editImageOK_btnEnum) {
        if (self.returnAvtor) {
            self.imageView.hidden = YES;
            UIImage *tmp = [UIImageView GetScreenShotWithScreen:self.view andFrame:self.imageView.frame];
            //            UIImage *Nextmp = [UIImageView circleImage:tmp withParam:0];
            self.imageView.hidden = NO;
            self.returnAvtor(tmp);
            [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        }
    } else if (btn.tag == change_editImageOK_btnEnum){
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)toggleControls {

}
#pragma --mark<图片显示的区域>
- (CGRect)frameForPagingScrollView {
    if (ScreenHeight==812){
           return CGRectMake(-PADDINGMy, (ScreenHeight-ScreenWidth-HEIGHT_NavbarX)*0.5, ScreenWidth+2*PADDINGMy, ScreenWidth);
    }else{
        
        return CGRectMake(-PADDINGMy, (ScreenHeight-ScreenWidth-HEIGHT_Navbar)*0.5, ScreenWidth+2*PADDINGMy, ScreenWidth);
    }
//    CGRect frame = self.view.bounds;// [[UIScreen mainScreen] bounds];
//    frame.origin.x -= PADDING;
//    frame.size.width += (2 * PADDING);
//    return CGRectIntegral(frame);
}
@end
