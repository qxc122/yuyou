//
//  ToolRequest+common.m
//  TourismT
//
//  Created by Store on 16/11/21.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "ToolRequest+common.h"
#import "MACRO_URL.h"
#import "OpenUDID.h"


@implementation ToolRequest (common)

- (void)apploginlogoutsuccess:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_apploginlogout parameters:params success:successBlock failure:failureBlock];
}
- (void)fetchAreaWithParentId:(long)ParentId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(ParentId) forKey:@"parentId"];
    [self postJsonWithPath:URLBASIC_area parameters:params success:successBlock failure:failureBlock];
}
- (void)commoncaptchaWithcaptchaId:(NSString *)captchaId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(12) forKey:@"captchaId"];
    [self getWithPath:URLBASIC_commoncaptcha parameters:params success:successBlock failure:failureBlock];
}

- (void)appuserperiodperiod_detailWithIid:(NSInteger )iid
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(iid) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appuserperiodperiod_detail parameters:params success:successBlock failure:failureBlock];
}

- (void)appuserperiodperiod_listsuccess:(RequestSuccess)successBlock
                                  failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserperiodperiod_list parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserapprovechecksuccess:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserapprovecheck parameters:params success:successBlock failure:failureBlock];
}



- (void)appuserwish_cardindexsuccess:(RequestSuccess)successBlock  
                                failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserwish_cardindex parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserapprovecard_listsuccess:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserapprovecard_list parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserapprovebind_cardWithbankCardNo:(NSString *)bankCardNo
                                      address:(NSString *)address
                                     bankCode:(NSString *)bankCode
                                       idCard:(NSString *)idCard
                                       mobile:(NSString *)mobile
                                         name:(NSString *)name
                                      smsCode:(NSString *)smsCode
                                      success:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (bankCardNo) {
        [params setObject:bankCardNo forKey:@"bankCardNo"];
    }
    if (bankCode) {
        [params setObject:bankCode forKey:@"bankCode"];
    }
    if (idCard) {
        [params setObject:idCard forKey:@"idCard"];
    }
    if (address) {
        [params setObject:address forKey:@"address"];
    }
    if (mobile) {
        [params setObject:mobile forKey:@"mobile"];
    }
    if (name) {
        [params setObject:name forKey:@"name"];
    }
    if (smsCode) {
        [params setObject:smsCode forKey:@"smsCode"];
    }
    
    [self postJsonWithPath:URLBASIC_appuserapprovebind_card parameters:params success:successBlock failure:failureBlock];
}


- (void)appuserapprovechange_bind_cardWithbankCardNo:(NSString *)bankCardNo
                                             address:(NSString *)address
                                     bankCode:(NSString *)bankCode
                                       mobile:(NSString *)mobile
                                      smsCode:(NSString *)smsCode
                                      success:(RequestSuccess)successBlock
                                      failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (bankCardNo) {
        [params setObject:bankCardNo forKey:@"bankCardNo"];
    }
    if (bankCode) {
        [params setObject:bankCode forKey:@"bankCode"];
    }
    if (address) {
        [params setObject:address forKey:@"address"];
    }
    if (mobile) {
        [params setObject:mobile forKey:@"mobile"];
    }
    if (smsCode) {
        [params setObject:smsCode forKey:@"smsCode"];
    }
    
    [self postJsonWithPath:URLBASIC_appuserapprovechange_bind_card parameters:params success:successBlock failure:failureBlock];
}





- (void)appuserperiodrePayment_listsuccess:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserperiodrePayment_list parameters:params success:successBlock failure:failureBlock];
}

- (void)appuserperiodrepayment_detailWithbillId:(NSInteger )billId
                                        success:(RequestSuccess)successBlock
                                   failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setObject:@(billId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appuserperiodrepayment_detail parameters:params success:successBlock failure:failureBlock];
}



