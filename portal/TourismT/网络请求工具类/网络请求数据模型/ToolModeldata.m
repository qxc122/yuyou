//
//  ToolModeldata.m
//  TourismT
//
//  Created by Store on 16/12/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "ToolModeldata.h"

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */
//+ (NSDictionary *)mj_replacedKeyFromPropertyName;

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 从字典中取值用的key
 */
//+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName;


/**
 *  旧值换新值，用于过滤字典中的值
 *
 *  @param oldValue 旧值
 *
 *  @return 新值
 */
//- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property;
//    if ([property.name isEqualToString:@"publisher"]) {
//        if (oldValue == nil) return @"";
//    } else if (property.type.typeClass == [NSDate class]) {
//        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
//        fmt.dateFormat = @"yyyy-MM-dd";
//        return [fmt dateFromString:oldValue];
//    }  

@implementation ShouCantravelsS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contentA" : @"content",
             @"pageableD" : @"pageable",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"contentS",
             };
}

@end


@implementation travelsS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
                 @"contentA" : @"travels.content",
                 @"pageableD" : @"travels.pageable",
                 @"total" : @"travels.total",
                 @"totalPages" : @"travels.totalPages",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"contentS",
             };
}

@end

@implementation contentS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             @"imagesA" : @"images",
             @"tagsD" : @"tag",
             @"joinUsersA" : @"joinUsers",
             @"fromCitysA" : @"fromCitys",
             
//             @"travelKitsA" : @"travelKitsS",
//             @"tagsA" : @"tags",
//             @"joinUsersA" : @"joinUsers",
//             @"aboardPlaceA" : @"aboardPlaceS",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"imagesA" : @"ImageS",
             @"joinUsersA" : @"UserS",
             @"fromCitysA" : @"CityS",
//             @"travelKitsA" : @"travelKitsS",
//             @"tagsA" : @"TagS",
//
//             @"aboardPlaceA" : @"aboardPlaceS",
             };
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"fromCityCh"]) {
        if (oldValue) {
            if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *old = (NSString *)oldValue;
                NSString *end = @"出发";
                if ([old hasSuffix:end]) {
                    return old;
                } else {
                    return [old  stringByAppendingString:end];
                }
            }else{
                return nil;
            }
        } else {
            return nil;
        }
    }
    return oldValue;
}
@end


///群成员
@implementation membersGroupS
MJExtensionCodingImplementation
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"membersA" : @"members",
             @"Arry_notices" : @"notices",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"membersA" : @"groupsForOneS",
             @"Arry_notices" : @"Arry_notices_one",
             };
}
@end


@implementation Arry_notices_one
MJExtensionCodingImplementation
@end

@implementation groupsForOneS
MJExtensionCodingImplementation
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end




///产品详情
@implementation priceMonthsS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"pricesA" : @"prices",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"pricesA" : @"pricesS",
             };
}

@end


@implementation priceMonthsTwoS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_monthPrice" : @"monthPrice",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_monthPrice" : @"pricesS",
             };
}
@end


@implementation pricesS

@end

//@implementation initiatesS
//
//@end

@implementation detailS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"priceMonthsA" : @"priceMonths",
             @"travelD" : @"travel",
             @"commentsA" : @"comments",
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"priceMonthsA" : @"priceMonthsS",
             @"commentsA" : @"CommentS",
             };
}

@end
////产品详情end


///计算订单
@implementation jisuanInfo
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"periodDetails" : @"jisuanInfoForOne",
             };
}
@end

@implementation jisuanInfoForOne

@end
///计算订单 end


///我的联系人 和群组
@implementation contactsAndgroups

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contactsA" : @"contacts",
             @"groupsA" : @"groups",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contactsA" : @"UserS",
             @"groupsA" : @"groupsS",
             };
}
@end

@implementation groupsS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end
///我的联系人 和群组 end



//关注和 被关注
@implementation guanzhuAndBeisS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contentA" : @"content",
             @"pageableD" : @"pageable",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"UserS",
             };
}
@end
//end


//我的心愿卡
@implementation myHeartHome

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelsA" : @"travels",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travelsA" : @"contentS",
             };
}
@end
////  //我的分期主页  数据 END

//绑卡提交用到   开始
@implementation BindBankCard

@end
//绑卡提交用到   结束



//看别人的个人 旅程  开始
@implementation OtherpeoHome_pageS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelsA" : @"travels",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travelsA" : @"OtherpeoLcOneS",
             };
}
@end

@implementation OtherpeoLcOneS

@end
//看别人的个人 旅程   结束


///推荐的
@implementation TuijietravelsS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelsA" : @"travels",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travelsA" : @"contentS",
             };
}
@end
///推荐的end

