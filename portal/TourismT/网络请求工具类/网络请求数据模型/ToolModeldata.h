//
//  ToolModeldata.h
//  TourismT
//
//  Created by Store on 16/12/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Photos/Photos.h>
//命名规范  在模型名字后统一加S，表示这是一个对象   对应的加D
//是ENUM 后面加ENUM
//数组后面加A
//@class travelsS;
@class pageableS;
@class tagsS;
@class ImageS;
@class UserS;
@class ArticleCategoryS;
@class TagS;
@class CommentS;
@class aboardInfoAndhotelInfoS;
@class orderCountS;
@class travelInfoS;
@class orderlistForOneS;
@class IOSSpecialS;
@class periodInfoS;
@class agreementS;
@class banyouNoticationForOneS;
@class popupS;
@class shareInfoS;

#define travel_type_domestic  @"domestic"    /** 国内游 */
#define travel_type_abroad  @"abroad"    /** 出境游 */

#define freetime_JourneyOneINOneS_type  @"freetime"    //自由活动
#define aboard_JourneyOneINOneS_type  @"aboard"    //交通
#define dining_JourneyOneINOneS_type  @"dining"    //餐厅
#define hotel_JourneyOneINOneS_type  @"hotel"    //酒店
#define other_JourneyOneINOneS_type  @"other"    //其他
#define scenic_JourneyOneINOneS_type  @"scenic"    //景点
#define shopping_JourneyOneINOneS_type  @"shopping"    //购物

#define ALL_myOreserFiveAll_type_str @"all" //全部
#define TOPAY_myOreserFiveAll_type_str @"unPayment"  //待付款
#define TOdianping_myOreserFiveAll_type_str @"paid"  //待出游
#define confirm_myOreserFiveAll_type_str @"confirm"  //已经 付款 待出游
#define toGo_myOreserFiveAll_type_str @"complete"        //待点评
#define tuikuang_myOreserFiveAll_type_str @"cancel"    //取消

#define refundable_order_deatil_saues @"refundable"  //可申请退款-refundable
#define applying_order_deatil_saues @"applying"  //申请中-applying
#define refunding_order_deatil_saues @"refunding"        //退款中-refunding
#define refunded_order_deatil_saues @"refunded"    //退款成功-refunded

//优惠券
#define all_youhuiquan_saues @"all"  //可申请退款-refundable
#define unUsed_youhuiquan_saues @"unUsed"  //申请中-applying
#define using_youhuiquan_saues @"using"        //退款中-refunding
#define used_youhuiquan_saues @"used"    //退款成功-refunded
#define expired_youhuiquan_saues @"expired"    //退款成功-refunded

#define Staueusable_youhuiquan_saues @"usable"        //退款中-refunding
#define StaueisUsed_youhuiquan_saues @"isUsed"    //退款成功-refunded
#define Staueexpired_youhuiquan_saues @"expired"    //退款成功-refunded

//消息通知
#define notication_order  @"order"    //订单详情
#define notication_tips  @"tips"    //旅程
#define notication_repayment  @"repayment"    //还款成功
#define notication_activity  @"activity"    //活动
#define notication_coupon  @"coupon"    //优惠券

#define SEX_male  @"male"    //男
#define SEX_female  @"female"   //女

#define SFZ  @"idCard"
#define GUOJIHUzhao  @"passport"

//与游 二期
#define cleared  @"cleared"    /** 已结清 */
#define uncleared  @"uncleared"    /** 未结清 */

#define paid  @"paid"    /** 已结清 */
#define unpaid  @"unpaid"    /** 未结清 */
#define overdue  @"overdue"    /** 逾期了 */

///我的消息
@interface banyouNoticationS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end

@interface banyouNoticationForOneS : NSObject
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *timeStr;
@property (nonatomic,assign) NSTimeInterval time;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,assign) BOOL isRead;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *urlParam;
@property (nonatomic,strong) NSString *urlRoute;
@property (nonatomic,strong) NSString *memo;
@property (nonatomic,strong) NSMutableArray *Arry_dataMaps;
@end

@interface dataMapsOne : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *value;
@end

///我的消息 end
///我的收藏
@interface ShouCantravelsS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end
//我的收藏  end

///优惠券
@interface YHQS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end

@interface YHQoneS : NSObject
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *condition;
@property (nonatomic,strong) NSString *expireStr;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) double price;
@property (nonatomic,strong) NSString *status;
@end
///end

///推荐的
@interface TuijietravelsS : NSObject
@property (nonatomic,strong) NSMutableArray *travelsA;
@end
///推荐的end

///还款记录
@interface periodItemListAForAll : NSObject
@property (nonatomic,strong) NSString *goDate;
@property (nonatomic,strong) NSString *orderSn;
@property (nonatomic,strong) NSMutableArray *periodItemListA;
@property (nonatomic,strong) NSNumber *travelId;
@property (nonatomic,strong) NSString *travelName;
@end