- (void)sendSmsWithmobile:(NSString *)mobile
                     type:(NSString *)type
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:mobile forKey:@"mobile"];
    if (type && type.length) {
        [params setObject:type forKey:@"type"];
    }
    [self postJsonWithPath:URLBASIC_sms parameters:params success:successBlock failure:failureBlock];
}
- (void)filebrowserWithpath:(NSString *)path
                   fileType:(NSString *)fileType
                  orderType:(NSString *)orderType
                    success:(RequestSuccess)successBlock
                    failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:path forKey:@"path"];
    [params setObject:fileType forKey:@"fileType"];
    [params setObject:orderType forKey:@"orderType"];
    [self getWithPath:URLBASIC_filebrowser parameters:params success:successBlock failure:failureBlock];
}

- (void)fileuploadWithfile:(UIImage *)fileImage
                  progress:(RequestProgress)progressBlock
                   success:(RequestSuccess)successBlock
                   failure:(RequestFailure)failureBlock
{
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc]init];
    [parameters setObject:@"image" forKey:@"fileType"];
    [parameters setObject:[tourInfo sharedInstance].tokenInfoModed.accessToken?[tourInfo sharedInstance].tokenInfoModed.accessToken:@"" forKey:@"token"];
    [self uploadWithPath:URLBASIC_fileupload avatarFile:fileImage parameters:parameters progress:progressBlock success:successBlock failure:failureBlock];
}
- (void)getAppIdWithsuccess:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[OpenUDID value] forKey:@"deviceId"];
    [self postJsonWithPath:URLBASIC_applyAppId parameters:params success:successBlock failure:failureBlock];
}
- (void)getTokenWithAppId:(NSString *)AppId
                        success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (AppId && AppId.length) {
        [params setObject:AppId forKey:@"appId"];
    }
    [self postJsonWithPath:URLBASIC_applyToken parameters:params success:successBlock failure:failureBlock];
}

- (void)refreshTokenTokenWithsuccess:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_refreshTokenToken parameters:params success:successBlock failure:failureBlock];
}
- (void)appcommonlast_versionWithsuccess:(RequestSuccess)successBlock
                             failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appcommonlast_version parameters:params success:successBlock failure:failureBlock];
}


- (void)loginWithMobile:(NSString *)mobile andsmsCode:(NSString *)smsCode
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:mobile forKey:@"mobile"];
    [params setObject:smsCode forKey:@"smsCode"];
    [self postJsonWithPath:URLBASIC_submitsms parameters:params success:successBlock failure:failureBlock];
}



- (void)getindexWithPageNumber:(NSUInteger)pageNumber
                      PageSize:(NSUInteger)pageSize
                       success:(RequestSuccess)successBlock
                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_index parameters:params success:successBlock failure:failureBlock];
}

- (void)appv2traveldetailWithtravelId:(NSUInteger)travelId
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    [self postJsonWithPath:URLBASIC_appv2traveldetail parameters:params success:successBlock failure:failureBlock];
}
- (void)appv2travelperiodType_listWithtravelId:(NSUInteger)travelId
                             travelSpecificationId:(NSUInteger)travelSpecificationId
                                          date:(NSString *)date
                              success:(RequestSuccess)successBlock
                              failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    [params setObject:@(travelSpecificationId) forKey:@"travelSpecificationId"];
    [params setObject:date forKey:@"date"];
    [self postJsonWithPath:URLBASIC_appv2travelperiodType_list parameters:params success:successBlock failure:failureBlock];
}

- (void)appv2usersharingselect_ordersuccess:(RequestSuccess)successBlock
                                       failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appv2usersharingselect_order parameters:params success:successBlock failure:failureBlock];
}


- (void)appusersharingthumbsWithIdd:(NSUInteger)Idd
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(Idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appusersharingthumbs parameters:params success:successBlock failure:failureBlock];
}


- (void)appv2indexWithPageNumber:(NSUInteger)pageNumber
                      PageSize:(NSUInteger)pageSize
                       success:(RequestSuccess)successBlock
                       failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_appv2index parameters:params success:successBlock failure:failureBlock];
}

- (void)appv2findTravelSharingsWithPageNumber:(NSUInteger)pageNumber
                        PageSize:(NSUInteger)pageSize
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_appv2findTravelSharings parameters:params success:successBlock failure:failureBlock];
}


