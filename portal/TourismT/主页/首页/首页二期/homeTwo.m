//
//  homeTwo.m
//  TourismT
//
//  Created by Store on 2017/7/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "homeTwo.h"
#import "homeTwoWillGoCellHead.h"
#import "homeTwoShareCellHead.h"
#import "homeTwoCarouselCell.h"
#import "homeTwoTypeListCell.h"
#import "homeTwoTypeCell.h"
#import "homeTwoWillGoCell.h"
#import "homeTwoShareCell.h"
#import "tourDetais.h"
#import "lookWkweb.h"
#import "myOrotherHome.h"
#import "NSUserDefaults+storage.h"
#import "MACRO_URL.h"
#import "homeTwoFoot.h"

#import "BindingResults.h"
@interface homeTwo ()
@property (nonatomic,assign) NSInteger RowType; //选中的Row Type

@property (nonatomic,strong) homeDataV2 *date;

@end

@implementation homeTwo
- (void)viewDidLoad {
    [super viewDidLoad];
    self.RowType = 0; //默认选中第一个 类型
    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, HEIGHT_bottmo, 0);
    [self.basicTableView registerClass:[homeTwoCarouselCell class] forCellReuseIdentifier:NSStringFromClass([homeTwoCarouselCell class])];
        [self.basicTableView registerClass:[homeTwoTypeListCell class] forCellReuseIdentifier:NSStringFromClass([homeTwoTypeListCell class])];
        [self.basicTableView registerClass:[homeTwoTypeCell class] forCellReuseIdentifier:NSStringFromClass([homeTwoTypeCell class])];
        [self.basicTableView registerClass:[homeTwoWillGoCell class] forCellReuseIdentifier:NSStringFromClass([homeTwoWillGoCell class])];
        [self.basicTableView registerClass:[homeTwoShareCell class] forCellReuseIdentifier:NSStringFromClass([homeTwoShareCell class])];
    [self.header beginRefreshing];
    
//    RiskVerification *tmp = [RiskVerification new];
//    tmp.info = NO;
//    tmp.risk = NO;
//    tmp.fright = NO;
//
//    BindingResults *view = [BindingResults new];
//    view.endCountDown = ^(){
//
//    };
//    view.date = tmp;
//    [view windosViewshow];
}

