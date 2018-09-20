//
//  lookWkweb.m
//  TourismT
//
//  Created by Store on 16/12/31.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "lookWkweb.h"
#import <WebKit/WKFoundation.h>
#import <WebKit/WebKit.h>
#import "meiPan.h"
#import "shareTo.h"
#import "WXapi.h"
#import "meiPan.h"
#import "TourismT-Swift.h"
#import "shareImage.h"

#define dellySec  0.2   //延时0.1 秒执行

@interface lookWkweb ()<WKNavigationDelegate,UIActionSheetDelegate>
@property (nonatomic,weak) WKWebView *webView;
@property (nonatomic,weak) WKWebView *webViewTwo;
@property (nonatomic,weak) UILabel *titleLabel;
@property (weak,nonatomic) UIProgressView *pro1;
//@property (weak,nonatomic) UIButton *shareBtn;
@property (nonatomic,weak) shareTo *shareview;
@property (nonatomic,strong) UIImage * capturedImage;

@property (nonatomic,strong) NSTimer *scrollTimer;

@property (nonatomic,assign) NSInteger proNUm;
@end

@implementation lookWkweb
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.proNUm = 0;
        self.isHaveRightBtnDelete = YES;
        self.isHaveRightBtnb = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *back = [UIView new];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    WKWebView *webView = [[WKWebView alloc]init];
    [webView sizeToFit];
    webView.navigationDelegate = self;
    
//    webView.scrollView.scrollEnabled = NO;
    [self.view addSubview:webView];
    self.webView = webView;
//    webView.scrollView.showsHorizontalScrollIndicator = NO;
//    webView.scrollView.showsVerticalScrollIndicator = NO;
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    
//    NSString *wkUrl = self.url;
//    if (!wkUrl) {
//        wkUrl = self.dateOne.path;
//    }
    
    NSURL *url;
    if (self.url) {
        if ([self.url isKindOfClass:[NSString class]]) {
            url = [NSURL URLWithString:self.url];
        } else {
            url = (NSURL *)self.url;
        }
    } else {
        url = [NSURL URLWithString:self.dateOne.path];
    }
    //TODO
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    if (self.IsHaveshareBtn) {
        WKWebView *webViewTwo = [[WKWebView alloc]init];
//        webViewTwo.navigationDelegate = self;
        //    [webViewTwo sizeToFit];
        //    webViewTwo.navigationDelegate = self;
        //    webView.scrollView.scrollEnabled = NO;
        [self.view addSubview:webViewTwo];
//        [webViewTwo addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        
        self.webViewTwo = webViewTwo;
        //    webView.scrollView.showsHorizontalScrollIndicator = NO;
        //    webView.scrollView.showsVerticalScrollIndicator = NO;
        [webViewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(webView);
            make.right.equalTo(webView);
            make.top.equalTo(webView);
            make.bottom.equalTo(webView);
        }];
        [webViewTwo loadRequest:[NSURLRequest requestWithURL:url]];
        
        webViewTwo.navigationDelegate = self;
        [webViewTwo addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        [webViewTwo addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
        
        
//        [self AddDelBtn];
        [self AddShareBtnAndDelBtn];
    }
    
    UIProgressView *pro1=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    //设置的高度对进度条的高度没影响，整个高度=进度条的高度，进度条也是个圆角矩形
    //但slider滑动控件：设置的高度对slider也没影响，但整个高度=设置的高度，可以设置背景来检验
    [self.view addSubview:pro1];
    [pro1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(webView);
        make.right.equalTo(webView);
        make.top.equalTo(webView);
        make.height.equalTo(@2);
    }];
    self.pro1 = pro1;
    //设置进度条颜色
    pro1.trackTintColor = [UIColor grayColor];;
    //设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
    pro1.progress=0.0;
    //设置进度条上进度的颜色
    pro1.progressTintColor=[UIColor redColor];
    
    
