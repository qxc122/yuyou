//
//  delAlbummyOrtherHomeCell.h
//  TourismT
//
//  Created by Store on 2017/6/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "AlbummyOrtherHomeCell.h"

@interface delAlbummyOrtherHomeCell : AlbummyOrtherHomeCell
/**
 *  编辑草稿 mydraftPath的文件路径
 */
@property (copy,nonatomic) void (^delDraft)(NSString *mydraftPath);

@property (nonatomic,assign) BOOL isSelect;
@end