- (void)getTravelDetailWithTravelId:(NSInteger )travelId
                success:(RequestSuccess)successBlock
                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    [self postJsonWithPath:URLBASIC_detail parameters:params success:successBlock failure:failureBlock];
}
- (void)getTravelDetailWithNONEsuccess:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuseremchatcontacts parameters:params success:successBlock failure:failureBlock];
}
- (void)appuseremchatmembersWithidd:(NSString *)idd
                             NONEsuccess:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:idd forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appuseremchatmembers parameters:params success:successBlock failure:failureBlock];
}

/////////
- (void)registerWithMobile:(NSString *)mobile Password:(NSString *)password RePassword:(NSString *)rePassword SmsCode:(NSString *)smsCode success:(RequestSuccess)successBlock
            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:mobile forKey:@"travelId"];
    [params setObject:password forKey:@"password"];
    [params setObject:rePassword forKey:@"rePassword"];
    [params setObject:smsCode forKey:@"smsCode"];
    [self postJsonWithPath:URLBASIC_submit parameters:params success:successBlock failure:failureBlock];
}
- (void)traveltipsindexWithid:(NSInteger )idd
                   success:(RequestSuccess)successBlock
                   failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_traveltipsindex parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserindexWithsuccess:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuserindex parameters:params success:successBlock failure:failureBlock];
}


- (void)getTravelListWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_list parameters:params success:successBlock failure:failureBlock];
}
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
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (birth) {
        [params setObject:birth forKey:@"birth"];
    }
    if (firstname) {
        [params setObject:firstname forKey:@"firstname"];
    }
    if (gender) {
        [params setObject:gender forKey:@"gender"];
    }
    if (idType) {
        [params setObject:idType forKey:@"idType"];
    }
    if (lastname) {
        [params setObject:lastname forKey:@"lastname"];
    }
    if (realname) {
        [params setObject:realname forKey:@"realname"];
    }
    if (idPeriod) {
        [params setObject:idPeriod forKey:@"idPeriod"];
    }
    if (idNumber) {
        [params setObject:idNumber forKey:@"idNumber"];
    }
    if (passportNumber) {
        [params setObject:passportNumber forKey:@"passportNumber"];
    }
    [params setObject:@(isDefault) forKey:@"isDefault"];

    [self postJsonWithPath:URLBASIC_travelleradd parameters:params success:successBlock failure:failureBlock];
}
- (void)travellerdeleteWithID:(NSInteger )travellerid
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travellerid) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_travellerdelete parameters:params success:successBlock failure:failureBlock];
}
- (void)travellerlistWithPageNumber:(NSUInteger)pageNumber
                           PageSize:(NSUInteger)pageSize
                          idType:(NSString *)idType
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
//    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
//    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
//    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//    [params setObject:pageable forKey:@"pageable"];
    if (idType) {
        [params setObject:idType forKey:@"idType"];
    }
    [self postJsonWithPath:URLBASIC_travellerlist parameters:params success:successBlock failure:failureBlock];
}
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
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (birth) {
        [params setObject:birth forKey:@"birth"];
    }
    if (firstname) {
        [params setObject:firstname forKey:@"firstname"];
    }
    if (gender) {
        [params setObject:gender forKey:@"gender"];
    }
    if (idType) {
        [params setObject:idType forKey:@"idType"];
    }
    if (lastname) {
        [params setObject:lastname forKey:@"lastname"];
    }
    if (realname) {
        [params setObject:realname forKey:@"realname"];
    }
    if (idPeriod) {
        [params setObject:idPeriod forKey:@"idPeriod"];
    }
    if (idNumber) {
        [params setObject:idNumber forKey:@"idNumber"];
    }
    if (passportNumber) {
        [params setObject:passportNumber forKey:@"passportNumber"];
    }
    [params setObject:@(isDefault) forKey:@"isDefault"];
    [params setObject:@(idd) forKey:@"id"];

    [self postJsonWithPath:URLBASIC_travellerupdate parameters:params success:successBlock failure:failureBlock];
}

