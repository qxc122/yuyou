//
//  ToolRequest+common.h
//  TourismT
//
//  Created by Store on 16/11/21.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "ToolRequest.h"

@interface ToolRequest (common)
- (void)getTravelDetailWithNONEsuccess:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock;
//001-公共接口
- (void)apploginlogoutsuccess:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
/**
 *  根据上级地区ID查找下级地区
 *
 *  @param ParentId     地区ID
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)fetchAreaWithParentId:(long)ParentId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;

- (void)appv2findTravelSharingsWithPageNumber:(NSUInteger)pageNumber
                                     PageSize:(NSUInteger)pageSize
                                      success:(RequestSuccess)successBlock
                                      failure:(RequestFailure)failureBlock;

- (void)appcommonglobal_paramssuccess:(RequestSuccess)successBlock
                              failure:(RequestFailure)failureBlock;

- (void)appusersharingthumbsWithIdd:(NSUInteger)Idd
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;
- (void)appv2traveldetailWithtravelId:(NSUInteger)travelId
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
- (void)appv2indexWithPageNumber:(NSUInteger)pageNumber
                        PageSize:(NSUInteger)pageSize
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock;
- (void)appuserfavoriteupdateWithids:(NSArray *)ids
                             success:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock;
- (void)appv2travelperiodType_listWithtravelId:(NSUInteger)travelId
                         travelSpecificationId:(NSUInteger)travelSpecificationId
                                          date:(NSString *)date
                                       success:(RequestSuccess)successBlock
                                       failure:(RequestFailure)failureBlock;
/**
 *  获取图形验证码
 *
 *  @param captchaId    <#captchaId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)commoncaptchaWithcaptchaId:(NSString *)captchaId
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;

- (void)appuseremchatmembersWithidd:(NSString *)idd
                        NONEsuccess:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

- (void)appuseremchatuser_infoWithidd:(NSString *)idd
                              success:(RequestSuccess)successBlock
                              failure:(RequestFailure)failureBlock;
- (void)appuserimpressionsaveWithuserId:(NSUInteger)userId
                                   tag:(NSString *)tag
                               success:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock;

- (void)appusernotifydeleteWithIdd:(NSInteger )idd
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;
    
- (void)apphome_pagejoinsWithuserId:(NSUInteger)userId
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

- (void)appusermessageviewWithIdd:(NSInteger )idd
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;

- (void)appusermessagelistWithPageNumber:(NSUInteger)pageNumber
                                PageSize:(NSUInteger)pageSize
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
    
- (void)appordercancelWithtSn:(NSString *)Sn
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
    
- (void)appcommonlast_versionWithsuccess:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;

- (void)appusercouponcode_selectWithPageNumber:(NSUInteger)pageNumber
                                      PageSize:(NSUInteger)pageSize
                                       orderSn:(NSString *)orderSn
                                      travelId:(NSInteger )travelId
                                       success:(RequestSuccess)successBlock
                                       failure:(RequestFailure)failureBlock;
/**
 *  发送短信验证码
 *
 *  @param mobile       手机号
 *  @param type       是登录还是绑卡
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)sendSmsWithmobile:(NSString *)mobile
                     type:(NSString *)type
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;


/**
 *  <#Description#>
 *
 *  @param path         <#path description#>
 *  @param fileType     <#fileType description#>
 *  @param orderType    <#orderType description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)filebrowserWithpath:(NSString *)path
                   fileType:(NSString *)fileType
                  orderType:(NSString *)orderType
                    success:(RequestSuccess)successBlock
                    failure:(RequestFailure)failureBlock;
/**
 *  上传图片
 *
 *  @param fileImage     <#fileImage description#>
 *  @param progressBlock <#progressBlock description#>
 *  @param successBlock  <#successBlock description#>
 *  @param failureBlock  <#failureBlock description#>
 */
- (void)fileuploadWithfile:(UIImage *)fileImage
                  progress:(RequestProgress)progressBlock
                   success:(RequestSuccess)successBlock
                   failure:(RequestFailure)failureBlock;


//002-安全认证