@interface periodItemListAForONeS : NSObject
@property (nonatomic,strong) NSString *idx;
@property (nonatomic,strong) NSString *paidDate;
@property (nonatomic,strong) NSString *repayment;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *statusCh;
@property (nonatomic,strong) NSString *interest;
@end
///还款记录  end

///我的分期明细 开始
@interface rePaymentInfoAll : NSObject
@property (nonatomic,strong) NSMutableArray *rePaymentInfoA;
@end

@interface rePaymentInfoAllForONeS : NSObject
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSNumber *billId;
@property (nonatomic,strong) NSMutableArray *introduces;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *paymentDate;
@property (nonatomic,strong) NSString *paymentMethod;
@property (nonatomic,strong) NSString *sn;
@end

///我的分期明细 end
//我的分期主页  数据
@interface myStageHome : NSObject
@property (nonatomic,strong) NSMutableArray *billInfoNowA;
@property (nonatomic,strong) NSString *interest;
@property (nonatomic,strong) NSString *overdueTitle;
@property (nonatomic,strong) NSNumber *count;
@property (nonatomic,strong) NSString *orderTotals;
@property (nonatomic,strong) NSNumber *overdueDays;
@property (nonatomic,strong) NSString *periodRepaymentSum;
@property (nonatomic,strong) NSString *repaymentDate;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *statusCh;
@property (nonatomic,strong) NSString *billName;
@property (nonatomic,strong) NSString *billSn;
@property (nonatomic,strong) NSMutableArray *periodInfoAllA;
@property (nonatomic,strong) NSString *debitNotice;
@property (nonatomic,strong) NSString *paymentMethod;
@end

@interface myStageHomeListForOne : NSObject  //列表中的一个数据
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSString *interest;
@property (nonatomic,strong) NSString *idx;
@property (nonatomic,strong) NSNumber *periodId;
@property (nonatomic,strong) NSString *periodRepayment;

@property (nonatomic,strong) NSString *repaymentDate;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *statusCh;
@property (nonatomic,strong) NSNumber *travelId;
@property (nonatomic,strong) NSString *travelName;
@property (nonatomic,strong) NSString *sn;
@property (nonatomic,strong) NSMutableArray *agreement;

@end
////  //我的分期主页  数据 END
//我的心愿卡
@interface myHeartHome : NSObject
@property (nonatomic,strong) NSMutableArray *travelsA;
@property (nonatomic,strong) NSString *cardNo;
@end
////  //我的分期主页  数据 END

///首页
@interface travelsS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end

@interface contentS : NSObject
@property (nonatomic,strong) NSString *typeCh;
@property (nonatomic,strong) NSString *methodCh;
@property (nonatomic,strong) NSString *joinUsersCh;
@property (nonatomic,assign) NSInteger joinUsersCount;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,assign) NSInteger order;
@property (nonatomic,assign) NSInteger sn;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *days;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *bookingNotes;
@property (nonatomic,strong) NSArray *imagesA;
@property (nonatomic,assign) BOOL isPeriod;
@property (nonatomic,strong) NSArray *fromCitysA;
@property (nonatomic,strong) NSArray *travelKitsA;
@property (nonatomic,strong) tagsS *tagsD;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSArray *joinUsersA;
@property (nonatomic,strong) NSString *coverImage;
@property (nonatomic,strong) NSArray *aboardPlaceA;
@property (nonatomic,strong) NSString *aboardPlacesCh;
@property (nonatomic,strong) NSString *fromCityCh;
@property (nonatomic,strong) NSString *toCityCh;
@property (nonatomic,strong) NSString *dayCh;
@property (nonatomic,strong) NSNumber *minPeriodPrice;
@end
////

///群成员
@interface membersGroupS : NSObject
@property (nonatomic,strong) NSMutableArray *membersA;
@property (nonatomic,strong) NSMutableArray *Arry_notices;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *shareContent; //url
@property (nonatomic,strong) NSString *shareImage; //url
@property (nonatomic,strong) NSString *shareTitle; //url
@property (nonatomic,strong) NSString *shareUrl;    //url
@end

@interface Arry_notices_one : NSObject
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *notice;
@end

@interface groupsForOneS : NSObject
@property (nonatomic,strong) NSString *avatar;
@property (nonatomic,strong) NSString *emChatId;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,assign) BOOL isFollow;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSString *signature;
@property (nonatomic,strong) NSString *type;
@end

///群成员 end

///我的联系人 和群组
@interface contactsAndgroups : NSObject
@property (nonatomic,strong) NSMutableArray *contactsA;
@property (nonatomic,strong) NSMutableArray *groupsA;
@end


@interface groupsS : NSObject
@property (nonatomic,strong) NSString *idd;
@property (nonatomic,strong) NSMutableArray *images;
@property (nonatomic,strong) NSString *name;
@end
///我的联系人 和群组 end

///产品详情
@interface priceMonthsS : NSObject
@property (nonatomic,strong) NSString *month;
@property (nonatomic,strong) NSArray *pricesA;
@end


///产品详情
@interface priceMonthsTwoS : NSObject
@property (nonatomic,strong) NSString *month;
@property (nonatomic,strong) NSArray *Arry_monthPrice;
@end


