//
//  noticeVc.m
//  TourismT
//
//  Created by Store on 2017/6/22.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "noticeVc.h"
#import "noticeBasicCell.h"
#import "myOreserDetail.h"
#import "NSString+check.h"
#import "TransactionDetailsVc.h"
#import "timeCell.h"
#import "HaveArry.h"
#import "HaveMemo.h"
#import "HaveArryAndMemo.h"
#import "YYText.h"
#import "NSAttributedString+YYText.h"
#import "NSString+check.h"
#import "myCodeYHQ.h"
#import "lookWkweb.h"
#import "myStageVc.h"
@interface noticeVc ()

@property (nonatomic,strong) banyouNoticationS *datess;

@property (nonatomic,strong) NSMutableArray *Arry_data;

@property (nonatomic,assign) BOOL isLook; //是否查看了通知
@end

@implementation noticeVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Arry_data = [NSMutableArray array];
    self.basicTableView.backgroundColor = ColorWithHex(0xF3f3f3, 1.0);
    [self.basicTableView registerClass:[noticeBasicCell class] forCellReuseIdentifier:NSStringFromClass([noticeBasicCell class])];
    [self.basicTableView registerClass:[HaveArry class] forCellReuseIdentifier:NSStringFromClass([HaveArry class])];
    [self.basicTableView registerClass:[HaveMemo class] forCellReuseIdentifier:NSStringFromClass([HaveMemo class])];
    [self.basicTableView registerClass:[HaveArryAndMemo class] forCellReuseIdentifier:NSStringFromClass([HaveArryAndMemo class])];
    [self.basicTableView registerClass:[timeCell class] forCellReuseIdentifier:NSStringFromClass([timeCell class])];
//    self.basicTableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    // Do any additional setup after loading the view.

    self.title = @"通知";
    [self.header beginRefreshing];
}

- (void)loadNewData{
    self.Pagenumber = Firstpage;
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appusermessagelistWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.datess = [banyouNoticationS mj_objectWithKeyValues:dataDict];
//        weakself.Arry_data = weakself.datess.contentA;
        
        for (banyouNoticationForOneS *first in weakself.datess.contentA) {
            [weakself.Arry_data addObject:[NSDate formattedTimeFromTimeInterval:first.time]];
            [weakself.Arry_data addObject:first];
        }

        
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:weakself.datess.totalPages];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}
- (void)loadMoreData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appusermessagelistWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        banyouNoticationS *datess = [banyouNoticationS mj_objectWithKeyValues:dataDict];
//        [weakself.Arry_data addObjectsFromArray:datess.contentA];
        for (banyouNoticationForOneS *first in datess.contentA) {
            [weakself.Arry_data addObject:[NSDate formattedTimeFromTimeInterval:first.time]];
            [weakself.Arry_data addObject:first];
        }
        [weakself loadMoreDataEndFootsuccessSet:nil totalPages:datess.totalPages];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id data = self.Arry_data[indexPath.row];
    kWeakSelf(self);
    if (![data isKindOfClass:[banyouNoticationForOneS class]]) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([timeCell class]) configuration:^(timeCell *cell) {
            [weakself configuretimeCell:cell atIndexPath:indexPath];
        }];
    } else {
        banyouNoticationForOneS *datTmp = (banyouNoticationForOneS *)data;
//        CGFloat basic = [NSString HeightForText:datTmp.content withFont:PingFangSC_Regular(14) withTextWidth:(ScreenWidth-60.0)];
//        basic += 46+15+0.5+15+15+15;
        if (datTmp.Arry_dataMaps && datTmp.Arry_dataMaps.count && datTmp.memo && datTmp.memo.length) {
            return  [tableView fd_heightForCellWithIdentifier:NSStringFromClass([HaveArryAndMemo class]) configuration:^(HaveArryAndMemo *cell) {
                [weakself configureHaveArryAndMemo:cell atIndexPath:indexPath];
            }];
//            CGFloat basicMemo = [NSString HeightForText:datTmp.memo withFont:PingFangSC_Regular(14) withTextWidth:ScreenWidth-60];
//            basicMemo += 15+14;
//            CGFloat YYheig = [self HaveArry_CalculatedHeightAtIndexPath:datTmp];
//            return basic+basicMemo+YYheig+15;
        } else if (datTmp.Arry_dataMaps && datTmp.Arry_dataMaps.count && !datTmp.memo && !datTmp.memo.length) {
            return  [tableView fd_heightForCellWithIdentifier:NSStringFromClass([HaveArry class]) configuration:^(HaveArry *cell) {
                [weakself configureHaveArry:cell atIndexPath:indexPath];
            }];
//            CGFloat YYheig = [self HaveArry_CalculatedHeightAtIndexPath:datTmp];
//            return basic+YYheig+15;
        }else if (!datTmp.Arry_dataMaps.count && datTmp.memo && datTmp.memo.length) {
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([HaveMemo class]) configuration:^(HaveMemo *cell) {
                [weakself configureHaveMemo:cell atIndexPath:indexPath];
            }];
            
//            CGFloat basicMemo = [NSString HeightForText:datTmp.memo withFont:PingFangSC_Regular(14) withTextWidth:ScreenWidth-60];
//            basicMemo += 15+14;
//            return basic+basicMemo;
        }else {
//            return basic;
            return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([noticeBasicCell class]) configuration:^(noticeBasicCell *cell) {
                [weakself configurenoticeBasicCell:cell atIndexPath:indexPath];
            }];
        }
    }
    return 0.01;
}