/**
 *  根据设备编号获取AppId
 *
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)getAppIdWithsuccess:(RequestSuccess)successBlock
                    failure:(RequestFailure)failureBlock;
/**
 *  根据AppId获取Token
 *
 *  @param AppId        <#AppId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)getTokenWithAppId:(NSString *)AppId
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock;
/**
 *  旅程提醒
 *
 *  @param idd        <#AppId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)traveltipsindexWithid:(NSInteger )idd
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;

/**
 *  我的首页
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)appuserindexWithsuccess:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock;
/**
 *  刷新Token
 *
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)refreshTokenTokenWithsuccess:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock;
//003-用户登录

/**
 *  使用手机短信登录
 *
 *  @param mobile       <#mobile description#>
 *  @param smsCode      <#smsCode description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)loginWithMobile:(NSString *)mobile andsmsCode:(NSString *)smsCode
                success:(RequestSuccess)successBlock
                failure:(RequestFailure)failureBlock;

//003-用户注册

/**
 *  使用手机短信注册
 *
 *  @param mobile       <#mobile description#>
 *  @param password     <#password description#>
 *  @param rePassword   <#rePassword description#>
 *  @param smsCode      <#smsCode description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)registerWithMobile:(NSString *)mobile Password:(NSString *)password RePassword:(NSString *)rePassword SmsCode:(NSString *)smsCode success:(RequestSuccess)successBlock
                   failure:(RequestFailure)failureBlock;
//004-首页
/**
 *  旅游首页
 *
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)getindexWithPageNumber:(NSUInteger)pageNumber
                      PageSize:(NSUInteger)pageSize
                       success:(RequestSuccess)successBlock
                    failure:(RequestFailure)failureBlock;

//005-旅游产品
/**
 *  根据ID查看旅游详情
 *
 *  @param travelId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)getTravelDetailWithTravelId:(NSInteger )travelId
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;
/**
 *  分页查询旅游列表
 *
 *  @param pageNumber   <#pageNumber description#>
 *  @param pageSize     <#pageSize description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)getTravelListWithPageNumber:(NSUInteger)pageNumber
                           PageSize:(NSUInteger)pageSize
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;
//005-旅游产品评论
/**
 *  保存产品评论
 *
 *  @param pageNumber   <#pageNumber description#>
 *  @param pageSize     <#pageSize description#>
 *  @param travelId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)commentlistWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                         travelId:(NSUInteger)travelId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;
/**
 *  分页查询产品评论列表
 *
 *  @param images       <#images description#>
 *  @param travelId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)commentsaveWithimages:(NSArray *)images
                     travelId:(NSUInteger)travelId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;

//005-旅游产品收藏
/**
 *  添加收藏
 *
 *  @param favoriteaid  <#favoriteaid description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)favoriteaddWithid:(NSUInteger)favoriteaid
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock;
/**
 *  取消收藏
 *
 *  @param ids          <#ids description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)favoritedeleteWithids:(NSArray *)ids
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
/**
 *  分页查询我的收藏列表
 *
 *  @param pageNumber   <#pageNumber description#>
 *  @param pageSize     <#pageSize description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)favoritelistWithPageNumber:(NSUInteger)pageNumber
                          PageSize:(NSUInteger)pageSize
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;

- (void)apphome_pagetravelledWithuserId:(NSUInteger)userId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;


//006-常用出行人
- (void)travelleraddWithbirth:(NSString *)birth
                     Firstname:(NSString *)firstname
                           gender:(NSString *)gender
                         idNumber:(NSString *)idNumber
               passportNumber:(NSString *)passportNumber
                         idPeriod:(NSString *)idPeriod
                           idType:(NSString *)idType
                         lastname:(NSString *)lastname
                            isDefault:(BOOL )isDefault
                         realname:(NSString *)realname
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;

- (void)travellerdeleteWithID:(NSInteger )travellerid
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;

- (void)travellerlistWithPageNumber:(NSUInteger)pageNumber
                           PageSize:(NSUInteger)pageSize
                             idType:(NSString *)idType
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

- (void)travellerupdateWitbirth:(NSString *)birth
                      Firstname:(NSString *)firstname
                         gender:(NSString *)gender
                       idNumber:(NSString *)idNumber
                 passportNumber:(NSString *)passportNumber
                       idPeriod:(NSString *)idPeriod
                         idType:(NSString *)idType
                       lastname:(NSString *)lastname
                      isDefault:(BOOL )isDefault
                       realname:(NSString *)realname
                            idd:(NSInteger )idd
                             success:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock;

//007-收货地址
- (void)addressAddWithaddress:(NSString *)address
                       areaId:(NSInteger)areaId
                    consignee:(NSString *)consignee
                    isDefault:(BOOL)isDefault
                        phone:(NSString *)phone
                      zipCode:(NSString *)zipCode
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;

- (void)addressDeleteWithID:(NSInteger )travellerid
                    success:(RequestSuccess)successBlock
                    failure:(RequestFailure)failureBlock;

- (void)addressUpdateWithaddress:(NSString *)address
                          areaId:(NSInteger)areaId
                       consignee:(NSString *)consignee
                       isDefault:(BOOL)isDefault
                           phone:(NSString *)phone
                         zipCode:(NSString *)zipCode
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock;

- (void)addresslistWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;
//008-我的订单 : 我的订单
- (void)orderdetailWithorderId:(NSUInteger)orderId
                       success:(RequestSuccess)successBlock
                       failure:(RequestFailure)failureBlock;

- (void)orderlistWithPageNumber:(NSUInteger)pageNumber
                       PageSize:(NSUInteger)pageSize
                        success:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock;

- (void)orderlistrecentlyWithPageNumber:(NSUInteger)pageNumber
                               PageSize:(NSUInteger)pageSize
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;

//009-分享说说 : 分享说说
- (void)momentaddWithaddress:(NSString *)address
                     content:(NSString *)content
                      images:(NSArray *)images
                       title:(NSString *)title
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock;

- (void)momentlistWithPageNumber:(NSUInteger)pageNumber
                        PageSize:(NSUInteger)pageSize
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock;

//010-说说评论 : 说说评论
- (void)momentcommentdeleteWithId:(NSUInteger)deleteId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;
/**
 *  分页查询说说评论列表
 *
 *  @param pageNumber   <#pageNumber description#>
 *  @param pageSize     <#pageSize description#>
 *  @param momentId     <#momentId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)momentcommentlistWithPageNumber:(NSUInteger)pageNumber
                               PageSize:(NSUInteger)pageSize
                               momentId:(NSUInteger)momentId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;
/**
 *  保存说说评论
 *
 *  @param images       <#images description#>
 *  @param content      <#content description#>
 *  @param momentId     <#momentId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)momentcommentsaveWithimages:(NSArray *)images
                            content:(NSString *)content
                           momentId:(NSUInteger)momentId
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

//011-说说点赞 : 说说点赞
/**
 *  添加点赞
 *
 *  @param addId        <#addId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)thumbsUpaddWithid:(NSUInteger )addId
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock;
/**
 *  分页查询说说点赞列表
 *
 *  @param pageNumber   <#pageNumber description#>
 *  @param pageSize     <#pageSize description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)thumbsUplistWithPageNumber:(NSUInteger)pageNumber
                          PageSize:(NSUInteger)pageSize
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;
/**
 *  取消点赞
 *
 *  @param deleteIds    <#deleteIds description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)thumbsUpdeleteWithId:(NSArray *)deleteIds
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock;

- (void)apptraveljoin_usersWithtravelId:(NSUInteger)travelId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;

- (void)apptravelgroup_trave_linefind_by_orderWithIdd:(NSInteger )idd
                                              success:(RequestSuccess)successBlock
                                              failure:(RequestFailure)failureBlock;
    
- (void)apploginsubmit_wxWithavatar:(NSString *)avatar
                               city:(NSString *)city
                            address:(NSString *)address
                            country:(NSString *)country
                             gender:(NSString *)gender
                           nickname:(NSString *)nickname
                             openId:(NSString *)openId
                         openIdType:(NSString *)openIdType
                           province:(NSString * )province
                            unionid:(NSString *)unionid
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;
/**
 *  订单计算
 *
 *  @param travelId    <#deleteIds description#>
 *  @param travellers    <#deleteIds description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)ordercalculateWithtravelId:(NSUInteger )travelId
             travelSpecificationId:(NSUInteger )travelSpecificationId
                      travellers:(NSArray *)travellers
                            date:(NSString *)date
                       couponCode:(NSString *)couponCode
                         periodNum:(NSUInteger )periodNum
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock;
- (void)appusereditWithNOnesuccess:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;

- (void)appv2usersharingselect_ordersuccess:(RequestSuccess)successBlock
                                    failure:(RequestFailure)failureBlock;

- (void)apporderperiod_first_debitWithSn:(NSString *)sn
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
    
- (void)appv2travelgroup_trave_linetravel_itineraryWithPageNumber:(NSUInteger)pageNumber
                                                         PageSize:(NSUInteger)pageSize
                                                          success:(RequestSuccess)successBlock
                                                          failure:(RequestFailure)failureBlock;
- (void)apppaymentdebitWithSn:(NSString *)Sn
                         type:(NSString *)type
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
//编辑分享
- (void)apptravelsharingeditlId:(NSUInteger )idd
                        success:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock;

- (void)ordercreateWithpaymentPluginId:(NSString *)paymentPluginId
                                mobile:(NSString *)mobile
                              travelId:(NSUInteger )travelId
                 travelSpecificationId:(NSUInteger )travelSpecificationId
                            travellers:(NSArray *)travellers
                                  date:(NSString *)date
                             couponCode:(NSString *)couponCode
                             periodNum:(NSUInteger )periodNum
                               success:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock;
/**
 *  订单支付
 *
 *  @param paymentPluginId        <#email description#>
 *  @param sn       <#mobile description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)paymentsubmitWithpaymentPluginId:(NSString *)paymentPluginId
                                      sn:(NSString *)sn
                                    type:(NSString *)type
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
/**
 *  订单信息
 *
 *  @param travelId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)orderinfoWithtravelId:(NSUInteger )travelId
                         date:(NSString *)date
                    periodNum:(NSUInteger )periodNum
        travelSpecificationId:(NSUInteger )travelSpecificationId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
//012-行程单查询 : 行程单查询
/**
 *  行程单查询
 *
 *  @param orderId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)travelgroupTraveLineWithOrderId:(NSUInteger )orderId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;


- (void)travelgroup_trave_linecurrentWithPageNumber:(NSUInteger)pageNumber
                                           PageSize:(NSUInteger)pageSize
                                            success:(RequestSuccess)successBlock
                                            failure:(RequestFailure)failureBlock;

- (void)travelsharingdeleteWithidd:(NSUInteger)idd
                                            success:(RequestSuccess)successBlock
                                            failure:(RequestFailure)failureBlock;

///关注
- (void)followfollowers_listWithPageNumber:(NSUInteger)pageNumber
                                  PageSize:(NSUInteger)pageSize
                                   success:(RequestSuccess)successBlock
                                   failure:(RequestFailure)failureBlock;
- (void)followfollows_listWithPageNumber:(NSUInteger)pageNumber
                                PageSize:(NSUInteger)pageSize
                                 success:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock;
- (void)followupdateWithtravelId:(NSUInteger)travelId
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock;


- (void)home_pageimpressionsWithIdd:(NSUInteger)idd
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;
- (void)home_pagejoinsWithIid:(NSUInteger)idd
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock;
- (void)home_pagesharingsWithPageNumber:(NSUInteger)pageNumber
                               PageSize:(NSUInteger)pageSize
                                 userId:(NSUInteger)userId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;
- (void)home_pageuserWithIid:(NSUInteger)idd
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock;


- (void)appusercouponcodeListWithPageNumber:(NSUInteger)pageNumber
                                   PageSize:(NSUInteger)pageSize
                                     status:(NSString *)status
                                    success:(RequestSuccess)successBlock
                                    failure:(RequestFailure)failureBlock;
- (void)appusercouponexchangeWithpassword:(NSString *)password
                                  success:(RequestSuccess)successBlock
                                  failure:(RequestFailure)failureBlock;
    
    
- (void)appuserimpressionupdates:(NSArray *)tags
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock;
    
    
- (void)appuserorderdetailWithIid:(NSUInteger)idd
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;
- (void)appuserorderlistWithPageNumber:(NSUInteger)pageNumber
                              PageSize:(NSUInteger)pageSize
                                status:(NSString *)status
                               success:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock;
- (void)apprefundapplyWithapplyMemo:(NSString *)applyMemo
                                 sn:(NSString *)sn
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock;

//013-旅游锦囊查询 : 旅游锦囊查询
/**
 *  旅游锦囊查询
 *
 *  @param orderId     <#travelId description#>
 *  @param successBlock <#successBlock description#>
 *  @param failureBlock <#failureBlock description#>
 */