- (void)addressAddWithaddress:(NSString *)address
                        areaId:(NSInteger)areaId
                        consignee:(NSString *)consignee
                        isDefault:(BOOL)isDefault
                        phone:(NSString *)phone
                        zipCode:(NSString *)zipCode
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:address forKey:@"address"];
    [params setObject:@(areaId) forKey:@"areaId"];
    [params setObject:consignee forKey:@"consignee"];
    [params setObject:@(isDefault) forKey:@"isDefault"];
    [params setObject:phone forKey:@"phone"];
    [params setObject:zipCode forKey:@"zipCode"];
    [self postJsonWithPath:URLBASIC_addressAdd parameters:params success:successBlock failure:failureBlock];
}
- (void)addressDeleteWithID:(NSInteger )travellerid
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travellerid) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_addressDelete parameters:params success:successBlock failure:failureBlock];
}
- (void)addressUpdateWithaddress:(NSString *)address
                          areaId:(NSInteger)areaId
                       consignee:(NSString *)consignee
                       isDefault:(BOOL)isDefault
                           phone:(NSString *)phone
                         zipCode:(NSString *)zipCode
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:address forKey:@"address"];
    [params setObject:@(areaId) forKey:@"areaId"];
    [params setObject:consignee forKey:@"consignee"];
    [params setObject:@(isDefault) forKey:@"isDefault"];
    [params setObject:phone forKey:@"phone"];
    [params setObject:zipCode forKey:@"zipCode"];
    [self postJsonWithPath:URLBASIC_addressUpdate parameters:params success:successBlock failure:failureBlock];
}
- (void)addresslistWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_addresslist parameters:params success:successBlock failure:failureBlock];
}
- (void)commentlistWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                         travelId:(NSUInteger)travelId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [params setObject:@(travelId) forKey:@"travelId"];
    [self postJsonWithPath:URLBASIC_commentlist parameters:params success:successBlock failure:failureBlock];
}
///关注
- (void)followfollowers_listWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_followfollowers_list parameters:params success:successBlock failure:failureBlock];
}
- (void)followfollows_listWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_followfollows_list parameters:params success:successBlock failure:failureBlock];
}

- (void)apptraveljoin_usersWithtravelId:(NSUInteger)travelId
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    [self postJsonWithPath:URLBASIC_apptraveljoin_users parameters:params success:successBlock failure:failureBlock];
}

- (void)followupdateWithtravelId:(NSUInteger)travelId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_followupdate parameters:params success:successBlock failure:failureBlock];
}
- (void)home_pageimpressionsWithIdd:(NSUInteger)idd
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_home_pageimpressions parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserimpressionsaveWithuserId:(NSUInteger)userId
                                   tag:(NSString *)tag
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(userId) forKey:@"userId"];
    [params setObject:tag forKey:@"tag"];
    [self postJsonWithPath:URLBASIC_appuserimpressionsave parameters:params success:successBlock failure:failureBlock];
}
- (void)apphome_pagejoinsWithuserId:(NSUInteger)userId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(userId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_apphome_pagejoins parameters:params success:successBlock failure:failureBlock];
}

- (void)apphome_pagetravelledWithuserId:(NSUInteger)userId
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(userId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_apphome_pagetravelled parameters:params success:successBlock failure:failureBlock];
}
- (void)apporderperiod_first_debitWithSn:(NSString *)sn
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:sn forKey:@"sn"];
    [self postJsonWithPath:URLBASIC_apporderperiod_first_debit parameters:params success:successBlock failure:failureBlock];
}


- (void)appuserimpressionupdates:(NSArray *)tags
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:tags forKey:@"tags"];
    [self postJsonWithPath:URLBASIC_appuserimpressionupdates parameters:params success:successBlock failure:failureBlock];
}


- (void)appusercouponcodeListWithPageNumber:(NSUInteger)pageNumber
                                   PageSize:(NSUInteger)pageSize
                                     status:(NSString *)status
                                    success:(RequestSuccess)successBlock
                                    failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"]; 
    [params setObject:status forKey:@"status"];
    
    [self postJsonWithPath:URLBASIC_appusercouponcodeList parameters:params success:successBlock failure:failureBlock];
}