@interface pricesS : NSObject
//@property (nonatomic,strong) initiatesS *initiates;

@property (nonatomic,strong) NSNumber *firstPayPrice;
@property (nonatomic,assign) NSInteger stock;
@property (nonatomic,strong) NSNumber *price;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *week;
@property (nonatomic,strong) NSString *periodPayPriceStr; 
@property (nonatomic,strong) NSString *firstPayPriceStr;
@property (nonatomic,strong) NSNumber *periodPayPrice;
@end


//@interface initiatesS : NSObject
//@property (nonatomic,strong) NSNumber *firstPayPrice;
//@property (nonatomic,strong) NSNumber *periodPayPrice;
//@property (nonatomic,strong) NSNumber *price;
//@property (nonatomic,strong) NSNumber *specificationId;
//@property (nonatomic,strong) NSNumber *stock;
//@end


@interface detailS : NSObject
@property (nonatomic,assign) CGFloat detailUrlH;
@property (nonatomic,assign) CGFloat linesUrlH;
@property (nonatomic,assign) BOOL detaiisLoadSucces;
@property (nonatomic,assign) BOOL lineisLoadSucces;

@property (nonatomic,strong) NSString *detailHtmlStr; //url

@property (nonatomic,strong) NSString *firstRepayment; //首付
@property (nonatomic,strong) NSString *periodRepayment;    //多少期


@property (nonatomic,strong) NSString *detailUrl; //url
@property (nonatomic,strong) NSString *linesUrl;    //url
@property (nonatomic,assign) BOOL isFavorite;
@property (nonatomic,strong) NSArray *priceMonthsA;
@property (nonatomic,strong) contentS *travelD;
@property (nonatomic,strong) NSArray *commentsA;

@property (nonatomic,strong) NSString *shareContent; //url
@property (nonatomic,strong) NSString *shareImage; //url
@property (nonatomic,strong) NSString *shareTitle; //url
@property (nonatomic,strong) NSString *shareUrl;    //url
@end
////产品详情end

///全局参数
@interface appcommonglobalS : NSObject
@property (nonatomic,strong) NSString *phone; //url
@property (nonatomic,strong) NSString *license; //url
@property (nonatomic,strong) NSString *shareContent; //url
@property (nonatomic,strong) NSString *shareImage; //url
@property (nonatomic,strong) NSString *shareTitle; //url
@property (nonatomic,strong) NSString *shareUrl;    //url
@property (nonatomic,strong) NSString *appStartUpImage;    //url
@property (nonatomic,strong) IOSSpecialS *IOSSpecialD;
@property (nonatomic,strong) NSMutableArray *banksA;
@property (nonatomic,strong) popupS *popup;
@end

    
@interface popupS : NSObject
@property (nonatomic,assign) BOOL isBrowser;
@property (nonatomic,strong) NSString *image; //==@“1” 表示要  否则不要 审核通过写1，否则写0
@property (nonatomic,strong) NSURL *url; //==@“1” 表示要  否则不要
@end
    

@interface IOSSpecialS : NSObject
@property (nonatomic,strong) NSString *IsDisplayUpdate; //==@“1” 表示要  否则不要 审核通过写1，否则写0
@property (nonatomic,strong) NSString *IsInstallTPay; //==@“1” 表示要  否则不要
@property (nonatomic,strong) NSString *IsShowWb; //==@“1” 表示要  否则不要  是否显示微博
//@property (nonatomic,strong) NSString *AppIdAppStore; //appID  号码
@end


@interface bankS : NSObject
@property (nonatomic,strong) NSString *code;
@property (nonatomic,strong) NSString *logo;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSNumber *idd;
@end
///全局参数 end


///出行人
@interface travellersS : NSObject
@property (nonatomic,strong) NSMutableArray *travellersA;
@end


@interface travellerS : NSObject
@property (nonatomic,strong) NSString *birth;
@property (nonatomic,strong) NSString *firstname;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *idNumber;
@property (nonatomic,strong) NSString *passportNumber;
@property (nonatomic,strong) NSString *idPeriod;
@property (nonatomic,strong) NSString *idType;
@property (nonatomic,assign) BOOL isDefault;
@property (nonatomic,strong) NSString *lastname;
@property (nonatomic,strong) NSString *realname;
@end
///出行人end

///订单信息
@interface orderInfo : NSObject

@property (nonatomic,strong) NSString *discount;
@property (nonatomic,strong) NSNumber *amount;
@property (nonatomic,strong) NSString *paymentPluginsA;
@property (nonatomic,strong) NSArray *feesA;
@property (nonatomic,strong) contentS *travelD;
@property (nonatomic,strong) NSString *defaultPaymentPlugin;
@property (nonatomic,strong) travellerS *defaultTravellerD;

@property (nonatomic,strong) NSString *firstRepayment; 
@property (nonatomic,strong) NSString *adultPrice;
@property (nonatomic,strong) NSString *adultNum;
@property (nonatomic,strong) NSString *childPrice;
@property (nonatomic,strong) NSString *childNum;

