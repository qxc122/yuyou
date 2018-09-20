//
//  basicVc.m
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "basicVc.h"
#import "login.h"
@interface basicVc ()

@end

@implementation basicVc
- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationBar];
    [self customBackButton];
    self.view.backgroundColor = RGBACOLOR(255, 255, 255, 1);
    self.empty_typeV2 = In_loading_empty_numV2;
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

// 统计未读消息数
-(NSInteger)setupUnreadMessageCount
{
    if ([tourInfo sharedInstance].UserInfo) { //已登录
        NSArray *conversations = [[EMClient sharedClient].chatManager getAllConversations];
        NSInteger unreadCount = 0;
        for (EMConversation *conversation in conversations) {
            unreadCount += conversation.unreadMessagesCount;
        }
        return unreadCount;
    }
    return 0;
}


- (void)popSelf
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self hideBottomBarWhenPush];
        self.NodataDescribe = @"暂无数据";
    }
    return self;
}
- (void)hideBottomBarWhenPush
{
    self.hidesBottomBarWhenPushed = YES;
}
- (void)setUitableViewback{
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}
- (void)setUitableViewstyle:(UITableViewStyle)style{
    [self setUitableViewback];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:style];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.backgroundColor =  [UIColor whiteColor];
    self.basicTableView = tableView;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    if (@available(iOS 11.0, *)) {
        self.basicTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;//UIScrollView也适用
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma -mark<mj_header  头部>
- (MJRefreshHeader *)header{
    if (!_header) {
        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        // Set the ordinary state of animated images
//        [header setImages:@[[UIImage imageNamed:@"01"],[UIImage imageNamed:@"02"]] forState:MJRefreshStateIdle];
//        // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
//        [header setImages:@[[UIImage imageNamed:@"01"],[UIImage imageNamed:@"02"]] forState:MJRefreshStatePulling];
//        // Set the refreshing state of animated images
//        [header setImages:@[[UIImage imageNamed:@"01"],[UIImage imageNamed:@"02"]] forState:MJRefreshStateRefreshing];
        
        
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateIdle];
        // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStatePulling];
        // Set the refreshing state of animated images
        [header setImages:@[[UIImage imageNamed:@"type1"],[UIImage imageNamed:@"type2"],[UIImage imageNamed:@"type3"],[UIImage imageNamed:@"type4"]] forState:MJRefreshStateRefreshing];
        
        // Hide the time
        header.lastUpdatedTimeLabel.hidden = YES;
        
        // Hide the status
        header.stateLabel.hidden = YES;
        // Set header
        if (self.basicTableView) {
            self.basicTableView.mj_header = header;
        }
        _header = header;
    }
    return _header;
}

#pragma -mark<加载新数据>
- (void)loadNewData{
    
}

#pragma -mark<mj_footer  头部>
- (MJRefreshFooter *)footer{
    if (!_footer) {
        MJRefreshFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _footer = footer;
        if (self.basicTableView) {
            self.basicTableView.mj_footer = footer;
        }
    }
    return _footer;
}

#pragma -mark<加载更多数据>
- (void)loadMoreData{
    
}

#pragma --mark<打开登录页面>
- (void)openLoginView{
    login *losgin = [[login alloc]init];
    UINavigationController *nnvc = [[UINavigationController alloc]initWithRootViewController:losgin];;
    [self presentViewController:nnvc animated:YES completion:nil];
}

#pragma --mark<移除某个控制器>
- (void)removeViewController:(Class )Vc{
    NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
    for (UIViewController *vc in muArry) {
        if ([vc isKindOfClass:Vc]) {
            [muArry removeObject:vc];
            self.navigationController.viewControllers = muArry;
            break;
        }
    }
}