///全局参数
@implementation appcommonglobalS
MJExtensionCodingImplementation
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"IOSSpecialD" : @"IOSSpecial",
            @"banksA" : @"banks",
             
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"banksA" : @"bankS",
             };
}
@end

@implementation popupS
MJExtensionCodingImplementation
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"url"]) {
        if (!oldValue) {
            return nil;
        } else {
            if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *url = (NSString *)oldValue;
                if (url && url.length) {
                    return [NSURL URLWithString:url];
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
        }
    }
    return oldValue;
}
@end


@implementation bankS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
MJExtensionCodingImplementation
@end

@implementation IOSSpecialS
MJExtensionCodingImplementation
@end
///全局参数 end


///出行人
@implementation travellersS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travellersA" : @"travellers",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travellersA" : @"travellerS",
             };
}
@end


@implementation travellerS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"firstname"] || [property.name isEqualToString:@"lastname"]) {
        if (oldValue == nil){
            return @"";
        }else if([oldValue isKindOfClass:[NSString class]]){
            NSString *tmp = (NSString *)oldValue;
            return [tmp uppercaseString];
        }else{
            return @"";
        }
    }
    return oldValue;
}
@end
///出行人end

///订单信息
@implementation orderInfo

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelD" : @"travel",
             @"defaultTravellerD" : @"defaultTraveller",
             @"paymentPluginsA" : @"paymentPlugins",
             @"feesA" : @"fees",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"paymentPluginsA" : @"paymentPluginsS",
             @"feesA" : @"feesS",
             @"agreement" : @"agreementS",
             };
}
@end

@implementation paymentPluginsS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end


@implementation agreementS


@end


@implementation feesS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end
@implementation orderOk

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travellersA" : @"travellers",
             @"idd" : @"id",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travellersA" : @"travellerS",
             };
}
@end

///订单信息end


//同团旅友  开始
@implementation total_jousS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelLinesA" : @"travelLines",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travelLinesA" : @"UserS",
             };
}
@end
//同团旅友   结束


@implementation toutInfoMode
MJExtensionCodingImplementation
@end

@implementation tokenInfoMode
MJExtensionCodingImplementation
@end


///app的用户信息
@implementation appS
/**
 *  这个数组中的属性名将会被忽略：不进行归档
 */
//+ (NSMutableArray *)mj_totalIgnoredCodingPropertyNames{
//    return [@[@"avatar",@"nickname",@"mobile"] mutableCopy];
//}
MJExtensionCodingImplementation
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
              @"emChatId" : @"user.emChatId",
             @"avatar" : @"user.avatar",
             @"idd" : @"user.id",
             @"mobile" : @"user.mobile",
             @"nickName" : @"user.nickName",
              @"isBindingBankCard" : @"user.isBindingBankCard",
              @"isPeriodEnabled" : @"user.isPeriodEnabled",
             };
}
@end
///app的用户信息end


///风险验证
@implementation RiskVerification

@end
///风险验证end



///旅程信息  每一个的
@implementation JourneyOneS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelLineItemsA" : @"travelLineItems",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travelLineItemsA" : @"JourneyOneINOneS",
             };
}
@end
@implementation myhome

@end
@implementation mytime

@end

//草稿  开始
@implementation mydraft
MJExtensionCodingImplementation
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"arry" : @"draftForOne",
             };
}
@end

@implementation draftForOne
MJExtensionCodingImplementation
@end
//草稿   结束


@implementation JourneyOneINOneS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             @"imagesA" : @"images",
             @"travelSharingsA" : @"travelSharings",
             @"aboardInfoD" : @"aboardInfo",
             @"hotelInfoD" : @"hotelInfo",
             @"otherInfoD" : @"otherInfo",
             @"scenicInfoD" : @"scenicInfo",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"imagesA" : @"ImageS",
             @"travelSharingsA" : @"travelSharingsS",
             };
}
@end

@implementation travelSharingsS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             @"itemsA" : @"items",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"itemsA" : @"itemsS",
             };
}
@end

@implementation shareInfoS

@end


@implementation itemsS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end

@implementation aboardInfoAndhotelInfoS

@end
///end

///将要拉起第三发支付时 返回的数据
@implementation ThirdPayment
MJExtensionCodingImplementation
@end
///app的用户信息end


//旅程相册  开始
@implementation lcxctravelS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contentA" : @"content",
             @"pageableD" : @"pageable",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"travelSharingsS",
             };
}
@end
//旅程相册  结束

//订单列表 开始
@implementation orderlistS  

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contentA" : @"content",
             @"pageableD" : @"pageable",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"orderlistForOneS",
             };
}
@end