@property (nonatomic,strong) NSMutableArray *agreement;
@end


@interface agreementS : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *url;
@end


@interface paymentPluginsS : NSObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *logo;
@property (nonatomic,strong) NSString *idd;
@end

@interface feesS : NSObject
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,assign) BOOL isInclude;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) double price;
@property (nonatomic,strong) NSString *memo;
@end

@interface orderOk : NSObject
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSNumber *amountPayable;
@property (nonatomic,strong) NSString *couponDiscount;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *fromCity;
@property (nonatomic,strong) NSString *paymentPluginId;
@property (nonatomic,strong) NSString *sn;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *travelName;
@property (nonatomic,strong) NSArray *travellersA;

@property (nonatomic,strong) NSString *debitNotice;
@property (nonatomic,strong) NSString *paymentMethod;
@end
///订单信息end

///将要拉起第三发支付时 返回的数据
@interface ThirdPayment : NSObject
@property (nonatomic,strong) NSString *prepayid;
@property (nonatomic,strong) NSString *package;
@property (nonatomic,strong) NSString *shareTitle;
@property (nonatomic,strong) NSString *appid;
@property (nonatomic,strong) NSString *orderSn;
@property (nonatomic,strong) NSString *shareContent;
@property (nonatomic,assign) NSInteger timestamp;
@property (nonatomic,strong) NSString *sign;
@property (nonatomic,strong) NSString *partnerid;
@property (nonatomic,strong) NSString *noncestr;
@property (nonatomic,strong) NSString *emChatGroupId;
@property (nonatomic,strong) NSString *shareUrl;
@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic,strong) NSString *shareImage;


@property (nonatomic,strong) NSString *businessID;
@property (nonatomic,strong) NSString *businessName;
@property (nonatomic,assign) double money;
@property (nonatomic,strong) NSString *businessType;
@property (nonatomic,strong) NSString *supportTcoin;
@end
///app的用户信息end



@interface toutInfoMode : NSObject
@property (nonatomic,strong) NSString *appId;
@property (nonatomic,strong) NSString *appSecret;
@end

@interface tokenInfoMode : NSObject
@property (nonatomic,strong) NSString *accessToken;
@property (nonatomic,strong) NSNumber *expireTime;
@property (nonatomic,strong) NSString *sessionKey;
@property (nonatomic,strong) NSString *sessionSecret;
@end

///app的用户信息
@interface appS : NSObject
@property (nonatomic,assign) BOOL isBindingBankCard;
@property (nonatomic,assign) BOOL isPeriodEnabled;
@property (nonatomic,strong) NSString *emChatId;
@property (nonatomic,strong) NSString *avatar;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *nickName;
@end
///app的用户信息end



///计算订单
@interface jisuanInfo : NSObject//
@property (nonatomic,strong) NSString *discount;
@property (nonatomic,strong) NSString *adultNum;
@property (nonatomic,strong) NSString *adultPrice;
@property (nonatomic,strong) NSString *childPrice;
@property (nonatomic,strong) NSString *childNum;
@property (nonatomic,strong) NSNumber *amount;
@property (nonatomic,strong) NSString *couponDiscount;
@property (nonatomic,strong) NSString *firstRepayment;
@property (nonatomic,strong) NSMutableArray *periodDetails;
@end

@interface jisuanInfoForOne : NSObject//
@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSString *period;
@end
///计算订单 end

///风险验证
@interface RiskVerification : NSObject
@property (nonatomic,assign) BOOL fright;
@property (nonatomic,assign) BOOL info;
@property (nonatomic,assign) BOOL risk;
@end
///风险验证end

///旅程信息 每一个end
@interface JourneyOneS : NSObject
@property (nonatomic,strong) pageableS *pageable; 
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;

@property (nonatomic,assign) NSInteger orderId;
@property (nonatomic,assign) NSInteger travelId;
@property (nonatomic,assign) NSInteger currentItemId;
@property (nonatomic,strong) NSMutableArray *travelLineItemsA;
@property (nonatomic,strong) NSString *travelName;
@end

@interface JourneyOneINOneS : NSObject
@property (nonatomic,strong) NSString *dateText;
@property (nonatomic,strong) NSString *hourText;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSArray *imagesA;
@property (nonatomic,strong) NSString *tips;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSArray *travelSharingsA;

@property (nonatomic,strong) aboardInfoAndhotelInfoS *aboardInfoD;
@property (nonatomic,strong) aboardInfoAndhotelInfoS *hotelInfoD;
@property (nonatomic,strong) aboardInfoAndhotelInfoS *otherInfoD;
@property (nonatomic,strong) aboardInfoAndhotelInfoS *scenicInfoD;
@end

@interface travelSharingsS : NSObject
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSMutableArray *itemsA;
@property (nonatomic,strong) NSString *path;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *userAvatar;
@property (nonatomic,strong) NSString *username;