//#pragma --mark<移除多个控制器>
//- (void)removeViewControllers:(NSArray *)Vcs{
//    NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
//    for (UIViewController *vc in muArry) {
//        for (Class class in Vcs) {
//            if ([vc isKindOfClass:class]) {
//                [muArry removeObject:vc];
//                self.navigationController.viewControllers = muArry;
//                break;
//            }
//        }
//    }
//}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.CTrollersToR.count) {
        NSMutableArray *muArry =[self.navigationController.viewControllers mutableCopy];
        for (UIViewController *vc in self.navigationController.viewControllers) {
            for (Class class in self.CTrollersToR) {
                if ([vc isKindOfClass:class]) {
                    [muArry removeObject:vc];
                    break;
                }
            }
        }
        self.navigationController.viewControllers = muArry;
        self.CTrollersToR = nil;
    }
}

- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType withTitle:(NSString *)title withDescr:(NSString *)descr withWebpageUrl:(NSString *)webpageUrl withThumImage:(id)thumImage success:(ShareSuccess)successBlock failure:(ShareFailure)failureBlock;
{

    if (platformType < UMSocialPlatformType_Predefine_Begin || platformType > UMSocialPlatformType_Predefine_end) {
        [MBProgressHUD showPrompt:@"不合法的分享平台"];
        return;
    }
    
    if (UMSocialPlatformType_WechatSession <= platformType && platformType <= UMSocialPlatformType_WechatFavorite && ![WXApi isWXAppInstalled]) {
        [MBProgressHUD showPrompt:@"您没有安装微信客户端"];
        return;
    }
    if ([thumImage isKindOfClass:[UIImage class]]) {
        [self shareTwoWebPageToPlatformType:platformType withTitle:title withDescr:descr withWebpageUrl:webpageUrl withThumImage:thumImage success:successBlock failure:failureBlock];
    } else if ([thumImage isKindOfClass:[NSString class]]){
        NSString *url = (NSString *)thumImage;
        if (!url) {
            url = @"logo关于";
        }
        if ([url hasPrefix:@"http"]) {
            kWeakSelf(self);
            [MBProgressHUD showLoadingMessage:@"准备分享中..."];
            [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize)
             {
                 //处理下载进度
             } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                 [MBProgressHUD hideHUD];
                 if (finished) {
                     [weakself shareTwoWebPageToPlatformType:platformType withTitle:title withDescr:descr withWebpageUrl:webpageUrl withThumImage:image success:successBlock failure:failureBlock];
                 } else {
                     [MBProgressHUD showPrompt:@"分享图片下载失败"];
                 }
             }];
        } else {
            [self shareTwoWebPageToPlatformType:platformType withTitle:title withDescr:descr withWebpageUrl:webpageUrl withThumImage:[UIImage imageNamed:url] success:successBlock failure:failureBlock];
        }
    }
}

- (void)shareTwoWebPageToPlatformType:(UMSocialPlatformType)platformType withTitle:(NSString *)title withDescr:(NSString *)descr withWebpageUrl:(NSString *)webpageUrl withThumImage:(id)thumImage success:(ShareSuccess)successBlock failure:(ShareFailure)failureBlock;
{
//    QQApiImageObject
    if (!title || !title.length) {
        title = @"与游-玩转自由行";
    }
    if (!descr || !descr.length) {
        descr = @"网罗自由行攻略、结交同行驴友";
    }
    if (!webpageUrl || !webpageUrl.length) {
        webpageUrl = @"https://itunes.apple.com/cn/app/与游-网罗自由行攻略-结交同行驴友/id1204718985?mt=8";
    }
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
    //设置网页地址
    shareObject.webpageUrl = webpageUrl;

    
    
//    UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:title descr:descr thumImage:thumImage];
//    shareObject.shareImage = thumImage;
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            if (error.code == UMSocialPlatformErrorType_Cancel) {
                failureBlock(@"您取消了分享");
            } else {
                failureBlock(@"分享失败");
            }
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                successBlock(resp.message);
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                failureBlock(@"分享失败");
//                failureBlock([NSString stringWithFormat:@"%@",error]);
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
    }];
}