- (void)appusercouponcode_selectWithPageNumber:(NSUInteger)pageNumber
                                   PageSize:(NSUInteger)pageSize
                                     orderSn:(NSString *)orderSn
                                      travelId:(NSInteger )travelId
                                    success:(RequestSuccess)successBlock
                                    failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    if (travelId) {
        [params setObject:@(travelId) forKey:@"travelId"];
    }
    if (orderSn) {
        [params setObject:orderSn forKey:@"orderSn"];
    }
    
    [self postJsonWithPath:URLBASIC_appusercouponcode_select parameters:params success:successBlock failure:failureBlock];
}

- (void)appusercouponexchangeWithpassword:(NSString *)password
                                  success:(RequestSuccess)successBlock
                                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:password forKey:@"password"];
    [self postJsonWithPath:URLBASIC_appusercouponexchange parameters:params success:successBlock failure:failureBlock];
}

- (void)home_pagejoinsWithIid:(NSUInteger)idd
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_home_pagejoins parameters:params success:successBlock failure:failureBlock];
}
- (void)home_pagesharingsWithPageNumber:(NSUInteger)pageNumber
                          PageSize:(NSUInteger)pageSize
                      userId:(NSUInteger)userId
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [params setObject:@(userId) forKey:@"userId"];
    [self postJsonWithPath:URLBASIC_home_pagesharings parameters:params success:successBlock failure:failureBlock];
}
- (void)home_pageuserWithIid:(NSUInteger)idd
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    
    [self postJsonWithPath:URLBASIC_home_pageuser parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserorderdetailWithIid:(NSUInteger)idd
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"orderId"];
    [self postJsonWithPath:URLBASIC_appuserorderdetail parameters:params success:successBlock failure:failureBlock];
}

- (void)apppaymentdebitWithSn:(NSString *)Sn
                         type:(NSString *)type
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:Sn forKey:@"sn"];
    [params setObject:type forKey:@"type"];
    [self postJsonWithPath:URLBASIC_apppaymentdebit parameters:params success:successBlock failure:failureBlock];
}


- (void)apprefundapplyWithapplyMemo:(NSString *)applyMemo
                          sn:(NSString *)sn
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:applyMemo forKey:@"applyMemo"];
    [params setObject:sn forKey:@"sn"];
    [self postJsonWithPath:URLBASIC_apprefundapply parameters:params success:successBlock failure:failureBlock];
}

- (void)appusernotifydeleteWithIdd:(NSInteger )idd
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appusernotifydelete parameters:params success:successBlock failure:failureBlock];
}

- (void)apptravelgroup_trave_linefind_by_orderWithIdd:(NSInteger )idd
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_apptravelgroup_trave_linefind_by_order parameters:params success:successBlock failure:failureBlock];
}



- (void)appusermessageviewWithIdd:(NSInteger )idd
                            success:(RequestSuccess)successBlock
                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appusermessageview parameters:params success:successBlock failure:failureBlock];
}

- (void)appusermessagelistWithPageNumber:(NSUInteger)pageNumber
                              PageSize:(NSUInteger)pageSize
                               success:(RequestSuccess)successBlock
                               failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_appusermessagelist parameters:params success:successBlock failure:failureBlock];
}


- (void)appuserorderlistWithPageNumber:(NSUInteger)pageNumber
                          PageSize:(NSUInteger)pageSize
                              status:(NSString *)status
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [params setObject:status forKey:@"status"];
    [self postJsonWithPath:URLBASIC_appuserorderlist parameters:params success:successBlock failure:failureBlock];
}

- (void)commentsaveWithimages:(NSArray *)images
                         travelId:(NSUInteger)travelId
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:images forKey:@"images"];
    [params setObject:@(travelId) forKey:@"travelId"];
    [self postJsonWithPath:URLBASIC_commentsave parameters:params success:successBlock failure:failureBlock];
}
- (void)favoriteaddWithid:(NSUInteger)favoriteaid
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(favoriteaid) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_favoriteadd parameters:params success:successBlock failure:failureBlock];
}
- (void)appuserfavoriteupdateWithids:(NSArray *)ids
                  success:(RequestSuccess)successBlock
                  failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:ids forKey:@"ids"];
    [self postJsonWithPath:URLBASIC_appuserfavoriteupdate parameters:params success:successBlock failure:failureBlock];
}


