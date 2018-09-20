//
//  basicVc.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+EmptyDataSet.h"
#import "WXapi.h"
#import "NSString+check.h"
//MJREFRESH
typedef NS_ENUM(NSInteger, MJREFRESH_DIRECTION)
{
    MJREFRESH_REFRESH,
    MJREFRESH_LOADMORE,
};

typedef NS_ENUM(NSInteger, empty_num)
{
    In_loading_empty_num , //加载中
    fail_empty_num = 5, //加载失败
    logout_empty_num,   //未登录
    succes_empty_num,   //加载成功
    noItems_empty_num,   //没有数组
    NoNetworkConnection_empty_num,   //无网络连接
};

typedef NS_ENUM(NSInteger, empty_numV2)
{
    In_loading_empty_numV2 = -12345 , //加载中
    fail_empty_numV2 = -1, //加载失败
    succes_empty_numV2 = 0,   //加载成功
    logout_empty_numV2,   //未登录
    NoNetworkConnection_empty_numV2 = -12315,   //无网络连接
};




@interface basicVc : UIViewController
@property (nonatomic,strong) MJRefreshHeader *header;//头部
@property (nonatomic,strong) MJRefreshFooter *footer;//底部
@property (nonatomic,assign) empty_numV2  empty_typeV2; //
@property (nonatomic,strong) NSString  *NodataDescribe; // 没有数据时候的描叙
@property (nonatomic,assign) empty_num  empty_type; //
@property (nonatomic,assign) BOOL  IsLoadSuccessfully; //默认否
@property (nonatomic,weak) UITableView *basicTableView;
@property (nonatomic,assign) BOOL  isNeedRefreth; //
@property (nonatomic,strong) NSArray *CTrollersToR; //将要移除的控制器

- (void)customBackButton;
- (void)popSelf;
- (void)setUitableViewback;
- (void)setUitableViewstyle:(UITableViewStyle)style;
#pragma --mark<打开登录页面>
- (void)openLoginView;
#pragma --mark<统计未读消息数>
-(NSInteger)setupUnreadMessageCount;
#pragma --mark<移除某个控制器>
- (void)removeViewController:(Class )Vc;
//#pragma --mark<移除多个控制器>
//- (void)removeViewControllers:(NSArray *)Vcs;
#pragma -mark<加载新数据>
- (void)loadNewData;
#pragma -mark<加载更多数据>
- (void)loadMoreData;

//友盟 分享  图文链接
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType withTitle:(NSString *)title withDescr:(NSString *)descr withWebpageUrl:(NSString *)webpageUrl withThumImage:(id)thumImage success:(ShareSuccess)successBlock failure:(ShareFailure)failureBlock;


#pragma -mark<分享接口二期  建议后续使用改接口>
- (void)shareTwoWebPageToPlatformType:(UMSocialPlatformType)platformType withTitle:(NSString *)title withDescr:(NSString *)descr withWebOrImageUrl:(id )WebOrImageUrl withThumImage:(id)thumImage IsImage:(BOOL)IsImage success:(ShareSuccess)successBlock failure:(ShareFailure)failureBlock;
@end