@implementation orderlistForOneS
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"periodNum"]) {
        if (oldValue) {
            if ([oldValue isKindOfClass:[NSNumber class]]) {
                return [NSString stringWithFormat:@"%@",oldValue];
            } else if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *tmp = oldValue;
                if (tmp.length) {
                    return tmp;
                } else {
                    return NoStagingString;
                }
            }else{
                return NoStagingString;
            }
        } else {
            return NoStagingString;
        }
    }
    return oldValue;
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travelInfoD" : @"travelInfo",
             @"idd" : @"id",
             };
}
@end

@implementation travelInfoS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end
//订单列表 结束

//订单详情  开始
@implementation orderDeatailS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"orderTravellersA" : @"orderTravellers",
             @"orderD" : @"order",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"orderTravellersA" : @"travellerS",
             };
}
@end
//订单详情  结束


//个人主页  开始
@implementation peoHome_page

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"impressionsA" : @"impressions",
             @"sharingsA" : @"sharings",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"impressionsA" : @"impressionsS",
             @"sharingsA" : @"travelSharingsS",
             };
}
@end



@implementation impressionsS

@end

//个人主页结束

///优惠券
@implementation YHQS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"pageableD" : @"pageable",
             @"contentA" : @"content",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"YHQoneS",
             };
}
@end

@implementation YHQoneS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end
///end

//标签印象  开始
@implementation impressionsAAS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"impressionsA" : @"impressions",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"impressionsA" : @"impressionsS",
             };
}
@end
//标签印象  结束




///开始 旅程提醒

@implementation aboardInfoTixingS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"daylineA" : @"dayline",
             @"tipsA" : @"tips",
              @"travelKitsA" : @"travelKits.travelKitsItems",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"daylineA" : @"daylineS",
              @"tipsA" : @"tipsS",
              @"travelKitsA" : @"travelKitsS",
             };
}
@end
@implementation daylineS

@end

@implementation tipsS

@end
@implementation travelKitsS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}
@end
////旅程提醒end

///我的消息
@implementation banyouNoticationS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"contentA" : @"content",
             @"pageableD" : @"pageable",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"contentA" : @"banyouNoticationForOneS",
             };
}
@end

@implementation banyouNoticationForOneS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             @"Arry_dataMaps" : @"dataMaps",
             
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_dataMaps" : @"dataMapsOne",
             };
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"content"]) {
        if (!oldValue) {
            return @"无内容";
        } else if([oldValue isKindOfClass:[NSString class]]){
            NSString *tmp = (NSString *)oldValue;
            if (tmp && tmp.length) {
                return oldValue;
            } else {
                return @"无内容";
            }
        }else{
            return nil;
        }
    }
    return  oldValue;
}


@end
///我的消息 end

@implementation dataMapsOne

@end


//我的分期主页  数据
@implementation myStageHome
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"billInfoNowA" : @"billInfoNow",
             @"periodInfoAllA" : @"periodInfoAll", 
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"billInfoNowA" : @"myStageHomeListForOne",
             @"periodInfoAllA" : @"myStageHomeListForOne",
             };
}
@end

@implementation myStageHomeListForOne
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"agreement" : @"agreementS",
             };
}
@end
//我的分期主页  数据 END

///还款记录
@implementation rePaymentInfoAll
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"rePaymentInfoA" : @"rePaymentInfo",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"rePaymentInfoA" : @"rePaymentInfoAllForONeS",
             };
}
@end

@implementation rePaymentInfoAllForONeS

@end

///还款记录  end


///还款记录
@implementation periodItemListAForAll

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"periodItemListA" : @"periodItemList",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"periodItemListA" : @"periodItemListAForONeS",
             };
}
@end

@implementation periodItemListAForONeS

@end
///还款记录  end


///开始 我的
@implementation myAppInfoS

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"orderCountD" : @"orderCount",
             @"sharingsA" : @"sharings",
             @"MynewNotify" : @"newNotify",
             
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"sharingsA" : @"travelSharingsS",
             };
}
@end
@implementation orderCountS

@end

@implementation periodInfoS

@end
//@implementation sharingsS
//MJExtensionCodingImplementation
//@end

////我的 end

@implementation tagsS

@end

@implementation pageableS

@end

@implementation communalS

@end

@implementation AdS

@end

@implementation AreaS

@end

@implementation ArticleS

@end

@implementation ArticleCategoryS

@end

@implementation CityS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"idd" : @"id",
             @"typeE" : @"type",
             };
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"typeE"]) {
        if ([oldValue isEqualToString:@"china"]) {
            return @(china_ENUM); //国内
        } else if ([oldValue isEqualToString:@"abroad"]){
            return @(abroad_ENUM); //国外
        }
    }
    return oldValue;
}
@end

@implementation CompanyS

@end

@implementation CommentS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
            @"idd" : @"id",
             @"UserD" : @"user",
             @"imagesA" : @"images",
             };
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"imagesA" : @"ImageS",
             };
}
  
@end

@implementation MomentS

@end

@implementation ImageS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"idd" : @"id",
             };
}
@end


