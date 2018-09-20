//
//  draft.h
//  TourismT
//
//  Created by Store on 2017/6/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "YXTabItemBaseView.h"

@interface draft : YXTabItemBaseView
@property (nonatomic,strong) NSMutableArray *arry;
/**
 *  编辑草稿 mydraftPath的文件路径
 */
@property (copy,nonatomic) void (^EditDraft)(NSString *mydraftPath);
@end
