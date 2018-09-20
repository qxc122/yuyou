//
//  MACRO_ENUM.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_ENUM_h
#define MACRO_ENUM_h

typedef NS_ENUM(NSInteger, goType_ENMU)
{
    Lchuan_ENMU,//轮船
    Bshi_ENMU,//巴士
    Air_ENMU,//飞机
};


//网络请求状态
typedef NS_ENUM(NSInteger, RespondCode)
{
    /** 系统错误 */
//    ERR_100("100"),
//    
//    /** 缺少参数 */
//    ERR_102("102"),
//    
//    /** 参数错误 */
//    ERR_104("104"),
//    
//    /** 签名错误 */
//    ERR_105("105"),
//    
//    /** 缺少Token */
//    ERR_106("106"),
//    
//    /** Token无效 */
//    ERR_107("107"),
//    
//    /** 用户未登录 */
//    ERR_108("108"),
//    
//    /** 服务器错误 */
//    ERR_500("500"),
//    
//    /** 服务器不可用 */
//    ERR_501("501");
    
    appTOKENING               = -159,    //申请token中
    KRespondImageCodeFail         = -1875,    //图片压缩失败
    kRespondCodeloOut            = 108,    /** 用户未登录 */
    kRespondCodeNotJson            = -12313,    //服务器返回数据格式错误
    KRespondCodeFail               = -12314,    //加载失败
    KRespondCodeNotConnect         = -12315,    //网络无连接
    KRespondCodeNone               = -12316,    //服务器放回数据为空
    kRespondCodeSuccess            = 0,
    kRespondCodeFial                = 1, /** 成功 */
    kRespondCodeWaring            = 2, //请求成功，但是业务失败
    kRespondCodeExoipDateAccessToken = 107,   /** Token无效 */
    kRespondCodeOutDateAccessToken = 106,   /** 缺少Token */
    KRespondCodeLoginTimeOut       = -105,
    KRespondCodeAppidinvalid       = 109,  //appid 无效
};



#endif /* MACRO_ENUM_h */