@property (nonatomic,strong) NSString *travelId;
@property (nonatomic,strong) NSString *coverImage;
@property (nonatomic,strong) NSString *createDateStr;
@property (nonatomic,assign) NSInteger hits;
@property (nonatomic,assign) NSInteger thumbsUpCounts;//
@property (nonatomic,assign) BOOL isThumbsUp;//
@property (nonatomic,strong) shareInfoS *shareInfo; 
@property (nonatomic,strong) NSString *shareContent;
@property (nonatomic,strong) NSString *shareImage;
@property (nonatomic,strong) NSString *shareTitle;
@property (nonatomic,strong) NSString *shareUrl;

@property (nonatomic,strong) NSString *content;
@end

@interface shareInfoS : NSObject
@property (nonatomic,strong) NSString *shareContent;
@property (nonatomic,strong) NSString *shareImage;
@property (nonatomic,strong) NSString *shareTitle;
@property (nonatomic,strong) NSString *shareUrl;
@end

@interface itemsS : NSObject
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) PHAsset *imagePhaset;  //自己加的  非后返回
@property (nonatomic,strong) NSString *type;
@property (nonatomic,assign) NSInteger idd;
@end

@interface aboardInfoAndhotelInfoS : NSObject
@property (nonatomic,strong) NSString *flightNo;
@property (nonatomic,strong) NSString *fromPlace;
@property (nonatomic,strong) NSString *fromTime;
@property (nonatomic,strong) NSString *method;
@property (nonatomic,strong) NSString *toPlace;
@property (nonatomic,strong) NSString *toTime;

@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSString *inTime;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *outTime;

@property (nonatomic,strong) NSString *amount;
@property (nonatomic,strong) NSString *count;
@property (nonatomic,strong) NSString *date;
@end
///旅程信息 每一个end
///开始 旅程提醒
@interface aboardInfoTixingS : NSObject
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *image;
@property (nonatomic,strong) NSArray *daylineA;
@property (nonatomic,strong) NSArray *tipsA;
@property (nonatomic,strong) NSArray *travelKitsA;
@end

@interface daylineS : NSObject
@property (nonatomic,strong) NSString *day;
@property (nonatomic,strong) NSString *itemTitles;
@property (nonatomic,strong) NSString *title;
@end

@interface tipsS : NSObject
@property (nonatomic,strong) NSString *tips;
@property (nonatomic,strong) NSString *title;
@end

@interface travelKitsS : NSObject
@property (nonatomic,strong) NSString *content;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *title;
@end

////旅程提醒end
//标签印象  开始
@interface impressionsAAS : NSObject
@property (nonatomic,strong) NSMutableArray *impressionsA;
@end
//标签印象  结束

//旅程相册  开始
@interface lcxctravelS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end
//旅程相册  结束

///开始 我的
@interface myAppInfoS : NSObject
@property (nonatomic,assign) NSInteger couponCount;
@property (nonatomic,strong) NSString *avatar;
@property (nonatomic,strong) NSString *followCount;
@property (nonatomic,strong) NSString *followerCount;
@property (nonatomic,strong) NSString *messageCount;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) orderCountS *orderCountD;
@property (nonatomic,strong) periodInfoS *periodInfo;
@property (nonatomic,strong) NSArray *sharingsA;
@property (nonatomic,strong) banyouNoticationForOneS *MynewNotify;
@end

@interface orderCountS : NSObject
@property (nonatomic,assign) NSInteger refundCancelCount;
@property (nonatomic,assign) NSInteger unCommentCount;
@property (nonatomic,assign) NSInteger unPaidCount;
@property (nonatomic,assign) NSInteger unTripCount;
@end

@interface periodInfoS : NSObject
@property (nonatomic,strong) NSString *remainDays;
@property (nonatomic,strong) NSString *overdueDays;
@property (nonatomic,strong) NSString *periodRepaymentSum;
@property (nonatomic,strong) NSNumber *count;
@end

//@interface sharingsS : NSObject
//@property (nonatomic,strong) NSString *image;
//@property (nonatomic,strong) NSString *url;
//@end
////我的 end

/////////////////////////////////////////////////////
@interface tagsS : NSObject
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *name;
@end
@interface pageableS : NSObject
@property (nonatomic,assign) NSInteger pageNumber;
@property (nonatomic,assign) NSInteger pageSize;
@end
///公共
@interface communalS : NSObject
@property (nonatomic,assign) NSInteger idd;//ID
@property (nonatomic,strong) NSString *createDate;//创建日期
@property (nonatomic,strong) NSString *order;//排序
@end

/// AD - 广告
@class adPositionS;
@interface AdS : NSObject
@property (nonatomic,strong) NSString *title;//创建日期
@property (nonatomic,strong) NSString *type;//排序
@property (nonatomic,strong) NSString *content;//创建日期
@property (nonatomic,strong) NSString *path;//排序
@property (nonatomic,strong) NSString *url;//创建日期
@property (nonatomic,strong) adPositionS *adPositionD;//排序
@end

