//
//  addTouer.m
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "addTouer.h"
#import "GJtouerCell.h"
#import "GNtouerCell.h"
#import "NSString+check.h"
#import "CusNavigationBar.h"
@interface addTouer ()<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIScrollViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;
@end

@implementation addTouer



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加常用旅客";
    self.fd_prefersNavigationBarHidden = YES;
//    [self customRightButton];
    // Do any additional setup after loading the view.
    UIImageView *backImageNOne = [[UIImageView alloc]init];
    [self.view addSubview:backImageNOne];
    backImageNOne.image = ImageNamed(IMAGE_bigALLBack);
    [backImageNOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    cusNavigationBar.RightendDaojishi = ^(){
        [weakself btnSaveClick];
    };
    cusNavigationBar.titleStr = @"添加常用旅客";
    cusNavigationBar.RightTitleStr = @"保存  ";
    self.cusNavigationBar = cusNavigationBar;
    cusNavigationBar.hidenBack = YES;
    [self.view addSubview:cusNavigationBar];
    [cusNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        if (ScreenHeight==812){
                   make.height.equalTo(@(HEIGHT_NavbarX));
        }else{
            
            make.height.equalTo(@(HEIGHT_Navbar));
        }
    }];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        if (ScreenHeight==812){
                   make.top.equalTo(self.view).offset(HEIGHT_NavbarX);
        }else{
            
            make.top.equalTo(self.view).offset(HEIGHT_Navbar);
        }
        make.bottom.equalTo(self.view).offset(0);
    }];
}

#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        self.cusNavigationBar.hidenBack = NO;
    }else{
        self.cusNavigationBar.hidenBack = YES;
    }
}


#pragma  UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == GJ_GJI_or_Gnei_ENMU) {
        return 315;
    } else  if (self.type == GN_GJI_or_Gnei_ENMU){
        return 165;
    }
    return 0;
}
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    if (self.type == GJ_GJI_or_Gnei_ENMU) {
        GJtouerCell *cell = [GJtouerCell returnCellWith:tableView];
        cell.idType = self.idType;
        self.peopleOne.idType = GUOJIHUzhao;
        cell.peopleOne = self.peopleOne;
        cell.FillIn = ^(travellerS *peopleOne){
            weakself.peopleOne = peopleOne;
        };
        cell.reload = ^(){
            [weakself changeType];
        };
        return  cell;
    } else  if (self.type == GN_GJI_or_Gnei_ENMU){
        GNtouerCell *cell = [GNtouerCell returnCellWith:tableView];
        cell.idType = self.idType;
        self.peopleOne.idType = SFZ;
        cell.peopleOne = self.peopleOne;
        cell.FillIn = ^(travellerS *peopleOne){
            weakself.peopleOne = peopleOne;
        };
        cell.reload = ^(){
            [weakself changeType];
        };
        return  cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cceell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cceell"];
        }
        return cell;
    }
    return nil;
}

- (void)changeType{
    UIActionSheet*sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"护照",@"身份证",nil];
    sheet.actionSheetStyle =  UIActionSheetStyleBlackOpaque;
    [sheet showInView:self.view];
}