@implementation UserS
MJExtensionCodingImplementation
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"idd" : @"id",
             };
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"numbers"]) {
        if (!oldValue) {
            return nil;
        } else {
            NSString *endStr = @"人已报名";
            if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *old = (NSString *)oldValue;
                if (![old hasSuffix:endStr]) {
                    return [old stringByAppendingString:endStr];
                }
                return old;
            } else if([oldValue isKindOfClass:[NSNumber class]]){
                NSNumber *old = (NSNumber *)oldValue;
                return [[NSString stringWithFormat:@"%@",old] stringByAppendingString:endStr];
            }else{
               return nil;
            }
        }
    }
    return oldValue;
}
@end


@implementation TagS

@end


@implementation TravelDetailS
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"typeE" : @"type",
             };
}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"typeE"]) {
        if ([oldValue isEqualToString:@"image"]) {
            return @(image_ENUM);
        } else if ([oldValue isEqualToString:@"text"]){
            return @(text_ENUM);
        }
    }
    return oldValue;
}
@end



#pragma --mark<二期>
/////////////////////////////////二期//////////////////////////////////////////
@implementation homeDataV2
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"adsArry" : @"ads",
             @"joinUserArry" : @"joinUser",
             @"travelSharingsArry" : @"travelSharings",
             @"travelThemeListArry" : @"travelThemeList",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"adsArry" : @"ads_one",
             @"joinUserArry" : @"UserS",
             @"travelSharingsArry" : @"travelSharingsS",
             @"travelThemeListArry" : @"homeDataV2_Type",
             };
}


@end

@implementation homecontent
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"content_Arry" : @"content",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"content_Arry" : @"travelSharingsS",
             };
}
@end

@implementation ads_one
//+ (NSDictionary *)mj_replacedKeyFromPropertyName{
//    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
//    return @{
//             @"idd" : @"id",
//             };
//}
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"url"] || [property.name isEqualToString:@"path"]) {
        if (!oldValue) {
            return nil;
        } else {
            if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *url = (NSString *)oldValue;
                if (url && url.length) {
                    return [NSURL URLWithString:url];
                } else {
                    return nil;
                }
            } else {
                return nil;
            }
        }
    }
    return oldValue;
}
@end


@implementation homeDataV2_Type
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"travels_Arry" : @"travels",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"travels_Arry" : @"contentS",
             };
}
@end

@implementation tourDetaisData
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_travelSharings" : @"travelSharings",
//             @"Arry_priceMonths" : @"priceMonths",
             @"Arry_initiateMonthPrice" : @"initiateMonthPrice",
//             @"Arry_comments" : @"comments",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_travelSharings" : @"travelSharingsS",
//             @"Arry_priceMonths" : @"priceMonthsS",
             @"Arry_initiateMonthPrice" : @"tourDetaisData_Specifications",
//             @"Arry_comments" : @"homeDataV2_Type",
             };
}



- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"periodTypesUrl"] || [property.name isEqualToString:@"linesUrl"] || [property.name isEqualToString:@"bookingNotesUrl"]  || [property.name isEqualToString:@"travelFeelsUrl"]  || [property.name isEqualToString:@"detailUrl"]  || [property.name isEqualToString:@"travelLinesUrl"]) {
        if (!oldValue) {
            return nil;
        } else {
            if ([oldValue isKindOfClass:[NSString class]]) {
                NSString *url = (NSString *)oldValue;
                return [NSURL URLWithString:url];
            } else {
                return nil;
            }
        }
    }
    return oldValue;
}
@end

@implementation tourDetaisData_Specifications
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_monthPrice" : @"monthPrice",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_monthPrice" : @"priceMonthsTwoS",
             };
}
@end

@implementation ChoiceStages_data
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_periodTypeList" : @"periodTypeList",
             @"Arry_agreement" : @"agreement",
             
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_periodTypeList" : @"periodTypeList_one",
             @"Arry_agreement" : @"agreementS", 
             };
}
@end


@implementation periodTypeList_one

@end


@implementation TravelItineraryList
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_travelItinerary" : @"content",
             
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_travelItinerary" : @"TravelItineraryList_one",
             };
}
@end

@implementation TravelItineraryList_one
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"idd" : @"id",
             };
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property{
    if ([property.name isEqualToString:@"images"] || [property.name isEqualToString:@"detailUrl"]) {
        if (oldValue && [oldValue isKindOfClass:[NSString class]]) {
            NSString *url = (NSString *)oldValue;
            return [NSURL URLWithString:url];
        }
    }
    return oldValue;
}

@end


@implementation SelectOrder_date
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    /* 返回的字典，key为模型属性名，value为转化的字典的多级key */
    return @{
             @"Arry_orders" : @"orders",
             };
}
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"Arry_orders" : @"orderlistForOneS",
             };
}
@end