- (void)travelKitsListWithOrderId:(NSUInteger )orderId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock;

-(void)wechatGetcode:(NSString *)code success:(WXRequestSuccess)successBlock
             failure:(WXRequestFailure)failureBlock;



///与游 第二期
////还款记录
- (void)appuserperiodrePayment_listsuccess:(RequestSuccess)successBlock
                                   failure:(RequestFailure)failureBlock;
////分期明细（列表）
- (void)appuserperiodperiod_detailWithIid:(NSInteger )iid
                                  success:(RequestSuccess)successBlock
                                  failure:(RequestFailure)failureBlock;
////我的分期
- (void)appuserperiodperiod_listsuccess:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock;
////我的心愿卡  首页
- (void)appuserwish_cardindexsuccess:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock;
////我的银行卡  首页
- (void)appuserapprovecard_listsuccess:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock;
///绑定银行卡
- (void)appuserapprovebind_cardWithbankCardNo:(NSString *)bankCardNo
                                      address:(NSString *)address
                                     bankCode:(NSString *)bankCode
                                       idCard:(NSString *)idCard
                                       mobile:(NSString *)mobile
                                         name:(NSString *)name
                                      smsCode:(NSString *)smsCode
                                      success:(RequestSuccess)successBlock
                                      failure:(RequestFailure)failureBlock;
///更换银行卡
- (void)appuserapprovechange_bind_cardWithbankCardNo:(NSString *)bankCardNo
                                             address:(NSString *)address
                                            bankCode:(NSString *)bankCode
                                              mobile:(NSString *)mobile
                                             smsCode:(NSString *)smsCode
                                             success:(RequestSuccess)successBlock
                                             failure:(RequestFailure)failureBlock;

///身份验证
- (void)appuserapprovechecksuccess:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock;

- (void)appuserperiodrepayment_detailWithbillId:(NSInteger)billId
                                        success:(RequestSuccess)successBlock
                                        failure:(RequestFailure)failureBlock;

@end
