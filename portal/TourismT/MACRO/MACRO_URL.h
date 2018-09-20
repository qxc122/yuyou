//
//  MACRO_URL.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_URL_h
#define MACRO_URL_h


//#ifdef DEBUG
////#define  URLBASIC  @"http://172.18.126.105:7080/tour-app"//内网测试
//#define  URLBASIC  @"http://zeji.tempus.cn/tour-app"//外网测试
//#else
////#define  URLBASIC  @"http://172.18.126.105:7080/tour-app"//内网测试
//#define  URLBASIC  @"https://tour.tempus.cn/tour-app/swagger"//外网测试
//#endif



#ifdef DEBUG
#define  URLBASIC  @"http://172.18.126.105:7080/tour-app"
#else
#define  URLBASIC  @"https://tour.tempus.cn/tour-app"
#endif

#ifdef DEBUG
#define URLAddress  @"URLAddress"
#define productURLAddress  @"https://tour.tempus.cn/tour-app"
#define tesetURLAddress  @"http://172.18.126.105:7080/tour-app"
#endif





#define     URLBASIC_appuserapprovecheck       @"/app/user/approve/check"
#define     URLBASIC_appuserperiodperiod_detail       @"/app/user/period/period_detail"
#define     URLBASIC_appuserperiodperiod_list       @"/app/user/period/period_list"
#define     URLBASIC_appuserwish_cardindex      @"/app/user/wish_card/index"
#define     URLBASIC_appuserapprovecard_list      @"/app/user/approve/card_list"

#define     URLBASIC_appuserperiodrepayment_detail        @"/app/user/period/repayment_detail"


#define     URLBASIC_appuserapprovechange_bind_card     @"/app/user/approve/change_bind_card"
#define     URLBASIC_appuserapprovebind_card      @"/app/user/approve/bind_card"
#define     URLBASIC_appuserperiodrePayment_list       @"/app/user/period/rePayment_list"
#define     URLBASIC_apploginlogout       @"/app/login/logout"
#define     URLBASIC_area        @"/app/common/area"
#define     URLBASIC_commoncaptcha        @"/app/common/captcha"
#define     URLBASIC_sms        @"/app/common/sms"
#define     URLBASIC_filebrowser        @"/app/file/browser"
#define     URLBASIC_fileupload        @"/app/file/upload"
#define     URLBASIC_applyAppId        @"/app/access/applyAppId"
#define     URLBASIC_applyToken        @"/app/access/applyToken"
#define     URLBASIC_refreshTokenToken        @"/app/access/refreshToken"

#define     URLBASIC_appcommonlast_version       @"/app/common/last_version"
#define     URLBASIC_traveltipsindex        @"/app/travel/tips/index"
#define     URLBASIC_appuserindex        @"/app/user/index"
#define     URLBASIC_apptravelcommentsaves        @"/app/travel/comment/saves"


#define     URLBASIC_appuseremchatmembers        @"/app/user/emchat/members"
#define     URLBASIC_appuseremchatcontacts        @"/app/user/emchat/contacts"
#define     URLBASIC_submitsms        @"/app/login/submit_sms"
#define     URLBASIC_index        @"/app/index"
#define     URLBASIC_appv2index        @"/app/v2/index"

#define     URLBASIC_appv2findTravelSharings        @"/app/v2/findTravelSharings"

#define     URLBASIC_appusersharingthumbs        @"/app/user/sharing/thumbs"
#define     URLBASIC_appv2traveldetail        @"/app/v2/travel/detail"
#define     URLBASIC_appv2travelperiodType_list        @"/app/v2/travel/periodType_list"
#define     URLBASIC_appv2usersharingselect_order        @"/app/v2/user/sharing/select_order"

#define     URLBASIC_detail        @"/app/travel/detail"
#define     URLBASIC_submit        @"/app/register/submit"
#define     URLBASIC_list        @"/app/travel/list"
#define     URLBASIC_travelleradd        @"/app/user/traveller/add"
#define     URLBASIC_travellerdelete        @"/app/user/traveller/delete"
#define     URLBASIC_travellerlist        @"/app/user/traveller/list"
#define     URLBASIC_travellerupdate        @"/app/user/traveller/update"

#define     URLBASIC_addressAdd        @"/app/user/userAddress/addressAdd"
#define     URLBASIC_addressDelete        @"/app/user/userAddress/addressDelete"
#define     URLBASIC_addressUpdate        @"/app/user/userAddress/addressUpdate"
#define     URLBASIC_addresslist               @"/app/user/userAddress/list"

#define     URLBASIC_commentlist        @"/app/travel/comment/list"
#define     URLBASIC_commentsave               @"/app/travel/comment/save"

#define     URLBASIC_favoriteadd        @"/app/user/favorite/add"
#define     URLBASIC_favoritedelete               @"/app/user/favorite/delete"
#define     URLBASIC_favoritelist        @"/app/user/favorite/list"

#define     URLBASIC_appuserfavoriteupdate        @"/app/user/favorite/update"



