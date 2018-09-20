//
//  myCardBank.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myCardBank.h"
#import "myCardBankCell.h"
#import "UIImage+cir.h"
#import "realNameAuthenticationVc.h"

@interface myCardBank ()
@property (nonatomic,weak) UIButton *btnNext;
@property (nonatomic,strong) BindBankCard *date;
@end

@implementation myCardBank

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    self.title = @"我的银行卡";
    [self.header beginRefreshing];
}

- (void)setUI{
    [self.basicTableView registerClass:[myCardBankCell class] forCellReuseIdentifier:NSStringFromClass([myCardBankCell class])];
    
    UIButton *btnNext = [UIButton new];
    self.btnNext = btnNext;
    self.btnNext.hidden = YES;
    [self.view addSubview:btnNext];
    [btnNext setBackgroundImage:[UIImage imageWithColor:ColorWithHex(0x7692F3, 1.0)] forState:UIControlStateNormal];
    [btnNext setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
//    [btnNext setTitle:@"更换银行卡" forState:UIControlStateNormal];//TODO
    btnNext.titleLabel.font = PingFangSC_Regular(17);
    [btnNext addTarget:self action:@selector(btnNextClick) forControlEvents:UIControlEventTouchUpInside];

    [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.height.equalTo(@(50));
        make.bottom.equalTo(self.view);
    }];
    
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.bottom.equalTo(self.btnNext.mas_top);
        make.top.equalTo(self.view);
    }];
}
#pragma -mark<添加银行卡 或者 去更换银行卡>
-(void)btnNextClick{
    realNameAuthenticationVc *vc = [realNameAuthenticationVc new];
    if (self.date) {
        BindBankCard *tmp = [BindBankCard new];
        tmp.realname = self.date.realname;
        tmp.idCard = self.date.idCard;
        vc.BankCardDate = tmp;
    }
    kWeakSelf(self);
    vc.AuthenticationSuccess = ^(){
        weakself.basicTableView.mj_header.hidden = NO;
        [weakself.basicTableView.mj_header beginRefreshing];
    };
    vc.title = self.date?@"更换银行卡":@"添加银行卡";
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)loadNewData{
    __weak typeof(self) weakSelf = self;
    [[ToolRequest sharedInstance]appuserapprovecard_listsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        weakSelf.btnNext.hidden = NO;
        weakSelf.date =[BindBankCard mj_objectWithKeyValues:dataDict];
        if (weakSelf.date.bankCardNo && weakSelf.date.bankCardNo.length) {
            [weakSelf.btnNext setTitle:@"更换银行卡" forState:UIControlStateNormal];
        } else {
            weakSelf.date = nil;
            [weakSelf.btnNext setTitle:@"添加银行卡" forState:UIControlStateNormal];
        }
        [weakSelf loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakSelf loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}


#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myCardBankCell class]) configuration:^(myCardBankCell *cell) {
        [weakself configuremyCardBankCell:cell atIndexPath:indexPath];
    }];
}
#pragma --mark< 配置推荐cell 的数据>
- (void)configuremyCardBankCell:(myCardBankCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.date = self.date;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}
#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.date?1:0;
}

#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myCardBankCell *cell = [myCardBankCell returnCellWith:tableView];
    [self configuremyCardBankCell:cell atIndexPath:indexPath];
    return  cell;
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.empty_typeV2 == succes_empty_numV2) {
        return nil;
    }else{
        [super imageForEmptyDataSet:scrollView];
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    if (self.empty_typeV2 == succes_empty_numV2) {
        NSString *text;
        NSDictionary *attributes;
        NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
        paragraph.lineBreakMode = NSLineBreakByWordWrapping;
        paragraph.alignment = NSTextAlignmentCenter;
        text = @"尚未绑定银行卡";
        attributes = @{NSFontAttributeName: PingFangSC_Regular(14),
                       NSForegroundColorAttributeName: ColorWithHex(0x779CF4, 1.0),
                       NSParagraphStyleAttributeName: paragraph};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }else{
        [super titleForEmptyDataSet:scrollView];
    }
    return nil;
}
@end
