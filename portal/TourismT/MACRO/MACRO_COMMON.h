//
//  MACRO_COMMON.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_COMMON_h
#define MACRO_COMMON_h




//#define TESTqxcTEST  1

#define   max_num 100   //最多可以发多少张照片

#define   max_yingxbiaoq 500   //印象标签的最大高度  


#define tourPageSize   10
#define   Firstpage   1

//#define HEIGHT_Navbar   64.f   //导航栏的高度

#define HEIGHT_bottmo   48   //底部工具栏的高度
#define FONTNAME @"PingFangSC-Regular"
#define FONTNAMEMedium @"PingFangSC-Medium"


#define PingFangSC_Regular(F) [UIFont systemFontOfSize:F]
#define PingFangSC_Medium(F) [UIFont boldSystemFontOfSize:F]

//#ifdef __IPHONE_10_0
//#define PingFangSC_Regular(F) [UIFont fontWithName:@"PingFangSC-Regular" size:F]
//#define PingFangSC_Medium(F) [UIFont fontWithName:@"PingFangSC-Medium" size:F]
//#else
//#endif


#pragma 通知

///需要刷新我的订单
#define HyunreadCountKefu  @"HyunreadCountKefu"   //环信未读消息数(客服的未读消息数)
///教学页要显示
#define TheTeachingPageIsDisplayed  @"Theteachingpageisdisplayed"

///需要重新加载日历 产品详情页面
#define ReloadCalendar  @"ReloadCalendar"
///需要刷新我的订单
#define HyunreadCount  @"HyunreadCount"   //环信未读消息数

///我的分期点击了去逛逛
#define Goshopping  @"Goshopping"   //我的分期点击了去逛逛
///需要刷新我的订单
#define needRefremydingdang  @"needRefremydingdang"
///评价了订单
#define pingjialemydingdang  @"pingjialemydingdang"

//代扣成功
#define Withholdingsuccess  @"Withholdingsuccess"
///还款成功
#define Repaymentsuccess  @"Repaymentsuccess"

///删除了 我的收藏
#define wkwebViewISscrocen  @"wkwebViewISscrocen"
///教学页消失了
#define TheTeachingPageDisappeared  @"TheTeachingPageDisappeared"
///引导页消失了
#define yingdaoyeXiaoshile  @"yingdaoyeXiaoshile"
///首页 滑动到 第一个
#define Slide_to_the_top  @"Slide_to_the_top"   //首页 滑动到 第一个
///增加了一个旅程分享
#define addTrashele  @"addTrashele"   //增加了一个旅程分享
///添加了对别人的印象标签
#define imagesssyingxiaobiaoq  @"imagesssyingxiaobiaoq"
///TOKENSUCCESS  申请成功
#define TOKENSUCCESS  @"TOKENSUCCESS"
///删除了 我的收藏
#define deletedMyshoucan  @"deletedMyshoucan"
///编辑或者删除了 我的分享
#define editOrDeleShare  @"editOrDeleShare"
///我关注人数的通知
#define myselfGuanNum  @"myselfGuanNum"
///登录和退出通知
#define LoginAndExitNotice  @"LoginAndExitNotice"  
///更该个人信息
#define MorepersonalinformationNotice  @"MorepersonalinformationNotice"
///更该了头像
#define MorepersonalinformationHeadNotice  @"MorepersonalinformationHeadNotice"
///更该了昵称
#define MorepersonalinformationNikNameNotice  @"MorepersonalinformationNikNameNotice"
///微信通知
#define wechatPayfenqiState  @"wechatPayfenqiState"  
///草稿箱有更新了
#define The_draft_box_has_been_updated  @"The draft box has been updated"
#define wechatlogin  @"wechatlogin"
#define wechatPayState  @"wechatPayStateState"  
#define wechatShareState  @"wechatShareState"
//////
#define NotificationTraY  @"NotificationTraY"
/////////
#define NotificationCenterScronend  @"NotificationCenterScronend"

#define IMAGE_NAVIGATIONBAR  @"123"