- (void)favoritedeleteWithids:(NSArray *)ids
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:ids forKey:@"ids"];
    [self postJsonWithPath:URLBASIC_favoritedelete parameters:params success:successBlock failure:failureBlock];
}
- (void)appuseremchatuser_infoWithidd:(NSString *)idd
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:idd forKey:@"id"];
    [self postJsonWithPath:URLBASIC_appuseremchatuser_info parameters:params success:successBlock failure:failureBlock];
}


- (void)favoritelistWithPageNumber:(NSUInteger)pageNumber
                         PageSize:(NSUInteger)pageSize
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_favoritelist parameters:params success:successBlock failure:failureBlock];
}
- (void)orderdetailWithorderId:(NSUInteger)orderId
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(orderId) forKey:@"orderId"];
    [self postJsonWithPath:URLBASIC_orderdetail parameters:params success:successBlock failure:failureBlock];
}
- (void)orderlistWithPageNumber:(NSUInteger)pageNumber
                       PageSize:(NSUInteger)pageSize
                        success:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_orderlist parameters:params success:successBlock failure:failureBlock];
}
- (void)orderlistrecentlyWithPageNumber:(NSUInteger)pageNumber
                       PageSize:(NSUInteger)pageSize
                        success:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_orderlistrecently parameters:params success:successBlock failure:failureBlock];
}
- (void)momentaddWithaddress:(NSString *)address
                       content:(NSString *)content
                        images:(NSArray *)images
                        title:(NSString *)title
                        success:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:address forKey:@"address"];
    [params setObject:content forKey:@"content"];
    [params setObject:images forKey:@"images"];
    [params setObject:title forKey:@"title"];
    [self postJsonWithPath:URLBASIC_momentadd parameters:params success:successBlock failure:failureBlock];
}
- (void)momentlistWithPageNumber:(NSUInteger)pageNumber
                               PageSize:(NSUInteger)pageSize
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_momentlist parameters:params success:successBlock failure:failureBlock];
}
- (void)momentcommentdeleteWithId:(NSUInteger)deleteId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(deleteId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_momentcommentdelete parameters:params success:successBlock failure:failureBlock];
}
- (void)momentcommentlistWithPageNumber:(NSUInteger)pageNumber
                        PageSize:(NSUInteger)pageSize
                          momentId:(NSUInteger)momentId
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [params setObject:@(momentId) forKey:@"momentId"];
    [self postJsonWithPath:URLBASIC_momentcommentlist parameters:params success:successBlock failure:failureBlock];
}
- (void)momentcommentsaveWithimages:(NSArray *)images
                     content:(NSString *)content
                    momentId:(NSUInteger)momentId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:content forKey:@"content"];
    [params setObject:images forKey:@"images"];
    [params setObject:@(momentId) forKey:@"momentId"];
    [self postJsonWithPath:URLBASIC_momentcommentsave parameters:params success:successBlock failure:failureBlock];
}
- (void)thumbsUpaddWithid:(NSUInteger )addId
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(addId) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_thumbsUpadd parameters:params success:successBlock failure:failureBlock];
}
- (void)thumbsUplistWithPageNumber:(NSUInteger)pageNumber
                        PageSize:(NSUInteger)pageSize
                         success:(RequestSuccess)successBlock
                         failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_thumbsUplist parameters:params success:successBlock failure:failureBlock];
}
- (void)thumbsUpdeleteWithId:(NSArray *)deleteIds
                          success:(RequestSuccess)successBlock
                          failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:deleteIds forKey:@"ids"];
    [self postJsonWithPath:URLBASIC_thumbsUpdelete parameters:params success:successBlock failure:failureBlock];
}
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
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    if (params && params.count) {
        [params setObject:travellers forKey:@"travellers"];
    }
//    NSString *time = [[NSDate date]formattedDateWithFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
//    time = [time stringByAppendingString:@"Z"];
//    time = [time stringByReplacingOccurrencesOfString:@" " withString:@"T"];
//    [params setObject:time forKey:@"date"];
    [params setObject:date forKey:@"date"];
    if (couponCode && couponCode.length) {
        [params setObject:couponCode forKey:@"couponCode"];
    }
    if (travelSpecificationId != 0) {
        [params setObject:@(travelSpecificationId) forKey:@"travelSpecificationId"];
    }
    if (periodNum != 0) {
        [params setObject:@(periodNum) forKey:@"periodNum"];
    }
    [self postJsonWithPath:URLBASIC_ordercalculate parameters:params success:successBlock failure:failureBlock];
}

