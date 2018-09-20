//
//  basicUiTableView.m
//  TourismT
//
//  Created by Store on 2017/7/24.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "basicUiTableView.h"
#import "UIImage+cir.h"
#import "AFNetworkReachabilityManager.h"

@interface basicUiTableView ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
//@property (nonatomic,assign) BOOL isNeedRefresh; 
@end

@implementation basicUiTableView
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.style = UITableViewStyleGrouped;
        self.Pagesize = tourPageSize;
        self.Pagenumber = Firstpage;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUiBasic];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(TOKENSUCCESS_block:)
                                                 name:TOKENSUCCESS
                                               object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(LoginAndExitNoticeFuc:)
                                                 name:LoginAndExitNotice
                                               object:nil];
}
#pragma --mark<登录退出的通知>
- (void)LoginAndExitNoticeFuc:(NSNotification *)user{
    self.isNeedRefreth = YES;
}
- (void)setUiBasic{
    [self setUitableViewstyle:self.style];
    self.basicTableView.delegate = self;
    self.basicTableView.dataSource = self;
    self.basicTableView.emptyDataSetSource = self;
    self.basicTableView.emptyDataSetDelegate = self;
}

- (void)setEmptyDelegate:(UICollectionView *)collectionView{
    collectionView.emptyDataSetSource = self;
    collectionView.emptyDataSetDelegate = self;
}
- (void)setEmptyDelegateUitableView:(UITableView *)tableView{
    tableView.emptyDataSetSource = self;
    tableView.emptyDataSetDelegate = self;
}
- (void)TOKENSUCCESS_block:(NSNotification *)user{
    if (self.empty_typeV2 != succes_empty_numV2 && self.basicTableView) {
        self.basicTableView.mj_header.hidden = NO;
        [self.basicTableView.mj_header beginRefreshing];
    }
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; 
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellT"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellT"];
    }
    return  cell;
}


- (void)loadNewDataEndHeadsuccessSet:(UITableView *)TableView code:(NSInteger)code footerIsShow:(BOOL)footerIsShow totalPages:(NSInteger)totalPages{
    if (!TableView) {
        TableView = self.basicTableView;
    }
    self.empty_typeV2 = code;
    [self.header endRefreshing];
    self.header.hidden = YES;
    [TableView reloadData];
    if (self.empty_typeV2 == succes_empty_numV2 && footerIsShow) {
        if (self.Pagenumber<totalPages) {
            self.footer.hidden = NO;
            if (self.footer.state == MJRefreshStateNoMoreData) {
                [self.footer resetNoMoreData];
            }
        }else{
            self.footer.hidden = YES;
        }
        self.Pagenumber++;
    }
}
- (void)loadNewDataEndHeadfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode{
    if (!TableView) {
        TableView = self.basicTableView;
    }
    self.empty_typeV2 = errorCode;
    [self.header endRefreshing];
    [TableView reloadData];
}

- (void)loadMoreDataEndFootsuccessSet:(UITableView *)TableView totalPages:(NSInteger)totalPages{
    if (!TableView) {
        TableView = self.basicTableView;
    }
    [self.footer endRefreshing];
    if (self.Pagenumber<totalPages) {
        self.footer.hidden = NO;
        if (self.footer.state == MJRefreshStateNoMoreData) {
            [self.footer resetNoMoreData];
        }
    }else{
        self.footer.hidden = YES;
    }
    self.Pagenumber++;
    [TableView reloadData];
}
- (void)loadMoreDataEndFootfailureSet:(UITableView *)TableView errorCode:(NSInteger)errorCode msg:(NSString *)msg{
    if (!TableView) {
        TableView = self.basicTableView;
    }
    if (msg && msg.length) {
        [MBProgressHUD showPrompt:msg toView:self.view];
    }
    [self.footer endRefreshing];
}

#pragma --<空白页处理>
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == succes_empty_numV2) {
        return [UIImage imageNamed:None_data_place_Pic];
    } else if (self.empty_typeV2 == fail_empty_numV2) {
        return [UIImage imageNamed:None_Net_place_Pic];
    } else if (self.empty_typeV2 == NoNetworkConnection_empty_numV2) {
        return [UIImage imageNamed:None_Net_place_Pic];
    }else{
        return [UIImage imageNamed:None_Net_place_Pic];
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == fail_empty_numV2) {
        NSString *text = @"服务器开小差了，刷新一下吧";
        NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if (self.empty_typeV2 == NoNetworkConnection_empty_numV2) {
            NSString *text = @"您的手机暂无网络连接~\n请检查设置您的网络状态";
            NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                         NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
            
            return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if (self.empty_typeV2 == succes_empty_numV2){
        NSString *text = self.NodataDescribe;
        NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else{
        NSString *text = @"服务器开小差了，刷新一下吧";
        NSDictionary *attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                                     NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0)};
        
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isNeedRefreth && self.isNeedRefreshWhenLoginOrOut && self.basicTableView) {
        self.isNeedRefreth = NO;
        self.header.hidden = NO;
        [self.header beginRefreshing];
    }
}
//
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
//    NSString *text=@"";
//    NSDictionary *attributes;
//    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
//    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
//    paragraph.alignment = NSTextAlignmentCenter;
//    if (self.empty_typeV2 == succes_empty_numV2) {
//        text = @"暂无数据";
//        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
//                       NSForegroundColorAttributeName: ColorWithHex(0xE6E6E6, 1.0),
//                       NSParagraphStyleAttributeName: paragraph};
//    }
//    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
//}

//按钮文本或者背景样式

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    NSString *text=@"";
    NSDictionary *attributes;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    
    if (self.empty_typeV2 == fail_empty_numV2) {
        text = @"重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                       NSForegroundColorAttributeName: ColorWithHex(0xFFFFFF, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else if(self.empty_typeV2 == succes_empty_numV2){

    }else if(self.empty_typeV2 == NoNetworkConnection_empty_numV2){
        
    }else{
        text = @"重新加载";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                       NSForegroundColorAttributeName: ColorWithHex(0xFFFFFF, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}
- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (self.empty_typeV2 == fail_empty_numV2) {
        return ImageNamed(@"服务器、网络错误，按钮");
    }else if(self.empty_typeV2 == succes_empty_numV2){
        
    }else if(self.empty_typeV2 == NoNetworkConnection_empty_numV2){
        
    }else{
        return ImageNamed(@"服务器、网络错误，按钮");
    }
    return nil;
}

//- (CGPoint)offsetForEmptyDataSet:(UIScrollView *)scrollView{
//      return CGPointMake(100, 700);
//}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView{
    return 50;
}

- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView{
    return 50.0;
}


//空白页的背景色

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIColor clearColor];
}

//是否显示空白页，默认YES
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    if (self.empty_typeV2 == In_loading_empty_numV2){
        return NO;
    }
    return YES;
}

//空白页点击事件
- (void)emptyDataSetDidTapView:(UIScrollView *)scrollView {
    [self DidTap];
}

- (void)emptyDataSetDidTapButton:(UIScrollView *)scrollView{
    [self DidTap];
}
- (void)DidTap{
    if (self.empty_typeV2 != succes_empty_numV2) {
        if ([AFNetworkReachabilityManager sharedManager].reachable) {
            self.basicTableView.mj_header.hidden = NO;
            [self.basicTableView.mj_header beginRefreshing];
        }
    }
}
@end