#define back_btn_top_to_superView  22
#define back_btn_left_to_superView  0
#define back_btn_RIGHT_to_superView  13


#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


#define HEIGHT_Navbar   64.f   //导航栏的高度

#define HEIGHT_NavbarX   88.f   //导航栏的高度


#define HEIGHTICON  ScreenHeight/667.0
#define WIDTHICON   ScreenWidth/375.0

//产品详情 轮播 图片的高度
#define HEIGHT_banner  274*HEIGHTICON


#define RGBColor(R,G,B)  [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:1.0f]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
///随机颜色
#define RandomColor RGBColor(arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0,arc4random_uniform(256)/255.0)
#define ColorWithHex(rgbValue,a) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:(a)]


#define LRViewBorder(View, Width, Color)\
\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]];\

#define LRViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\


//#define LRViewBorder(View, Width, Color)  [View zy_attachBorderWidth:Width color:Color]

//#define LRViewRadius(View, Radius) [View zy_cornerRadiusRoundingRect]


#define IMAGEsetCONTENTMODE(image)\
image.contentMode = UIViewContentModeScaleAspectFill;\
image.clipsToBounds = YES;\

#define PATH_OF_APP_HOME    NSHomeDirectory()
#define PATH_OF_TEMP        NSTemporaryDirectory()
#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]


// app版本
//#define app_VersionSTR @"1.0.1"
// app版本
#define app_Version [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// app build版本
#define app_build [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// 手机系统的版本
#define phoneVersion [[UIDevice currentDevice] systemVersion]


#define kWeakSelf(type)  __weak typeof(type) weak##type = type;


//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:A]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:_pointer]

//#define IMAGE(A) [UIImage imageNamed:A]


#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//com.qiuxw.qxw   com.tempus.Tourism

#define UmengAppKey  @"5822c561a40fa30fc100390b" //@"5822c561a40fa30fc100390b"
//#define WeiXinAppid  @"wxd282299fe52cd0df"
//#define WeiXinQppKey @"5e5925bce9d7d31e0a14a6fe23668c2d"
#define AlipayKEY    @"2016060801497543"
#define QQAppid      @"1105978442"
#define QQQppKey     @"KEYTHQLwEQphXpiMExs"

//#define QQAppid      @"1105409756"
//#define QQQppKey     @"KEYUVLGfb8Dj7ltjoOV"


#define sinaAPPKEY   @"2496457566" 
#define sinaSECRET   @"ecda86794275f662db2cf3c52025a249"


#define UmengPushAppKey   @"5822c561a40fa30fc100390b"
#define UmengPushAppSecret   @"gnl4rrfpyq8awrfqx5nopqqnjtnfimfn"



#define PayType_WX  @"wxPayPlugin"
#define PayType_Twallet  @"tPayPlugin"


#define SendSmsTypeLogin  @"login"
#define SendSmsTypeBingCard  @"bingCard" 



#define WechatAppID                 @"wxabd03a452a481919"   //登录用的
#define WechatAppSecret             @"fa245ff5e1109dcf6fc61bec11c40b2c" //登录用的



#define AppIdAppStore  @"1204718985"   //appStore 上的appid  
#define Hypassword  @"111111"   //环信密码

//环信开放平台参数
#define EaseMobAppKey  @"tempus#yuyou"
//#define EaseMobAppKey  @"tempus#twallet"
#ifdef DEBUG
#define EaseMobapnsCertName  @"yuyouTest"
#else
#define EaseMobapnsCertName  @"yuyouProduct"
#endif

//持久化数据目录
#define DraftCover   @"DraftCover"
#define DraftDetails   @"DraftDetails"

#define PATH_DraftCover   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"DraftCover"]
#define PATH_DraftDetails   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"DraftDetails"]


//#define PATH_payInfo   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_payInfo.data"]
#define PATH_appcommonglobal   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_appcommonglobal.data"]
#define PATH_userForApp   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_userForApp.data"]
#define PATH_appid   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_appid.data"]
#define PATH_Token   [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"PATH_Token.data"]

#endif /* MACRO_COMMON_h */