- (void)appordercancelWithtSn:(NSString *)Sn
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:Sn forKey:@"sn"];
    [self postJsonWithPath:URLBASIC_appordercancel parameters:params success:successBlock failure:failureBlock];
}


- (void)ordercreateWithpaymentPluginId:(NSString *)paymentPluginId
                        mobile:(NSString *)mobile
                        travelId:(NSUInteger )travelId
                 travelSpecificationId:(NSUInteger )travelSpecificationId
                        travellers:(NSArray *)travellers
                                  date:(NSString *)date
                            couponCode:(NSString *)couponCode
                             periodNum:(NSUInteger )periodNum
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (paymentPluginId && paymentPluginId.length) {
        [params setObject:paymentPluginId forKey:@"paymentPluginId"];
    }
    [params setObject:mobile forKey:@"mobile"];
    [params setObject:@(travelId) forKey:@"travelId"];
    [params setObject:travellers forKey:@"travellers"];
    //    NSString *time = [[NSDate date]formattedDateWithFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    //    time = [time stringByAppendingString:@"Z"];
    //    time = [time stringByReplacingOccurrencesOfString:@" " withString:@"T"];
    //    [params setObject:time forKey:@"date"];
    [params setObject:date forKey:@"date"];
    if (couponCode && couponCode.length) {
        [params setObject:couponCode forKey:@"couponCode"];
    }
    if (periodNum != 0) {
        [params setObject:@(periodNum) forKey:@"periodNum"];
    }
    if (travelSpecificationId != 0) {
        [params setObject:@(travelSpecificationId) forKey:@"travelSpecificationId"];
    }
    [self postJsonWithPath:URLBASIC_ordercreate parameters:params success:successBlock failure:failureBlock];
}


- (void)apptravelsharingeditlId:(NSUInteger )idd
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_apptravelsharingedit parameters:params success:successBlock failure:failureBlock];
}

- (void)appcommonglobal_paramssuccess:(RequestSuccess)successBlock
                        failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appcommonglobal_params parameters:params success:successBlock failure:failureBlock];
}


- (void)orderinfoWithtravelId:(NSUInteger )travelId
                         date:(NSString *)date
                    periodNum:(NSUInteger )periodNum
        travelSpecificationId:(NSUInteger )travelSpecificationId
                     success:(RequestSuccess)successBlock
                     failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(travelId) forKey:@"travelId"];
    [params setObject:@(periodNum) forKey:@"periodNum"];
    [params setObject:@(travelSpecificationId) forKey:@"travelSpecificationId"];
    //    NSString *time = [[NSDate date]formattedDateWithFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    //    time = [time stringByAppendingString:@"Z"];
    //    time = [time stringByReplacingOccurrencesOfString:@" " withString:@"T"];
    //    [params setObject:time forKey:@"date"];
    
    [params setObject:date forKey:@"date"];
    [self postJsonWithPath:URLBASIC_orderinfo parameters:params success:successBlock failure:failureBlock];
}
- (void)paymentsubmitWithpaymentPluginId:(NSString *)paymentPluginId
                                      sn:(NSString *)sn
                                    type:(NSString *)type
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (type && type.length) {
        [params setObject:type forKey:@"type"];
    }
    if (sn && sn.length) {
        [params setObject:sn forKey:@"sn"];
    }
    if (paymentPluginId && paymentPluginId.length) {
        [params setObject:paymentPluginId forKey:@"paymentPluginId"];
    }
    [self postJsonWithPath:URLBASIC_paymentsubmit parameters:params success:successBlock failure:failureBlock];
}
- (void)appusereditWithNOnesuccess:(RequestSuccess)successBlock
                                 failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [self postJsonWithPath:URLBASIC_appuseredit parameters:params success:successBlock failure:failureBlock];
}
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
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    if (address && address.length) {
        [params setObject:address forKey:@"address"];
    }
    if (avatar && avatar.length) {
        [params setObject:avatar forKey:@"avatar"];
    }
    if (city && city.length) {
        [params setObject:city forKey:@"city"];
    }
    if (country && country.length) {
        [params setObject:country forKey:@"country"];
    }
    if (gender && gender.length) {
        [params setObject:gender forKey:@"gender"];
    }
    if (nickname && nickname.length) {
        [params setObject:nickname forKey:@"nickname"];
    }
    if (openId && openId.length) {
        [params setObject:openId forKey:@"openId"];
    }
    if (openIdType && openIdType.length) {
        [params setObject:openIdType forKey:@"type"];
    }
    if (province && province.length) {
        [params setObject:province forKey:@"province"];
    }
    if (unionid && unionid.length) {
        [params setObject:unionid forKey:@"unionid"];
    }
    [self postJsonWithPath:URLBASIC_apploginsubmit_trd parameters:params success:successBlock failure:failureBlock];
}