//    if (self.IsHaveshareBtn) {
//        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view);
//            make.right.equalTo(self.view);
//            make.bottom.equalTo(self.view);
//            make.height.equalTo(@50);
//        }];
//        [shareBtn setTitle:@"分享" forState:UIControlStateNormal];
//        [shareBtn setTitleColor:ColorWithHex(0x779CF4, 1.0) forState:UIControlStateNormal];
//        [shareBtn setImage:ImageNamed(@"分享lanse") forState:UIControlStateNormal];
//        [shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        if (self.isHaveRightBtnb) {
//            [self customBackButtonNO];
//            [self customRightButtonOk];
//        }
//    }else{
//        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view);
//            make.right.equalTo(self.view);
//            make.bottom.equalTo(self.view);
//            make.height.equalTo(@0);
//        }];
//    }
//    if (self.IsxiangshiOKbtn && self.isHaveRightBtnb) {
//        [self customBackButtonYES];
//        [self customRightButtonBianji];
//    }
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatShareStateCan:) name:wechatShareState object:nil];
    if (self.isPresent) {
        self.fd_prefersNavigationBarHidden = YES;
        [self addCloseBtn];
        [webView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            if (ScreenHeight==812){
                make.top.equalTo(self.view).offset(HEIGHT_NavbarX);
            }else{
                make.top.equalTo(self.view).offset(HEIGHT_Navbar);
            }
            make.bottom.equalTo(self.view);
        }];

        UIView *lineTop = [UIView new];
        [self.view addSubview:lineTop];
        
        UILabel *title = [UILabel new];
        self.titleLabel = title;
        [self.view addSubview:title];
        

        [lineTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.bottom.equalTo(webView.mas_top);
            make.height.equalTo(@0.5);
        }];
        
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.right.equalTo(self.view);
            make.height.equalTo(@40);
            make.bottom.equalTo(webView.mas_top);
        }];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = PingFangSC_Medium(17);
        title.textColor = ColorWithHex(0x000000, 0.87);
        lineTop.backgroundColor = ColorWithHex(0x979797, 0.3);
        title.text = self.titleStr;
//        title.backgroundColor = [UIColor redColor];
    }
}

#pragma --mark<添加 删除按钮>
- (void)AddDelBtn{
    if (self.isHaveRightBtnDelete) {
        UIButton *del = [UIButton buttonWithType:UIButtonTypeCustom];
        [del addTarget:self action:@selector(DeleteTravelNotes:) forControlEvents:UIControlEventTouchUpInside];
        [del setImage:[UIImage imageNamed:@"删除lajit"] forState:UIControlStateNormal];
        [del sizeToFit];
        UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:del];
        self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    }
}
#pragma --mark<添加 分享 和删除按钮>
- (void)AddShareBtnAndDelBtn{
    UIButton *del = [UIButton buttonWithType:UIButtonTypeCustom];
    [del addTarget:self action:@selector(DeleteTravelNotes:) forControlEvents:UIControlEventTouchUpInside];
    [del setImage:[UIImage imageNamed:@"删除lajit"] forState:UIControlStateNormal];
    [del sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:del];
    
    
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceBarButtonItem.width = 20;
    
    
    UIButton *share = [UIButton buttonWithType:UIButtonTypeCustom];
    //        self.shareBtn = share;
    //        self.shareBtn.enabled = NO;
    [share addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [share setImage:[UIImage imageNamed:@"分享白色"] forState:UIControlStateNormal];
    [share sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:share];
    if (self.isHaveRightBtnDelete) {
        self.navigationItem.rightBarButtonItems  = @[settingBtnItem,fixedSpaceBarButtonItem,informationCardItem];
    } else {
        self.navigationItem.rightBarButtonItem = settingBtnItem;
    }
}

//- (void)setTitleStr:(NSString *)titleStr{
//    _titleStr = titleStr;
//    self.titleLabel.text = titleStr;
//    
//}
- (void)addCloseBtn{
    UIView *btnBack = [UIView new];
    [self.view addSubview:btnBack];
    
    UIButton *btn = [UIButton new];
    [self.view addSubview:btn];
    
    [btnBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btn);
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
    }];
    btnBack.backgroundColor = [UIColor whiteColor];
    
    [btn setImage:ImageNamed(@"删除详情") forState:UIControlStateNormal];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-15);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)customBackButton{
    if (!self.isPresent) {
        [super customBackButton];
    }
}
- (void)DeleteTravelNotes:(UIButton *)btn{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"操作中..." toView:self.view];
    [[ToolRequest sharedInstance]travelsharingdeleteWithidd:self.dateOne.idd success:^(id dataDict, NSString *msg, NSInteger code) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg];
        NSNotification *notification =[NSNotification notificationWithName:editOrDeleShare object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        [weakself popSelf];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}