- (void)loadNewData{
    self.Pagenumber = Firstpage;
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2indexWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.date = [homeDataV2 mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:YES totalPages:1000];
        weakself.header.hidden = NO;
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
        NSNotification *notification =[NSNotification notificationWithName:TheTeachingPageIsDisplayed object:nil userInfo:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        
        if (weakself.date.travelSharingsArry.count >= weakself.date.travelSharingsTotal){
            weakself.footer.hidden = YES;
        }else{
            weakself.footer.hidden = NO;
        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

- (void)loadMoreData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2findTravelSharingsWithPageNumber:self.Pagenumber PageSize:self.Pagesize success:^(id dataDict, NSString *msg, NSInteger code) {
        homecontent *date = [homecontent mj_objectWithKeyValues:dataDict];
        [weakself.date.travelSharingsArry addObjectsFromArray:date.content_Arry];
        
        weakself.date.pageableD = date.pageableD;
        weakself.date.total = date.total;
        weakself.date.totalPages = date.totalPages;
        
        [weakself loadMoreDataEndFootsuccessSet:nil totalPages:date.totalPages];
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
        if (weakself.date.travelSharingsArry.count >= weakself.date.travelSharingsTotal){
            weakself.footer.hidden = YES;
        }else{
            weakself.footer.hidden = NO;
        }
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadMoreDataEndFootfailureSet:nil errorCode:errorCode msg:msg];
    }];
}
- (void)hideBottomBarWhenPush{}
- (void)customBackButton{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [button setTitle:@" 深圳" forState:UIControlStateNormal];
    [button setImage:ImageNamed(@"定位") forState:UIControlStateNormal];
    [button setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    button.titleLabel.font = PingFangSC_Regular(14);
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 0);
    
    // 让按钮内部的所有内容左对齐
    //    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    // 修改导航栏左边的item
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
#ifdef DEBUG
    [button addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
#endif
}

#ifdef DEBUG
- (void)backBtnClick:(UIButton *)btn{
    
    NSFileManager *manager = [NSFileManager defaultManager];
    // 删除
    BOOL isDelete = [manager removeItemAtPath:PATH_appid error:nil];
    if (isDelete) {
        [MBProgressHUD showLoadingMessage:@"删除appid 成功"];
    }
    
    [[tourHelper sharedInstance]logUrlOutView:self.view];
    
    NSString *strles = [NSUserDefaults getObjectWithKey:URLAddress];
    if ([strles isEqualToString:tesetURLAddress]) {
        [NSUserDefaults setObject:productURLAddress withKey:URLAddress];
        strles = productURLAddress;
        [MBProgressHUD showLoadingMessage:@"现在是正式环境,请退出重启app"];
    }else{
        [NSUserDefaults setObject:tesetURLAddress withKey:URLAddress];
        strles = tesetURLAddress;
        [MBProgressHUD showLoadingMessage:@"现在是测试环境,请退出重启app"];
    }
}
#endif


#pragma -mark<每组cell的数量>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        
    } else if (section==1) {
        
    } else if (section==2) {
        
    } else if (section==3) {
        return self.date.joinUserArry.count;
    } else if (section==4) {
        return self.date.travelSharingsArry.count;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.date) {
        return 5;
    }
    return 0;
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        homeTwoCarouselCell *cell = [homeTwoCarouselCell returnCellWith:tableView];
        [self configurehomeTwoCarouselCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section==1) {
        homeTwoTypeCell *cell = [homeTwoTypeCell returnCellWith:tableView];
        [self configurehomeTwoTypeCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section==2) {
        homeTwoTypeListCell *cell = [homeTwoTypeListCell returnCellWith:tableView];
        [self configurehomeTwoTypeListCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section==3) {
        homeTwoWillGoCell *cell = [homeTwoWillGoCell returnCellWith:tableView];
        [self configurehomeTwoWillGoCell:cell atIndexPath:indexPath];
        return  cell;
    } else if (indexPath.section==4) {
        homeTwoShareCell *cell = [homeTwoShareCell returnCellWith:tableView];
        [self configurehomeTwoShareCell:cell atIndexPath:indexPath];
        return  cell;
    }
    return nil;
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (indexPath.section==0) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([homeTwoCarouselCell class]) configuration:^(homeTwoCarouselCell *cell) {
            [weakself configurehomeTwoCarouselCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section==1) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([homeTwoTypeCell class]) configuration:^(homeTwoTypeCell *cell) {
            [weakself configurehomeTwoTypeCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section==2) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([homeTwoTypeListCell class]) configuration:^(homeTwoTypeListCell *cell) {
            [weakself configurehomeTwoTypeListCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section==3) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([homeTwoWillGoCell class]) configuration:^(homeTwoWillGoCell *cell) {
            [weakself configurehomeTwoWillGoCell:cell atIndexPath:indexPath];
        }];
    } else if (indexPath.section==4) {
        return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([homeTwoShareCell class]) configuration:^(homeTwoShareCell *cell) {
            [weakself configurehomeTwoShareCell:cell atIndexPath:indexPath];
        }];
    }
    return 0.01;
}

#pragma --mark<选中了cell>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==3) {
//        UserS *date = self.date.joinUserArry[indexPath.row];
//        [self OpentourDetais:date.travelId];
//    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        homeTwoWillGoCellHead *head = [homeTwoWillGoCellHead new];
        return head;
    } else if (section == 4){
        homeTwoShareCellHead *head = [homeTwoShareCellHead new];
        return head;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 3) {
        return 70;
    } else if (section == 4){
        return 70;
    }
    return 0.01;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 4 && self.date.travelSharingsArry.count >= self.date.travelSharingsTotal){
            homeTwoFoot *foot = [homeTwoFoot new];
            return foot;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 4 && self.date.travelSharingsArry.count >= self.date.travelSharingsTotal){
            return 52.0;
    }
    return 0.001;
}
#pragma --mark<打开产品详情 控制器>
- (void)OpentourDetais:(NSInteger )idd{
    tourDetais *tourdetai = [[tourDetais alloc]init];
    tourdetai.idd = idd;
    [self.navigationController pushViewController:tourdetai animated:YES];
}