/// Area – 地区
@interface AreaS : NSObject
@property (nonatomic,strong) NSString *name;//名称
@property (nonatomic,strong) NSString *fullName;//全称
@property (nonatomic,strong) AreaS *parentAreaS;//上级地区
@end

/// Article – 文章
@interface ArticleS : NSObject
@property (nonatomic,strong) NSString *name;//标题
@property (nonatomic,strong) NSString *fullName;//作者
@property (nonatomic,strong) NSString *parent;//内容
@property (nonatomic,strong) NSString *isTop;//是否置顶
@property (nonatomic,strong) NSString *hits;//点击数
@property (nonatomic,strong) ArticleCategoryS *articleCategoryD;//文章分类	参考《ArticleCategory》
@property (nonatomic,strong) TagS *tagsD;//标签	参考《Tag》
@end

/**
 *  ArticleCategory – 文章目录
 */
@interface ArticleCategoryS : NSObject
@property (nonatomic,strong) NSString *code;//编码
@property (nonatomic,strong) NSString *name;//名称
@property (nonatomic,strong) NSString *parent;//上级分类
@end

/**
 *  City – 城市
 */
typedef enum {
    china_ENUM,
    abroad_ENUM,
} InternationalizationENUM;
@interface CityS : NSObject
@property (nonatomic,strong) NSString *code;//编码
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *name;//名称
@property (nonatomic,assign) NSInteger order;
@property (nonatomic,assign) InternationalizationENUM typeE;//类型  china,/** 国外 */abroad
@end

/**
 *  Company – 供应商
 */
@interface CompanyS : NSObject
@property (nonatomic,strong) NSString *name;//名称
@property (nonatomic,strong) NSString *fullName;//全称
@property (nonatomic,strong) NSString *address;//地址
@end

/**
 *  Comment – 评论
 */
@interface CommentS : NSObject
@property (nonatomic,assign) NSInteger idd;//评论
@property (nonatomic,strong) NSString *createDate;//时间
@property (nonatomic,strong) NSString *content;//内容
@property (nonatomic,strong) NSString *reply;//内容
@property (nonatomic,strong) UserS *UserD;//评论用户	参考《User》
@property (nonatomic,strong) NSMutableArray *imagesA;//图片	图片列表、参考《Image》
@end

/**
 *  Moment – 说说
 */
@interface MomentS : NSObject
@property (nonatomic,strong) NSString *title;//标题
@property (nonatomic,strong) NSString *content;//内容
@property (nonatomic,strong) NSString *address;//地址
@property (nonatomic,strong) ImageS *ImageD;//图片	图片列表、参考《Image》
@end

/**
 *  Order – 订单
 */
//TODO


/**
 *  Image – 图片
 */
@interface ImageS : NSObject
@property (nonatomic,assign) NSInteger idd;//排序
@property (nonatomic,assign) NSInteger order;//排序
@property (nonatomic,strong) NSString *fullUrl;//图片地址
@property (nonatomic,assign) BOOL isDefault;//是否默认
@end

/**
 *  User – 用户
 */
@interface UserS : NSObject
@property (nonatomic,assign) BOOL isPeriod;
@property (nonatomic,strong) NSString *age;
@property (nonatomic,assign) NSInteger childQuantity;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *gender;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger quantity;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *mobile;//手机号码
@property (nonatomic,strong) NSString *nickName;//昵称
@property (nonatomic,strong) NSString *avatar;//	头像	头像图片地址
@property (nonatomic,strong) NSString *signature;//
@property (nonatomic,assign) BOOL isFollow;//
@property (nonatomic,strong) NSString *emChatId;//


@property (nonatomic,assign) NSInteger travelId;
@property (nonatomic,strong) NSString *numbers;//
@property (nonatomic,strong) NSString *travelImage;//
@property (nonatomic,strong) NSString *travelName;//

@property (nonatomic,strong) UIImage *image;// 我加的 不是服务器返回的 图片
@property (nonatomic,strong) PHAsset *Asset;// 我加的 不是服务器返回的 图片资源

//用户选择的月份  用户选择的 规格
@property (nonatomic,strong) NSString *month;//
@property (nonatomic,strong) NSNumber *travelSpecificationId;//
@end


//同团旅友  开始
@interface total_jousS : NSObject
@property (nonatomic,strong) NSMutableArray *travelLinesA;
@end
//同团旅友   结束



//看别人的个人 旅程  开始
@interface OtherpeoHome_pageS : NSObject
@property (nonatomic,strong) NSMutableArray *travelsA;
@property (nonatomic,strong) UserS *user;
@end


@interface OtherpeoLcOneS : NSObject
@property (nonatomic,assign) BOOL isPeriod;
@property (nonatomic,strong) NSString *beginDate;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *endDate;
@property (nonatomic,strong) NSString *toCity;

@property (nonatomic,assign) NSInteger travelId;
@property (nonatomic,strong) NSString *travelName; 
@property (nonatomic,strong) NSString *url;

@end
//看别人的个人 旅程   结束