//
//#pragma  -mark<分享>
//- (void)wechatShareStateCan:(NSNotification *)user{
//    [self.shareview closeClisck];
//}
/*
- (void)customBackButtonYES
{
    UIImage* image = [[UIImage imageNamed:IMAGE_back] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem* leftBarutton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(popSelf)];
    self.navigationItem.leftBarButtonItem = leftBarutton;
}
- (void)customBackButtonNO
{
    UIBarButtonItem *rightNO = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = rightNO;
}

- (void)customRightButtonOk
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    self.navigationItem.rightBarButtonItem = right;
}
#pragma --mark<点击了完成按钮>
- (void)rightClick:(UIBarButtonItem *)btn{
    [self customBackButtonYES];
    [self customRightButtonBianji];
}
#pragma --mark<点击了编辑按钮>
- (void)rightBianjiClick:(UIBarButtonItem *)btn{

    UIActionSheet*sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消"destructiveButtonTitle:nil otherButtonTitles:@"编辑",@"删除",nil];
    [sheet showInView:self.view];
}
- (void)customRightButtonBianji
{
    UIBarButtonItem *rightBianji = [[UIBarButtonItem alloc]initWithImage:ImageNamed(@"Group 3bianiij") style:UIBarButtonItemStylePlain target:self action:@selector(rightBianjiClick:)];
    self.navigationItem.rightBarButtonItem = rightBianji;
}
*/
- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    if (self.webViewTwo) {
        [self.webViewTwo removeObserver:self forKeyPath:@"title"];
        [self.webViewTwo removeObserver:self forKeyPath:@"estimatedProgress"];
    }