//- (CGFloat)HaveArry_CalculatedHeightAtIndexPath:(banyouNoticationForOneS *)oneDate{
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x000000, 0.4),NSForegroundColorAttributeName, nil];
//    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x000000, 0.87),NSForegroundColorAttributeName, nil];
//    
//    NSMutableAttributedString *All = [NSMutableAttributedString new];
//    for (dataMapsOne *one in oneDate.Arry_dataMaps) {
//        NSMutableAttributedString *text = [NSMutableAttributedString new];
//        [text appendAttributedString:[[NSAttributedString alloc] initWithString:one.name attributes:dic]];
//        CGFloat width = [NSString WidthForText:one.name withFont:PingFangSC_Regular(14)];
//        UIView *place = [[UIView alloc]initWithFrame:CGRectMake(0, 0, spaceing_width-width, 10)];
//        
//        NSMutableAttributedString *attachText3 = [NSMutableAttributedString yy_attachmentStringWithContent:place contentMode:UIViewContentModeCenter attachmentSize:place.frame.size alignToFont:PingFangSC_Regular(14) alignment:YYTextVerticalAlignmentTop];
//        [text appendAttributedString:attachText3];
//        
//        if (![one isEqual:[oneDate.Arry_dataMaps lastObject]]) {
//            one.value = [one.value stringByAppendingString:@"\n"];
//        }
//        [text appendAttributedString:[[NSAttributedString alloc] initWithString:one.value attributes:dic2]];
//        text.yy_headIndent = spaceing_width;
//        text.yy_paragraphSpacing = 12;
//        [All appendAttributedString:text];
//    }
//    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(ScreenWidth-30-30, MAXFLOAT) text:All];
//    return layout.textBoundingSize.height;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.Arry_data.count;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self OpenVc:YES :indexPath];
    
}
/*
#pragma --mark< 编辑  cell >
-(NSArray *)tableView:(UITableView* )tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    kWeakSelf(self);
    
    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
        banyouNoticationForOneS *oneDate = weakself.datess.contentA[indexPath.row];
        [weakself delsetshouc:oneDate.idd IndexPath:indexPath];
    }];
    deleteRoWAction.backgroundColor = [UIColor redColor];//可以定义RowAction的颜色
    return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
}
#pragma --mark< 是否可以编辑 cell >
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return  YES;
}

#pragma --mark< 删除消息中 cell >
- (void)delsetshouc:(NSInteger )idd IndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中.." toView:weakself.view];
    [[ToolRequest sharedInstance]appusernotifydeleteWithIdd:idd success:^(id dataDict, NSString *msg, NSInteger code) {
        [weakself.datess.contentA removeObjectAtIndex:indexPath.row];
        [weakself.basicTableView beginUpdates];
        [weakself.basicTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [weakself.basicTableView endUpdates];
        [MBProgressHUD hideHUDForView:weakself.view];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}
 */
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id data = self.Arry_data[indexPath.row];
    if (![data isKindOfClass:[banyouNoticationForOneS class]]) {
        timeCell *cell = [timeCell returnCellWith:tableView];
        [self configuretimeCell:cell atIndexPath:indexPath];
        return  cell;
    } else {
        banyouNoticationForOneS *datTmp = (banyouNoticationForOneS *)data;
        if (datTmp.Arry_dataMaps && datTmp.Arry_dataMaps.count && datTmp.memo && datTmp.memo.length) {
            HaveArryAndMemo *cell = [HaveArryAndMemo returnCellWith:tableView];
            [self configureHaveArryAndMemo:cell atIndexPath:indexPath];
            return  cell;
        } else if (datTmp.Arry_dataMaps && datTmp.Arry_dataMaps.count && (!datTmp.memo || !datTmp.memo.length)) {
            HaveArry *cell = [HaveArry returnCellWith:tableView];
            [self configureHaveArry:cell atIndexPath:indexPath];
            return  cell;
        }else if ((!datTmp.Arry_dataMaps || !datTmp.Arry_dataMaps.count) && datTmp.memo && datTmp.memo.length) {
            HaveMemo *cell = [HaveMemo returnCellWith:tableView];
            [self configureHaveMemo:cell atIndexPath:indexPath];
            return  cell;
        }else {
            noticeBasicCell *cell = [noticeBasicCell returnCellWith:tableView];
            [self configurenoticeBasicCell:cell atIndexPath:indexPath];
            return  cell;
        }
    }
    return nil;
}