#pragma --mark< 配置homeTwoCarouselCell 的数据>
- (void)configurehomeTwoCarouselCell:(homeTwoCarouselCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date =self.date;
    kWeakSelf(self);
    cell.SelectionIndex = ^(ads_one *date) {
        if (date.url) {
            [weakself OpenLookWkweb:date.url IsShared:NO];
        }
    };
}
#pragma --mark< 配置homeTwoTypeCell 的数据>
- (void)configurehomeTwoTypeCell:(homeTwoTypeCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    cell.SelectionType = ^(NSInteger type) {
        weakself.RowType = type;
        [weakself.basicTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
        NSLog(@"type=%ld",(long)type);
    };
    cell.Row = self.RowType;
    cell.date =self.date;
}
#pragma --mark< 配置homeTwoTypeListCell 的数据>
- (void)configurehomeTwoTypeListCell:(homeTwoTypeListCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.RowType = self.RowType;
    cell.date =self.date;
    kWeakSelf(self);
    cell.SelectionIndex = ^(NSInteger index) {
        homeDataV2_Type *type = weakself.date.travelThemeListArry[weakself.RowType];
        contentS *date= type.travels_Arry[index];
        [weakself OpentourDetais:date.idd];
    };
}

#pragma --mark< 配置homeTwoWillGoCell 的数据>
- (void)configurehomeTwoWillGoCell:(homeTwoWillGoCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date.joinUserArry[indexPath.row];
    kWeakSelf(self);
    cell.SelectionIndex = ^(UserS *date) {
        [weakself OpentourDetais:date.travelId];
    };
    cell.IconClick = ^(UserS *date) {
        [weakself OpenmyOrotherHome:date.idd];
    };
}
#pragma --mark<打开个人主页控制器>
- (void)OpenmyOrotherHome:(NSInteger )idd{
    myOrotherHome *vc = [myOrotherHome new];
    vc.idd = idd;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma --mark< 配置cell 的数据>
- (void)configurehomeTwoShareCell:(homeTwoShareCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date.travelSharingsArry[indexPath.row];
    kWeakSelf(self);
    cell.SelectionIndex = ^(travelSharingsS *date) {
        [weakself OpenLookWkweb:date.path IsShared:YES];
    };
//    cell.IconClick = ^(UserS *date) {
//        [weakself OpenmyOrotherHome:date.idd];
//    };
}

#pragma --mark<打开产品详情 控制器>
- (void)OpenLookWkweb:(NSString *)url IsShared:(BOOL)IsShared{
    lookWkweb *vc = [[lookWkweb alloc]init];
    vc.url = url;
    if (IsShared) {
        vc.IsHaveshareBtn = YES;
        vc.IsdemeiPan = NO;
        vc.IsxiangshiOKbtn = NO;
        vc.isHaveRightBtnDelete = NO;
    }else{
        vc.isHaveRightBtnb = NO;
    }
    [self.navigationController pushViewController:vc animated:YES];
}


//@interface lookWkweb : basicVc
//@property (nonatomic,assign) BOOL IsHaveshareBtn; //是否有分享按钮
//@property (nonatomic,assign) BOOL IsHaveDelBtn; //是否有删除按钮
//@property (nonatomic,strong) NSString *url;


@end