//绑卡提交用到   开始
@interface BindBankCard : NSObject
@property (nonatomic,strong) bankS *bank;
@property (nonatomic,strong) NSString *bankCardNo;
@property (nonatomic,strong) NSString *bankCode;
@property (nonatomic,strong) NSString *idCard;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *smsCode;


@property (nonatomic,strong) NSString *bankCardType;
@property (nonatomic,strong) NSString *bankLogo;
@property (nonatomic,strong) NSString *bankName;
@property (nonatomic,strong) NSString *realname;
@end
//绑卡提交用到   结束

//
@interface myhome : NSObject
@property (nonatomic,strong) NSString *titleStr;
@property (nonatomic,strong) NSString *iconStr;
@end
//
@interface mytime : NSObject
@property (nonatomic,strong) NSString *timeStr;
@property (nonatomic,strong) NSMutableArray *arry;
@end

//草稿  开始

@interface mydraft : NSObject
@property (nonatomic,assign) NSInteger travelId; //对应游记的id
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray *arry;
@end

@interface draftForOne : NSObject
@property (nonatomic,strong) NSString *content;//描叙
@property (nonatomic,strong) NSData *image;//图片数据
@property (nonatomic,strong) NSString *creatTime;//创建时间
@end
//草稿   结束


//个人主页  开始
@interface peoHome_page : NSObject
@property (nonatomic,assign) NSInteger followCount;
@property (nonatomic,assign) NSInteger followerCount;
@property (nonatomic,strong) NSArray *impressionsA;
@property (nonatomic,assign) BOOL isFollow;   //我是否关注了他
@property (nonatomic,assign) BOOL isFollowed;   //他是否关注了我
@property (nonatomic,strong) NSMutableArray *sharingsA;
@property (nonatomic,assign) NSInteger travelCount;
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,assign) NSInteger publishTravels;
@property (nonatomic,strong) UserS *user;
@end

@interface impressionsS : NSObject
@property (nonatomic,assign) NSInteger count;//
@property (nonatomic,strong) NSString *tag;//
@end
//个人主页结束

//关注和 被关注
@interface guanzhuAndBeisS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end
//end

//订单详情  开始
@interface orderDeatailS : NSObject
//@property (nonatomic,assign) double couponDiscount;

@property (nonatomic,strong) orderlistForOneS *orderD;
@property (nonatomic,strong) NSArray *orderTravellersA;
@property (nonatomic,strong) NSString *refundStatus;

@property (nonatomic,strong) NSNumber *amount;
@property (nonatomic,strong) NSString *amountPayable;
@property (nonatomic,strong) NSString *company;
@property (nonatomic,strong) NSString *couponDiscount;
@property (nonatomic,strong) NSString *discount;
@property (nonatomic,assign) int expireSecond;
@property (nonatomic,assign) NSInteger mobile;

@property (nonatomic,strong) NSString *paymentMethod;
@property (nonatomic,strong) NSString *debitNotice;
@end
//订单详情  结束

//订单列表 开始
@interface orderlistS : NSObject
@property (nonatomic,strong) NSMutableArray *contentA;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end


@interface orderlistForOneS : NSObject 
@property (nonatomic,strong) NSString *couponDiscountStr;
@property (nonatomic,strong) NSString *amountPayableStr;
@property (nonatomic,strong) NSString *amountInfo;
@property (nonatomic,assign) NSInteger childQuantity;
@property (nonatomic,strong) NSString *dateFmt;
@property (nonatomic,assign) NSInteger endDate;
@property (nonatomic,assign) NSInteger idd;  
@property (nonatomic,strong) NSString *orderStatus;
@property (nonatomic,assign) BOOL expired;
@property (nonatomic,assign) BOOL commentable;  //是否可以点评

@property (nonatomic,strong) NSString *orderStatusCh;
@property (nonatomic,strong) NSString *payTime;
@property (nonatomic,strong) NSString *paymentMethod;
@property (nonatomic,assign) NSInteger quantity;
@property (nonatomic,strong) NSString *quantityInfo;
@property (nonatomic,strong) NSString *sn;
@property (nonatomic,assign) double totalPrice;
@property (nonatomic,strong) travelInfoS *travelInfoD;
@property (nonatomic,strong) NSString *periodNum; 

@end

@interface travelInfoS : NSObject
@property (nonatomic,strong) NSString *firstPriceOtherStr;// 首付 后面的
@property (nonatomic,strong) NSString *firstPriceStr;//首付+

@property (nonatomic,assign) BOOL isPeriod;//图标
@property (nonatomic,strong) NSString *city;//名称
@property (nonatomic,strong) NSString *time;//名称
@property (nonatomic,assign) NSInteger idd;//类型
@property (nonatomic,strong) NSString *image;//图标
@property (nonatomic,strong) NSString *name;//备注
@property (nonatomic,assign) double price;
@end
//订单列表 结束


/**
 *  Tag – 标签
 */
typedef enum {
    article_ENUM,
    travel_ENUM,
    hotel_ENUM,
    scenic_ENUM,
} TagLabelENUM;
@interface TagS : NSObject
@property (nonatomic,strong) NSString *name;//名称
@property (nonatomic,assign) TagLabelENUM typeE;//类型
@property (nonatomic,strong) NSString *icon;//图标
@property (nonatomic,strong) NSString *memo;//备注
@end

