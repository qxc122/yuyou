//
//  SelectOrderVc.m
//  TourismT
//
//  Created by Store on 2017/6/28.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "SelectOrderVc.h"
#import "togetherLYCell.h"
#import "meiPan.h"
#import "SelectOrderHead.h"

@interface SelectOrderVc ()
@property (nonatomic,weak) UIButton *btn;

@property (nonatomic,strong) NSIndexPath *path;
@end

@implementation SelectOrderVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择订单";

    [self.basicTableView registerClass:[togetherLYCell class] forCellReuseIdentifier:NSStringFromClass([togetherLYCell class])];
    // Do any additional setup after loading the view.
    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    
    UIButton *btn = [UIButton new];
    self.btn = btn;
    self.btn.hidden = YES;
    btn.backgroundColor = ColorWithHex(0x789BF1, 1.0);
    [self.view addSubview:btn];
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.basicTableView.mas_bottom);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@50);
    }];
    btn.titleLabel.font = PingFangSC_Regular(17);
    [btn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
    [btn setTitle:@"下一步" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
    if (self.date) {
        self.empty_typeV2 = succes_empty_numV2;
    }else{
        [self.header beginRefreshing];
    }

    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithTitle:@"跳过" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = right;
}
#pragma -mark<跳过>
- (void)rightClick{
    [self OpenmeiPan:nil];
}
#pragma -mark<点击了下一步>
- (void)btnClick{
    if (!self.path) {
        [MBProgressHUD showPrompt:@"请先选择订单" toView:self.view];
    }else{
        [self OpenmeiPan:self.path];
    }
}
#pragma -mark<打开 meiPan 控制器>
- (void)OpenmeiPan:(NSIndexPath *)path{
    meiPan *vc =[[meiPan alloc]init];
    vc.CTrollersToR = @[[self class]];
    vc.orderId  =self.orderId;
    vc.seleImages = self.seleImages;
    if (path) {
        orderlistForOneS *date = self.date.Arry_orders[path.row];
        vc.date = date;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loadNewData{
    kWeakSelf(self);
    [[ToolRequest sharedInstance]appv2usersharingselect_ordersuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.date = [SelectOrder_date mj_objectWithKeyValues:dataDict];
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
        weakself.btn.hidden = NO;
        if (weakself.date.Arry_orders.count == 1) {
            weakself.path = [NSIndexPath indexPathForRow:0 inSection:0];
        }else if (weakself.date.Arry_orders.count == 0 || !weakself.date.Arry_orders){
            [weakself OpenmeiPan:self.path];
        }
#ifdef DEBUG
        NSDictionary *tmp = dataDict;
        NSString *strTmp = [NSString dictionaryToJson:tmp];
        NSLog(@"strTmp=%@",strTmp);
#endif
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([togetherLYCell class]) configuration:^(togetherLYCell *cell) {
        [weakself configuretogetherLYCell:cell atIndexPath:indexPath];
    }];
}

#pragma -mark<配置  togetherLYCell  cell>
- (void)configuretogetherLYCell:(togetherLYCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date.Arry_orders[indexPath.row];
    if (self.path && self.path.section == indexPath.section && self.path.row == indexPath.row) {
        cell.isSelected = YES;
    }else{
        cell.isSelected = NO;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        return 50-15;
    }
    return 0.001;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.empty_typeV2 == succes_empty_numV2) {
        SelectOrderHead *head = [SelectOrderHead new];
        return head;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.date.Arry_orders.count;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.path || (self.path.section != indexPath.section || self.path.row != indexPath.row)) {
        togetherLYCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected = YES;
        
        if (self.path) {
            togetherLYCell *cellPre = [tableView cellForRowAtIndexPath:self.path];
            cellPre.isSelected = NO;
        }
        self.path = indexPath;
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        togetherLYCell *cell = [togetherLYCell returnCellWith:tableView];
        [self configuretogetherLYCell:cell atIndexPath:indexPath];
        return  cell;
    }
    return nil;
}

@end