//    [self.webViewTwo removeObserver:self forKeyPath:@"estimatedProgress"];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    [self removeTimer];
    NSLog(@"%s",__func__);
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"] ) {
        // 这里就不写进度条了，把加载的进度打印出来，进度条可以自己加上去！
        CGFloat newProgress = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        NSLog(@"%f",newProgress);
        [self.pro1 setAlpha:1.0f];
        [self.pro1 setProgress:newProgress animated:YES];
        if (newProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.pro1 setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.pro1 setProgress:0.0f animated:NO];
            }];
            
            if (self.webViewTwo) {
                [self performSelector:@selector(screenshot) withObject:nil/*可传任意类型参数*/ afterDelay:dellySec];
                [self creatTimer];
            }
        }
    } else if (object == self.webView && [keyPath isEqualToString:@"title"] ) {
        self.title = self.webView.title;
    }else if (object == self.webViewTwo){

    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    self.pro1.alpha = 0;
}
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//    self.pro1.alpha = 0;
//
//}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    if (self.webViewTwo) {
        self.proNUm = 0;
        self.capturedImage = nil;
        if (![self.webView isLoading]) {
            [self.webView loadRequest:[NSURLRequest requestWithURL:webView.URL]];
        }
    }
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    if (self.webViewTwo) {
        if ([navigationAction.request.URL.absoluteString containsString:@"list"]) {
            self.navigationItem.rightBarButtonItems  = nil;
            self.navigationItem.rightBarButtonItem = nil;
        }else{
            [self AddShareBtnAndDelBtn];
        }
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
// 类似 UIWebView的 -webView: shouldStartLoadWithRequest: navigationType:


//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
//{
//    //可以在此进行判断是属于那种跳转类型
//    //获取跳转链接
//    NSURL *url = navigationAction.request.URL;
//    //根据约定好的协议头进行判断
//    if ([url.scheme isEqualToString:@"saga"]) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:WKJumpNotification object:nil userInfo:@{@"url":url}];
//        //不允许跳转
//        decisionHandler(WKNavigationActionPolicyCancel);
//    } else {
//        //允许页面跳转
//        decisionHandler(WKNavigationActionPolicyAllow);
//    }
//    NSLog(@"跳转前调用，决定是否跳转");
//}


#pragma --mark<打开图片  预览页>
- (void)OpenshareImage{
    shareImage *shareView  =[shareImage new];
    kWeakSelf(self);
    shareView.shareImageClick = ^{
        [weakself shareBtnClick];
    };
    shareView.capturedImage = self.capturedImage;
    [shareView windosViewshow];
}

- (void)screenshot{
    kWeakSelf(self);
//    [MBProgressHUD showLoadingMessage:@"图片生成中..."];
    [self.webView swContentScrollCapture:^(UIImage * capturedImage) {
//        [MBProgressHUD hideHUD];
        NSLog(@"%@",[NSThread currentThread]);
//        weakself.shareBtn.enabled = YES;
        if ([weakself.navigationController.topViewController isEqual:weakself]) {
            
            if (capturedImage) {
                if (weakself.proNUm > 0) {
                    [MBProgressHUD showPrompt:@"图片生成成功~" toView:weakself.view];
                }
                weakself.capturedImage = capturedImage;
//                [weakself AddShareBtnAndDelBtn];
                if (weakself.isHaveShareImage) {
                    [weakself OpenshareImage];
                }
            }else{
                [weakself performSelector:@selector(screenshot) withObject:nil/*可传任意类型参数*/ afterDelay:dellySec];
            }
        }
    }];
    
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self.webView swContentScrollCapture:^(UIImage * capturedImage) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                if ([weakself.navigationController.topViewController isEqual:weakself]) {
//                    weakself.capturedImage = capturedImage;
//                    shareImage *shareView  =[shareImage new];
//                    shareView.capturedImage = capturedImage;
//                    [shareView windosViewshow];
//                }
//            });
//        }];
//    });
}

#pragma --mark<分享按钮>
- (void)shareBtnClick{
    if (self.capturedImage) {
        shareTo *view = [[shareTo alloc]init];
        self.shareview = view;
        kWeakSelf(self);
        view.shareClick = ^(int index){
//            shareInfoS *tmm =  weakself.dateOne.shareInfo;
//            NSString *tmp = tmm.shareTitle;
            [weakself shareTwoWebPageToPlatformType:index withTitle:weakself.dateOne.shareInfo.shareTitle withDescr:weakself.dateOne.shareInfo.shareContent withWebOrImageUrl:weakself.capturedImage withThumImage:weakself.capturedImage IsImage:YES success:^(NSString *messg) {
                [MBProgressHUD showPrompt:messg toView:weakself.view];
            } failure:^(NSString *error) {
                [MBProgressHUD showPrompt:error toView:weakself.view];
            }];
        };
        [view windosViewshow];
    }else{
        NSString *proStr = @"图片生成中...";
        if (self.proNUm==0) {
            proStr = @"图片生成中...";
        }
//        else if (self.proNUm==1) {
//            proStr = @"美图正在合成中～";
//        } else if (self.proNUm>=0) {
//            proStr = @"美图马上就好啦～";
//        }
        self.proNUm++;
        [MBProgressHUD showPrompt:proStr toView:self.view];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.IsdemeiPan) {
        NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
        for (UIViewController *vc in muArry) {
            if ([vc isKindOfClass:[meiPan class]]) {
                [muArry removeObject:vc];
                self.navigationController.viewControllers = muArry;
                break;
            }
        }
    }
//    UIImageView *im = [UIImageView new];
//    [self.view addSubview:im];
//    [im mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.top.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//    }];
//    im.contentMode = UIViewContentModeScaleAspectFill;
//    im.image = [self imageFromText:@[@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",@"asdfasdfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfdfadfasdfadfadfasdfadfadf",@"222222222222222222222222222222222222",] withFont:30];
}
/*
#pragma --mark<UIActionSheetDelegate  sheet 协议>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
        NSLog(@"buttonIndex=%ld",buttonIndex);
//        编辑 ＝ 0
        if (buttonIndex == 1) {
            kWeakSelf(self);
            [MBProgressHUD showLoadingMessage:@"操作中..." toView:self.view];
            [[ToolRequest sharedInstance]travelsharingdeleteWithidd:self.dateOne.idd success:^(id dataDict, NSString *msg, NSInteger code) {
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:msg];
                
//                if (weakself.Deleted) {
//                    weakself.Deleted(weakself.dateOne);
//                }else{
                    //点击了删除
                    NSNotification *notification =[NSNotification notificationWithName:editOrDeleShare object:nil userInfo:nil];
                    [[NSNotificationCenter defaultCenter] postNotification:notification];
//                }
                [weakself popSelf];
            } failure:^(NSInteger errorCode, NSString *msg) {
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
            }];
        } else if (buttonIndex == 0){
            meiPan *vc = [[meiPan alloc]init];
            vc.dateOne  =self.dateOne;
            [self.navigationController pushViewController:vc animated:YES];
        }
}
 */


/*
-(UIImage *)imageFromText:(NSArray*) arrContent withFont: (CGFloat)fontSize

{
    
    // set the font type and size
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    NSMutableArray *arrHeight = [[NSMutableArray alloc] initWithCapacity:arrContent.count];
    
    
    
    CGFloat fHeight = 0.0f;
    
    for (NSString *sContent in arrContent) {
        
        CGSize stringSize = [sContent sizeWithFont:font constrainedToSize:CGSizeMake(ScreenWidth, 10000) lineBreakMode:UILineBreakModeWordWrap];
        
        [arrHeight addObject:[NSNumber numberWithFloat:stringSize.height]];
        
        fHeight += stringSize.height;
        
    }
    
    
    
    CGSize newSize = CGSizeMake(ScreenWidth+20, fHeight+50);
    
    
    
    UIGraphicsBeginImageContextWithOptions(newSize,NO,0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetCharacterSpacing(ctx, 10);
    
    CGContextSetTextDrawingMode (ctx, kCGTextFillStroke);
    
    CGContextSetRGBFillColor (ctx, 0.1, 0.2, 0.3, 1); // 6
    
    CGContextSetRGBStrokeColor (ctx, 0, 0, 0, 1);
    
    
    
    int nIndex = 0;
    
    CGFloat fPosY = 20.0f;
    
    for (NSString *sContent in arrContent) {
        
        NSNumber *numHeight = [arrHeight objectAtIndex:nIndex];
        
        CGRect rect = CGRectMake(10, fPosY, ScreenWidth , [numHeight floatValue]);
        
        [sContent drawInRect:rect withFont:font lineBreakMode:UILineBreakModeWordWrap alignment:UITextAlignmentLeft];
        
        
        
        fPosY += [numHeight floatValue];
        
        nIndex++;
        
    }
    
    // transfer image
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    
    return image;
    
    
    
}
*/


#pragma mark----创建定时器
-(void)creatTimer
{
    _scrollTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(daojishiRunning) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_scrollTimer forMode:NSRunLoopCommonModes];
}
#pragma mark----倒计时
-(void)daojishiRunning{
    for (UIImageView *tmp in self.view.subviews) {
        if (tmp.tag == 159) {
            [self.view bringSubviewToFront:self.webViewTwo];
            [self removeTimer];
            NSLog(@"sdfsdf  1");
            break;
        }
    }
//    for (UIImageView *tmp in self.webView.subviews) {
//        if (tmp.tag == 159) {
//            NSLog(@"sdfsdf  2");
//        }
//    }
//    for (UIImageView *tmp in [UIApplication sharedApplication].keyWindow.subviews) {
//        if (tmp.tag == 159) {
//            NSLog(@"sdfsdf  3");
//        }
//    }
}
#pragma mark----移除定时器
-(void)removeTimer
{
    [_scrollTimer invalidate];
    _scrollTimer = nil;
}


@end