- (void)shareTwoWebPageToPlatformType:(UMSocialPlatformType)platformType withTitle:(NSString *)title withDescr:(NSString *)descr withWebOrImageUrl:(id )WebOrImageUrl withThumImage:(id)thumImage IsImage:(BOOL)IsImage success:(ShareSuccess)successBlock failure:(ShareFailure)failureBlock
{
    if (platformType < UMSocialPlatformType_Predefine_Begin || platformType > UMSocialPlatformType_Predefine_end) {
        failureBlock(@"不合法的分享平台");
        return;
    }
    
    if (UMSocialPlatformType_WechatSession <= platformType && platformType <= UMSocialPlatformType_WechatFavorite && ![WXApi isWXAppInstalled]) {
        failureBlock(@"您没有安装微信客户端");
        return;
    }
    
    //    QQApiImageObject
    if (!title || !title.length) {
        title = @"与游-玩转自由行";
    }
    if (!descr || !descr.length) {
        descr = @"网罗自由行攻略、结交同行驴友";
    }
    
    if ([thumImage isKindOfClass:[UIImage class]]) {
        [MBProgressHUD showLoadingMessage:@"准备分享中~"];
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSData *imageData;
            UIImage *tmp = thumImage;

            imageData = UIImageJPEGRepresentation(tmp,0.2);//进行图片压缩
            
            if (!imageData) {
                imageData = UIImagePNGRepresentation(thumImage);
            }
            
            CGFloat yasou=0.5;
            NSLog(@"原来的大小 imageData.leng=%ld k %@",imageData.length/1024,[NSThread currentThread]);
            while ((imageData.length - 1024*1024) >0) {
                tmp = thumImage;
                NSLog(@"太大了 分享  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
                imageData = UIImageJPEGRepresentation(tmp, yasou);
                if (imageData.length > 10*1024*1024) {
                    failureBlock(@"该平台不支持分享超过10M的图片");
                    return;
                } else if (imageData.length > 5*1024*1024){
                    yasou *=0.02;
                } else if (imageData.length > 4*1024*1024){
                    yasou *=0.06;
                } else if (imageData.length > 3*1024*1024){
                    yasou *=0.07;
                } else if (imageData.length > 2*1024*1024){
                    yasou *=0.08;
                } else {
                    yasou *=0.09;
                }
                if (yasou<0.001) {
                    break;
                }
                NSLog(@"压小后 分享  imageData.leng=%ld   yasou=%f",imageData.length/(1024*1024),yasou);
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //回调或者说是通知主线程刷新，
                NSLog(@"imageData.leng=%ld k",imageData.length/1024);
//                if (!imageData.length) {
//                    thumImage = ImageNamed(place_image_image);
//                }
                [MBProgressHUD hideHUD];
                
                //创建分享消息对象
                UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
                if (IsImage) {
                    UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:title descr:descr thumImage:imageData?imageData:thumImage];
                    shareObject.shareImage = WebOrImageUrl;
                    //分享消息对象设置分享内容对象
                    messageObject.shareObject = shareObject;
                } else {
                    //创建网页内容对象
                    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:title descr:descr thumImage:imageData?imageData:thumImage];
                    //设置网页地址
                    shareObject.webpageUrl = WebOrImageUrl;
                    //分享消息对象设置分享内容对象
                    messageObject.shareObject = shareObject;
                }
                
                //调用分享接口
                [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
                    if (error) {
                        if (error.code == UMSocialPlatformErrorType_Cancel) {
                            failureBlock(@"您取消了分享");
                        } else {
                            failureBlock(@"分享失败");
                        }
                        UMSocialLogInfo(@"************Share fail with error %@*********",error);
                    }else{
                        if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                            UMSocialShareResponse *resp = data;
                            successBlock(@"分享成功");
                            //分享结果消息
                            UMSocialLogInfo(@"response message is %@",resp.message);
                            //第三方原始返回的数据
                            UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                            
                        }else{
                            failureBlock(@"分享失败");
                            //                failureBlock([NSString stringWithFormat:@"%@",error]);
                            UMSocialLogInfo(@"response data is %@",data);
                        }
                    }
                }];
            });
            
        });
    }
}
@end
