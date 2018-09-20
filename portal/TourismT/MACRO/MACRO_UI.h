//
//  MACRO_UI.h
//  Tourism
//
//  Created by Store on 16/11/8.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#ifndef MACRO_UI_h
#define MACRO_UI_h


typedef NS_ENUM(NSInteger, PROTYPEheadThreek_ENMU)
{
    PROTYPELDheadThreek_ENMU,//亮点
    PROTYPEXLheadThreek_ENMU,//线路
    PROTYPEPLheadThreek_ENMU,//评论
};


#define     FuzzyCoefficient 0.07f

#define placeholderLabeltextColor ColorWithHex(0x000000, 0.3) 

//旅程mokuai
//小圆点距离左边的距离

#define  pingjia_place_image  @"评价空状态"   //一般空状态

#define  noitems_normal_image  @"空状态dd"   //一般空状态
#define  noitems_lucheng_image  @"lckztch"   //旅程空状态

#define  noitems_empth_image  @"空状态dd"   //首页  没有产品的图片
#define  together_empth_image  @"空状态dd"   //与游页面  没有旅程的话
#define  please_login_image  @"空状态dd"   //请先登录图片
#define  load_fail_image  @"404"   //加载失败的图片
#define  pingjia_dele_image  @"删除phon"   //评价页面用到的
#define  load_fail_head_image  @"未标题"   //头像的替代图片
#define  load_noneconteit_image  @"空状态dd"   //我的好友页面  还没有任何好友图片


#define  load_chatLIst_image  @"HXpic"   //会话列表



#define  chat_place_Pic  @"聊天空的"   //
#define  None_data_place_Pic  @"无数据啊"   //

#define  None_Net_place_Pic  @"无网络啊"   //

#define heigtTwo ScreenHeight - HEIGHT_Navbar   //产品详情的高度



#define  place_image_image  @"未标题"   //一般图片的替代图片

#define  kefu_head_image  @"客服小与"   //客服的头像
//#define  kefu_head_emoid  @"75412562"   //客服id
#define  kefu_head_emoid  @"kefu"   //客服id
#define  kefu_name_emoid  @"客服小与"   //客服名字

#define  HeightCarousel  120*HEIGHTICON
#define  spaceingToleft  56
#define  IMAGE_NAME_DIAN  @"123"
#define  IMAGE_NAME_XUXIAN  @"Linexuxian"
#define   IMAGE_back @"back"
#define   IMAGE_bigBack @"未标题"   //替代图片
#define   IMAGE_bigALLBack @"Rectangle"   //
#define   IMAGE_NavcBack @"导航栏入"   //

#define spaceing_line_to_bottom  50  //产品详情下面的高度


#define IMAGE_JIEtou  @"456"

#define HEIGHT_branch  50.f

//心愿卡
#define NOneHead  80
#define NOneFoot  79
//心愿卡


//提交订单
#define HEIGHT_NEXTBTN  50
//提交订单


#define  cornerRadius_width  4.0f
#define  tag_must_deleted  1824
#endif /* MACRO_UI_h */