#define     URLBASIC_appuseremchatuser_info       @"/app/user/emchat/user_info"
#define     URLBASIC_followfollowers_list        @"/app/user/follow/followers_list"
#define     URLBASIC_followfollows_list              @"/app/user/follow/follows_list"
#define     URLBASIC_followupdate        @"/app/user/follow/update"
#define     URLBASIC_apptraveljoin_users        @"/app/travel/join_users"

#define     URLBASIC_appusercouponexchange        @"/app/user/coupon/exchange"
#define     URLBASIC_appusercouponcodeList        @"/app/user/coupon/code_list"

#define     URLBASIC_appusercouponcode_select        @"/app/user/coupon/code_select"

#define     URLBASIC_appuserimpressionupdates      @"/app/user/impression/updates"
#define     URLBASIC_home_pageimpressions       @"/app/home_page/impressions"
#define     URLBASIC_home_pagejoins        @"/app/home_page/joins"
#define     URLBASIC_home_pagesharings              @"/app/home_page/sharings"
#define     URLBASIC_home_pageuser        @"/app/home_page/user"
#define     URLBASIC_appuserimpressionsave        @"/app/user/impression/save"

#define     URLBASIC_apppaymentdebit        @"/app/payment/debit"
#define     URLBASIC_apphome_pagetravelled        @"/app/home_page/travelled"
#define     URLBASIC_apporderperiod_first_debit        @"/app/order/period_first_debit"

#define     URLBASIC_apphome_pagejoins        @"/app/home_page/joins"
#define     URLBASIC_orderdetail        @"/app/user/order/detail"
#define     URLBASIC_orderlist        @"/app/user/order/list"
#define     URLBASIC_orderlistrecently        @"/app/user/order/list_recently"
#define     URLBASIC_momentadd      @"/app/user/moment/add"
#define     URLBASIC_momentlist        @"/app/user/moment/list"
#define     URLBASIC_momentcommentdelete        @"/app/moment/comment/delete"
#define     URLBASIC_momentcommentlist        @"/app/moment/comment/list"
#define     URLBASIC_momentcommentsave        @"/app/moment/comment/save"

#define     URLBASIC_appv2usersharingsaves        @"/app/v2/user/sharing/saves"
#define     URLBASIC_appusertravelSharingadd        @"/app/user/sharing/saves"

#define     URLBASIC_appuserupdate        @"/app/user/update"
//#define     URLBASIC_travelsharingadds        @"/app/travel/sharing/adds"///////
#define     URLBASIC_travelsharingdelete        @"/app/user/sharing/delete"

#define     URLBASIC_appusermessagelist        @"/app/user/notify/list"
#define     URLBASIC_appusermessageview        @"/app/user/notify/view"
#define     URLBASIC_appusernotifydelete        @"/app/user/notify/delete"

#define     URLBASIC_apptravelgroup_trave_linefind_by_order        @"/app/travel/group_trave_line/find_by_order"

#define     URLBASIC_apprefundapply        @"/app/refund/apply"

#define     URLBASIC_appuserorderdetail        @"/app/user/order/detail"
#define     URLBASIC_appuserorderlist        @"/app/user/order/list"

#define     URLBASIC_thumbsUpadd        @"/app/user/thumbsUp/add"
#define     URLBASIC_thumbsUpdelete        @"/app/user/thumbsUp/delete"
#define     URLBASIC_thumbsUplist        @"/app/user/thumbsUp/list"

#define     URLBASIC_apptravelsharingedit       @"/app/user/sharing/view"

#define     URLBASIC_appcommonglobal_params      @"/app/common/global_params"

#define     URLBASIC_appordercancel       @"/app/order/cancel"

#define     URLBASIC_ordercalculate       @"/app/order/calculate"
#define     URLBASIC_ordercreate       @"/app/order/create"
#define     URLBASIC_orderinfo        @"/app/order/info"
#define     URLBASIC_paymentsubmit        @"/app/payment/submit"  
#define     URLBASIC_appuseredit        @"/app/user/edit"
#define     URLBASIC_apploginsubmit_trd        @"/app/login/submit_trd"


#define     URLBASIC_appv2travelgroup_trave_linetravel_itinerary       @"/app/v2/travel/group_trave_line/travel_itinerary"

#define     URLBASIC_travelgroup_trave_linecurrent       @"/app/travel/group_trave_line/current"

#define     URLBASIC_travelgrouptraveline       @"/app/travel/group_trave_line/list"
#define     URLBASIC_travelkitslist        @"/app/travel/kits/list"

//#define     URLBASIC_appIdApplyONE        @"/zeji-front/app/appIdApply"       //申请appId和appSerect
//#define     URLBASIC_appIdApplyTWO        @"/zeji-front/app/tokenApply"       //申请token
//#define     URLBASIC_appIdApplyTHREE        @"/zeji-front/user/refreshLogin"       //申请token


#endif /* MACRO_URL_h */