#pragma --mark<配置  timeCell  >
- (void)configuretimeCell:(timeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.timeStr =  self.Arry_data[indexPath.row];
}
#pragma --mark<配置  timeCell  >
- (void)configurenoticeBasicCell:(noticeBasicCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneDate = self.Arry_data[indexPath.row];
}
#pragma --mark<配置  timeCell  >
- (void)configureHaveArry:(HaveArry *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneDate = self.Arry_data[indexPath.row];
}
#pragma --mark<配置  timeCell  >
- (void)configureHaveMemo:(HaveMemo *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneDate = self.Arry_data[indexPath.row];
}
#pragma --mark<配置  timeCell  >
- (void)configureHaveArryAndMemo:(HaveArryAndMemo *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.oneDate = self.Arry_data[indexPath.row];
}

-(UIViewController *)OpenVc:(BOOL)IsOpen :(NSIndexPath *)indexPath{
    id data = self.Arry_data[indexPath.row];
    if ([data isKindOfClass:[banyouNoticationForOneS class]]) {
        self.isLook = YES;
        banyouNoticationForOneS *oneDate = data;
        //    JourneyVc *vc =[[JourneyVc alloc]init];
        //    vc.snId = 117021374214348;
        //    [self.navigationController pushViewController:vc animated:YES];
        
        if ([oneDate.type isEqualToString:notication_order]) {
            myOreserDetail *vc = [[myOreserDetail alloc]init];
            orderlistForOneS *datess = [[orderlistForOneS alloc]init];
            datess.idd = [oneDate.urlParam integerValue];
            vc.datess = datess;
            if (IsOpen) {
                [self.navigationController pushViewController:vc animated:YES];
            } else {
                return vc;
            }
        } else if([oneDate.type isEqualToString:notication_tips]){
//            JourneyVc *vc =[[JourneyVc alloc]init];
//            vc.snId = [oneDate.urlParam integerValue];
//            if (IsOpen) {
//                [self.navigationController pushViewController:vc animated:YES];
//            } else {
//                return vc;
//            }
        } else if([oneDate.type isEqualToString:notication_repayment]){//还款成功
            if (oneDate.urlParam.length) {
                TransactionDetailsVc *vc = [TransactionDetailsVc new];
                vc.billId = [oneDate.urlParam integerValue];
                [self.navigationController pushViewController:vc animated:YES];
            } else {
                myStageVc *vc = [[myStageVc alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        } else if([oneDate.type isEqualToString:notication_activity]){//还款成功
            lookWkweb *vc = [[lookWkweb alloc]init];
            vc.url = oneDate.urlParam;
            vc.IsHaveshareBtn = NO;
            [self.navigationController pushViewController:vc animated:YES];
        } else if([oneDate.type isEqualToString:notication_coupon]){//还款成功
            myCodeYHQ *vc = [[myCodeYHQ alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
        kWeakSelf(self);
        [[ToolRequest sharedInstance]appusermessageviewWithIdd:oneDate.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            oneDate.isRead = YES;
            [weakself.Arry_data replaceObjectAtIndex:indexPath.row withObject:oneDate];
            [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        } failure:^(NSInteger errorCode, NSString *msg) {
            
        }];
    }
    return nil;
}

- (void)dealloc{
    if (self.isLook && self.noticeVcLook) {
        self.noticeVcLook();
    }
}
@end