/**
 *  TravelDetail – 旅游产品详情
 */
typedef enum {
    image_ENUM,
    text_ENUM,
} TravelDetailtypeENUM;
@interface TravelDetailS : NSObject
@property (nonatomic,assign) NSInteger idd;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,assign) NSInteger order;
@property (nonatomic,assign) TravelDetailtypeENUM typeE;//类型

//@property (nonatomic,assign) TravelDetailtypeENUM typeE;//类型
//@property (nonatomic,strong) NSString *imageUrl;//图标路径
//@property (nonatomic,strong) NSString *content;//文本内容
//@property (nonatomic,strong) NSString *isShow;//是否显示
//@property (nonatomic,strong) NSString *travel;//旅游产品
//@property (nonatomic,strong) NSString *travelDetailCategory;//旅游详情分类
@end


#pragma --mark<二期>
/////////////////////////////////二期//////////////////////////////////////////
@interface homeDataV2 : NSObject
@property (nonatomic,strong) NSMutableArray *adsArry;
@property (nonatomic,strong) NSMutableArray *joinUserArry;
@property (nonatomic,strong) NSMutableArray *travelSharingsArry;
@property (nonatomic,strong) NSMutableArray *travelThemeListArry;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@property (nonatomic,assign) NSInteger travelSharingsTotal;
@end

@interface homecontent : NSObject
@property (nonatomic,strong) NSMutableArray *content_Arry;
@property (nonatomic,strong) pageableS *pageableD;
@property (nonatomic,assign) NSInteger total;
@property (nonatomic,assign) NSInteger totalPages;
@end


@interface ads_one : NSObject
@property (nonatomic,strong) NSURL *path;
//@property (nonatomic,strong) NSNumber *idd;
//@property (nonatomic,strong) NSString *title;
//@property (nonatomic,strong) NSString *content;
//@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSURL *url;
@end



@interface homeDataV2_Type: NSObject
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray *travels_Arry;
@end


@interface tourDetaisData : NSObject
@property (nonatomic,strong) NSURL *travelLinesUrl;
@property (nonatomic,strong) NSURL *periodTypesUrl;
@property (nonatomic,strong) NSURL *linesUrl;
@property (nonatomic,strong) NSURL *bookingNotesUrl;
@property (nonatomic,strong) NSString *periodRepayment;
@property (nonatomic,strong) NSMutableArray *Arry_travelSharings;

@property (nonatomic,strong) NSString *company;
//@property (nonatomic,strong) NSMutableArray *Arry_priceMonths;

@property (nonatomic,strong) NSString *shareTitle;
@property (nonatomic,strong) NSString *shareImage;
@property (nonatomic,strong) NSURL *travelFeelsUrl;
@property (nonatomic,strong) NSString *shareUrl;
@property (nonatomic,strong) NSURL *detailUrl;
@property (nonatomic,strong) NSString *shareContent;

@property (nonatomic,strong) NSString *minPriceStr;
@property (nonatomic,strong) contentS *travel;
@property (nonatomic,strong) NSString *periodTypeNum;
@property (nonatomic,assign) BOOL isFavorite;
@property (nonatomic,strong) NSMutableArray *Arry_initiateMonthPrice;
//@property (nonatomic,strong) NSMutableArray *Arry_comments;
@property (nonatomic,strong) NSString *couponDiscountStr;
@property (nonatomic,strong) NSString *firstRepayment;
@end

@interface tourDetaisData_Specifications : NSObject
@property (nonatomic,strong) NSNumber *initiateId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSMutableArray *Arry_monthPrice;
@end

@interface ChoiceStages_data : NSObject
@property (nonatomic,strong) NSMutableArray *Arry_agreement;
@property (nonatomic,strong) NSMutableArray *Arry_periodTypeList;
@property (nonatomic,strong) NSNumber *travelSpecificationId;
@property (nonatomic,strong) NSNumber *travelId;
@property (nonatomic,strong) NSString *date;
@end

@interface periodTypeList_one : NSObject
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *periodNum;
@end

@interface TravelItineraryList : NSObject
@property (nonatomic,assign) NSInteger totalPages;
@property (nonatomic,strong) NSMutableArray *Arry_travelItinerary;
@property (nonatomic,strong) pageableS *pageable;
@property (nonatomic,assign) NSInteger total;
@end


@interface TravelItineraryList_one : NSObject
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSURL *images;
@property (nonatomic,strong) NSString *days;
@property (nonatomic,strong) NSNumber *idd;
@property (nonatomic,strong) NSString *travelName;
@property (nonatomic,strong) NSString *statusCh;
@property (nonatomic,strong) NSString *beginDate;
@property (nonatomic,strong) NSURL *detailUrl;
@end

@interface SelectOrder_date : NSObject
@property (nonatomic,strong) NSMutableArray *Arry_orders;
@end