- (void)travelsharingdeleteWithidd:(NSUInteger)idd
                           success:(RequestSuccess)successBlock
                           failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(idd) forKey:@"id"];
    [self postJsonWithPath:URLBASIC_travelsharingdelete parameters:params success:successBlock failure:failureBlock];
}

- (void)travelgroup_trave_linecurrentWithPageNumber:(NSUInteger)pageNumber
                                        PageSize:(NSUInteger)pageSize
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_travelgroup_trave_linecurrent parameters:params success:successBlock failure:failureBlock];
}

- (void)appv2travelgroup_trave_linetravel_itineraryWithPageNumber:(NSUInteger)pageNumber
                                           PageSize:(NSUInteger)pageSize
                                            success:(RequestSuccess)successBlock
                                            failure:(RequestFailure)failureBlock{
    NSMutableDictionary *pageable = [[NSMutableDictionary alloc] init];
    [pageable setObject:@(pageNumber) forKey:@"pageNumber"];
    [pageable setObject:@(pageSize) forKey:@"pageSize"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:pageable forKey:@"pageable"];
    [self postJsonWithPath:URLBASIC_appv2travelgroup_trave_linetravel_itinerary parameters:params success:successBlock failure:failureBlock];
}



- (void)travelgroupTraveLineWithOrderId:(NSUInteger )orderId
                      success:(RequestSuccess)successBlock
                      failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(orderId) forKey:@"orderId"];
    [self postJsonWithPath:URLBASIC_travelgrouptraveline parameters:params success:successBlock failure:failureBlock];
}
- (void)travelKitsListWithOrderId:(NSUInteger )orderId
                                success:(RequestSuccess)successBlock
                                failure:(RequestFailure)failureBlock{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:@(orderId) forKey:@"orderId"];
    [self postJsonWithPath:URLBASIC_travelkitslist parameters:params success:successBlock failure:failureBlock];
}

-(void)wechatGetcode:(NSString *)code success:(WXRequestSuccess)successBlock
             failure:(WXRequestFailure)failureBlock{
    //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
    
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",WechatAppID,WechatAppSecret,code];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (dic[@"errcode"]) {
                    failureBlock(dic[@"errmsg"]);
                }else{
                    NSString *access_token = [dic objectForKey:@"access_token"];
                    NSString *openid = [dic objectForKey:@"openid"];
                    
                    NSLog(@"+++%@",access_token);
                    NSLog(@"+++%@",openid);
                    
                    
                    [self getUserInfo:access_token andopenid:openid success:(WXRequestSuccess)successBlock
                              failure:(WXRequestFailure)failureBlock];
                }
            }else{
                failureBlock(@"请重试");
            }
        });
    });
}


-(void)getUserInfo:(NSString *)accesstokenstr andopenid:(NSString *)openidstr success:(WXRequestSuccess)successBlock
           failure:(WXRequestFailure)failureBlock{
    
    // https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
    
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",accesstokenstr,openidstr];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                if (dic[@"errcode"]) {
                    failureBlock(dic[@"errmsg"]);
                }else{
                   successBlock(dic);
                }
            }else{
                failureBlock(@"请重试");
            }
        });
        
    });
}
@end
