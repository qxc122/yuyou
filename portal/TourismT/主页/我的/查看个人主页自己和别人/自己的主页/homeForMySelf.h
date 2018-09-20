//
//  homeForMySelf.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeForMySelf : UIView
/**
 *  查看分享的 网页详情
 */
@property (copy,nonatomic) void (^shareORkeep)(travelSharingsS *one);
/**
 *  编辑草稿 mydraftPath的文件路径
 */
@property (copy,nonatomic) void (^EditDraft)(NSString *mydraftPath);
@property (nonatomic,strong) peoHome_page *oneData;
/*
 @[@{
 @"title":@"图文介绍",
 @"view":@"PicAndTextIntroduceView",
 @"data":@"图文介绍的数据",
 @"position":@0
 },@{
 @"title":@"商品详情",
 @"view":@"ItemDetailView",
 @"data":@"商品详情的数据",
 @"position":@1
 },@{
 @"title":@"评价(273)",
 @"view":@"CommentView",
 @"data":@"评价的数据",
 @"position":@2
 }];
 */
-(instancetype)initWithTabConfigArray:(NSArray *)tabConfigArray;//tab页配置数组
@end
