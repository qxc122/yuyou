//
//  tongyonCell.h
//  TourismT
//
//  Created by Store on 16/12/15.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tongyonCell : UITableViewCell
@property (nonatomic,assign) BOOL hidenMore;
@property (nonatomic,assign) BOOL hidenMidle;
@property (nonatomic,assign) BOOL userEnaMidle;
@property (nonatomic,assign) BOOL hidenyouhui;
@property (nonatomic,strong) NSString *des; //设置替代文字
@property (nonatomic,strong) NSString *desOk;//设置非替代文字
@property (nonatomic,strong) NSString *title;
+ (instancetype)returnCellWith:(UITableView *)tableView;
/**
 *  点击每个cell的回调
 */
@property (nonatomic, copy) void (^textClick)(NSString *input);
@property (nonatomic,strong) YHQoneS *YHQSoneDate;

@end