#pragma --mark<UIActionSheetDelegate  sheet 协议>
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"buttonIndex=%ld",buttonIndex);
    if (buttonIndex == 0) {
        self.type = GJ_GJI_or_Gnei_ENMU;
    } else if (buttonIndex == 1){
        self.type = GN_GJI_or_Gnei_ENMU;
    }
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)customRightButton
//{
//    UIButton *btnSave = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
//    [btnSave addTarget:self action:@selector(btnSaveClick:) forControlEvents:UIControlEventTouchUpInside];
//    [btnSave setTitle:@"保存" forState:UIControlStateNormal];
//    btnSave.titleLabel.font = PingFangSC_Regular(17);
//    UIBarButtonItem* rightBarutton = [[UIBarButtonItem alloc]initWithCustomView:btnSave];
//    self.navigationItem.rightBarButtonItem = rightBarutton;
//}
//- (void)btnSaveClick:(UIButton *)btn{
- (void)btnSaveClick{
    NSLog(@"保存出行人");
//    if ([self.peopleOne.idType isEqualToString:SFZ] && ![NSString checkIdCardNumber:[NSString stringWithFormat:@"%@",self.peopleOne.idNumber]]) {
//        [MBProgressHUD showPrompt:@"请输入正确的证件号" toView:self.view];
//        return;
//    }
//    if (self.peopleOne.idNumber == 0) {
//        [MBProgressHUD showPrompt:@"请输入正确的证件号" toView:self.view];
//        return;
//    }
    
    if ([self.peopleOne.idType isEqualToString:GUOJIHUzhao]){
        if (self.peopleOne.firstname.length == 0) {
            [MBProgressHUD showPrompt:@"请输入正确的姓" toView:self.view];
            return;
        }
        if (self.peopleOne.lastname.length == 0) {
            [MBProgressHUD showPrompt:@"请输入正确的名" toView:self.view];
            return;
        }
        if (self.peopleOne.passportNumber.length == 0) {
            [MBProgressHUD showPrompt:@"请输入正确的护照号" toView:self.view];
            return;
        }
        if (![NSString checkIdCardNumber:[NSString stringWithFormat:@"%@",self.peopleOne.idNumber]]) {
            [MBProgressHUD showPrompt:@"请输入正确的身份证号" toView:self.view];
            return;
        }
        if (self.peopleOne.idPeriod.length == 0) {
            [MBProgressHUD showPrompt:@"请选择有效期" toView:self.view];
            return;
        }
//        if (self.peopleOne.birth.length == 0) {
//            [MBProgressHUD showPrompt:@"请选择出生日期" toView:self.view];
//            return;
//        }
//        if (self.peopleOne.gender.length == 0) {
//            [MBProgressHUD showPrompt:@"请选择性别" toView:self.view];
//            return;
//        }
    }else if ([self.peopleOne.idType isEqualToString:SFZ]) {
        if (self.peopleOne.realname.length == 0) {
            [MBProgressHUD showPrompt:@"请输入正确的姓名" toView:self.view];
            return;
        }
        if (![NSString checkIdCardNumber:[NSString stringWithFormat:@"%@",self.peopleOne.idNumber]]) {
            [MBProgressHUD showPrompt:@"请输入正确的身份证号" toView:self.view];
            return;
        }
    }


    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"保存中..."];
    if (self.isEdit) {
        [[ToolRequest sharedInstance]travellerupdateWitbirth:self.peopleOne.birth Firstname:self.peopleOne.firstname gender:self.peopleOne.gender idNumber:self.peopleOne.idNumber passportNumber:self.peopleOne.passportNumber idPeriod:self.peopleOne.idPeriod idType:self.peopleOne.idType lastname:self.peopleOne.lastname isDefault:self.peopleOne.isDefault realname:self.peopleOne.realname idd:self.peopleOne.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg];
            if (weakself.editORaddTouerClick) {
                weakself.editORaddTouerClick(weakself.isEdit ,weakself.peopleOne);
            }
            [weakself popSelf];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg toView:self.view];
        }];
    } else {
        [[ToolRequest sharedInstance]travelleraddWithbirth:self.peopleOne.birth Firstname:self.peopleOne.firstname gender:self.peopleOne.gender idNumber:self.peopleOne.idNumber  passportNumber:self.peopleOne.passportNumber idPeriod:self.peopleOne.idPeriod idType:self.peopleOne.idType lastname:self.peopleOne.lastname isDefault:self.peopleOne.isDefault realname:self.peopleOne.realname success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg];
            if (weakself.editORaddTouerClick) {
                weakself.editORaddTouerClick(weakself.isEdit ,weakself.peopleOne);
            }
            [weakself popSelf];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUD];
            [MBProgressHUD showPrompt:msg toView:self.view];
        }];
    }
}
- (travellerS *)peopleOne{
    if (!_peopleOne) {
        _peopleOne = [[travellerS alloc]init];
        _peopleOne.idType = GUOJIHUzhao;
    }
    return _peopleOne;
}
@end
