//
//  popularTouer.m
//  TourismT
//
//  Created by Store on 16/12/16.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "popularTouer.h"
#import "touerCell.h"
#import "addTouer.h"
#import "CusNavigationBar.h"
@interface popularTouer ()
@property (nonatomic,strong) travellersS *data;

@property (nonatomic,weak) UIImageView *backImageNOne;
//@property (nonatomic,weak) UILabel *labelNone;
@property (nonatomic,weak) UIButton *okbtn;


@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;
@end

@implementation popularTouer

- (void)viewDidLoad {
    [super viewDidLoad];
    self.NodataDescribe = @"亲，还没有常用旅客哦\n速去添加";

    self.title = @"常用旅客";
//    [self customRightButton];
    self.basicTableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0);
    self.basicTableView.backgroundColor = [UIColor clearColor];
    self.fd_prefersNavigationBarHidden = YES;
    // Do any additional setup after loading the view.
    UIImageView *backImageNOne = [[UIImageView alloc]init];
    [self.view addSubview:backImageNOne];
    [self.view sendSubviewToBack:backImageNOne];
    backImageNOne.image = ImageNamed(IMAGE_bigALLBack);
    [backImageNOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    [self.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        if (ScreenHeight==812){
            make.top.equalTo(self.view).offset(HEIGHT_NavbarX);
        }else{
            
            make.top.equalTo(self.view).offset(HEIGHT_Navbar);
        }
        make.bottom.equalTo(self.view);
    }];

    kWeakSelf(self);
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    cusNavigationBar.RightendDaojishi = ^(){
        addTouer *vc = [[addTouer alloc]init];
        vc.idType = weakself.idType;
        if ([weakself.idType isEqualToString:travel_type_domestic]) {
            vc.type = GN_GJI_or_Gnei_ENMU;
        } else {
            vc.type = GJ_GJI_or_Gnei_ENMU;
        }
        vc.isEdit = NO;
//        vc.type = GJ_GJI_or_Gnei_ENMU;
        vc.editORaddTouerClick = ^(BOOL isEdit,travellerS *peopleOne){
            [weakself editORaddTouerClickDoSomething:isEdit :peopleOne];
        };
        [weakself.navigationController pushViewController:vc animated:YES];
    };

    cusNavigationBar.RightStr = @"添加CYLK";
    cusNavigationBar.titleStr = @"常用旅客";
    self.cusNavigationBar = cusNavigationBar;
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
    

    [self.basicTableView registerClass:[touerCell class] forCellReuseIdentifier:NSStringFromClass([touerCell class])];
    [self.basicTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(cusNavigationBar.mas_bottom);
        make.bottom.equalTo(self.view).offset(0);
    }];
    if (!self.isDebtn) {
        
        UIButton *okbtn = [[UIButton alloc]init];
        self.okbtn = okbtn;
        self.okbtn.hidden = YES;
        [okbtn setTitle:@"确定" forState:UIControlStateNormal];
        [okbtn setTitleColor:ColorWithHex(0xFFFFFF, 1.0) forState:UIControlStateNormal];
        okbtn.titleLabel.font = PingFangSC_Regular(17);
        [okbtn setBackgroundColor:ColorWithHex(0xFB704B, 1.0)];
        [okbtn addTarget:self action:@selector(okbtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:okbtn];
        [okbtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view);
            make.height.equalTo(@(50));
            make.right.equalTo(self.view);
            make.top.equalTo(self.basicTableView.mas_bottom).offset(0);
        }];
    }
    [self.header beginRefreshing];

}
- (void)loadNewData{
    NSString *idType;
    if ([self.idType isEqualToString:travel_type_abroad]) {
        idType = GUOJIHUzhao;
    } else if ([self.idType isEqualToString:travel_type_domestic]){
        idType = SFZ;
    }
    kWeakSelf(self);
    [[ToolRequest sharedInstance]travellerlistWithPageNumber:0 PageSize:0  idType:idType success:^(id dataDict, NSString *msg, NSInteger code) {
        weakself.data = [travellersS mj_objectWithKeyValues:dataDict];
        weakself.cusNavigationBar.hidenBack = YES;
        if (![weakself.data.travellersA count]) {
//            weakself.labelNone.hidden = NO;
            weakself.okbtn.enabled = NO;
        }
        [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
    } failure:^(NSInteger errorCode, NSString *msg) {
        [weakself loadNewDataEndHeadfailureSet:nil errorCode:errorCode];
    }];
}

#pragma  UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self)
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([touerCell class]) configuration:^(touerCell *cell) {
        [weakself configuretouerCell:cell atIndexPath:indexPath];
    }];
}
#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data.travellersA count];
}
#pragma --mark<配置  收藏 cell >
- (void)configuretouerCell:(touerCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    travellerS *peo = self.data.travellersA[indexPath.row];
    cell.touerGOTOClick = ^(NSInteger index,BOOL idMyGo,travellerS *peopleOne){
        if (idMyGo) {
            [weakself.travellers addObject:peopleOne];
        }else{
            if ([weakself.travellers count] == 1) {
                NSIndexPath *pathOne = [NSIndexPath indexPathForRow:index inSection:0];
                [weakself.basicTableView reloadRowsAtIndexPaths:@[pathOne] withRowAnimation:UITableViewRowAnimationNone];
                [MBProgressHUD showPrompt:@"至少保留一个" toView:weakself.view];
            }else{
                NSInteger tmp= 0;
                for (travellerS *peoT in weakself.travellers) {
                    if (peoT.idd == peopleOne.idd) {
                        [weakself.travellers removeObjectAtIndex:tmp];
                        break;
                    }
                    tmp++;
                }
            }
        }
        if (weakself.travellers.count) {
            [weakself.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(weakself.view);
                make.right.equalTo(weakself.view);
                make.top.equalTo(weakself.cusNavigationBar.mas_bottom);
                make.bottom.equalTo(weakself.view).offset(-50);
            }];
            weakself.okbtn.hidden = NO;
        } else {
            [weakself.basicTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(weakself.view);
                make.right.equalTo(weakself.view);
                make.top.equalTo(weakself.cusNavigationBar.mas_bottom);
                make.bottom.equalTo(weakself.view).offset(0);
            }];
            weakself.okbtn.hidden = YES;
        }
    };
    cell.editTouerClick = ^(NSInteger index,travellerS *peopleOne){
        addTouer *vc = [[addTouer alloc]init];
        vc.idType = weakself.idType;
        if ([peo.idType isEqualToString:SFZ]) {
            vc.type = GN_GJI_or_Gnei_ENMU;
        } else if ([peo.idType isEqualToString:GUOJIHUzhao]){
            vc.type = GJ_GJI_or_Gnei_ENMU;
        }
        vc.peopleOne = peopleOne;
        vc.isEdit = YES;
        vc.editORaddTouerClick = ^(BOOL isEdit,travellerS *peopleOne){
            [weakself editORaddTouerClickDoSomething:isEdit :peopleOne];
        };
        [weakself.navigationController pushViewController:vc animated:YES];
    };
    cell.deleteTouerClick = ^(NSInteger index,travellerS *peopleOne){
        [MBProgressHUD showLoadingMessage:@"操作中..." toView:weakself.view];
        [[ToolRequest sharedInstance]travellerdeleteWithID:peopleOne.idd success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            
            [weakself.data.travellersA removeObjectAtIndex:indexPath.row];
            [weakself.basicTableView beginUpdates];
            NSIndexPath *tmpPath = [NSIndexPath indexPathForRow:index inSection:0];
            [weakself.basicTableView deleteRowsAtIndexPaths:@[tmpPath] withRowAnimation:UITableViewRowAnimationLeft];
            [weakself.basicTableView endUpdates];
            [weakself.basicTableView reloadData];
            if (![weakself.data.travellersA count]) {
//                weakself.labelNone.hidden = NO;
                weakself.okbtn.enabled = NO;
            }
            if (weakself.deletTravellers) {  //父控制器 同步该出游人信息
                weakself.deletTravellers(peopleOne);
            }
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
        }];
    };
    
    cell.idMyGo = NO;
    for (travellerS *peoT in self.travellers) {
        if (peoT.idd == peo.idd) {
            cell.idMyGo = YES;
            break;
        }
    }
    cell.peopleOne = peo;
    cell.index = indexPath.row;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    touerCell *cell = [touerCell returnCellWith:tableView];
    [self configuretouerCell:cell atIndexPath:indexPath];
    return  cell;
}
- (void)doSomeThing:(NSInteger)index{
    NSLog(@"index=%ld",index);
}

//- (UILabel *)labelNone{
//    if (!_labelNone) {
//        UILabel *labelNoneT = [[UILabel alloc]init];
//        _labelNone = labelNoneT;
//        [self.view addSubview:labelNoneT];
//        labelNoneT.text = @"亲，还没有常用旅客哦\n速去添加";
//        labelNoneT.numberOfLines = 0;
//        labelNoneT.font = PingFangSC_Medium(14);
//        labelNoneT.textColor = ColorWithHex(0xFFFFFF,0.5);
//        labelNoneT.textAlignment = NSTextAlignmentCenter;
//        [labelNoneT mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.view);
//            make.right.equalTo(self.view);
//            make.top.equalTo(self.view).offset(130*HEIGHTICON);
//        }];
//    }
//    return _labelNone;
//}





#pragma <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        self.cusNavigationBar.hidenBack = NO;
    }else{
        self.cusNavigationBar.hidenBack = YES;
    }
}

//- (void)customRightButton
//{
//    UIImage* image = [[UIImage imageNamed:@"添加CYLK"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIBarButtonItem* rightBarutton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(addTouer)];
//    self.navigationItem.rightBarButtonItem = rightBarutton;
//}
//- (void)addTouer{
//    kWeakSelf(self);
//
//}
#pragma -mark<添加或者编辑出行人返回做的事>
- (void)editORaddTouerClickDoSomething:(BOOL )isEdit :(travellerS *)peopleOne{
    kWeakSelf(self);
    if (isEdit) {
        if (self.eidtTravellers) {  //父控制器 同步该出游人信息
            self.eidtTravellers(peopleOne);
        }
        
        NSInteger tmp = 0;
        for (travellerS *peo in self.data.travellersA) {//待优化
            if (peo.idd == peopleOne.idd) {
                [self.data.travellersA replaceObjectAtIndex:tmp withObject:peopleOne];
                break;
            }
            tmp++;
        }
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:tmp inSection:0];
        [weakself.basicTableView beginUpdates];
        [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
        [weakself.basicTableView endUpdates];
        [weakself.basicTableView reloadData];
        if (peopleOne.isDefault) {
            weakself.basicTableView.mj_header.hidden = NO;
            [weakself.basicTableView.mj_header beginRefreshing];
        }
    }else{
        if (![weakself.data.travellersA count]) {
//            weakself.labelNone.hidden = YES;
            weakself.okbtn.enabled = YES;
        }
        [self.data.travellersA insertObject:peopleOne atIndex:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [weakself.basicTableView beginUpdates];
        [weakself.basicTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        [weakself.basicTableView endUpdates];
        [weakself.basicTableView reloadData];
        weakself.basicTableView.mj_header.hidden = NO;
        [weakself.basicTableView.mj_header beginRefreshing];
    }
}
- (void)okbtnClick:(UIButton *)btn{
//    [self popSelf];
    NSMutableArray *muarry = [NSMutableArray array];
    if (self.SelectedTravellers) {
        for (travellerS *peo in self.data.travellersA) {
            for (travellerS *peoTwo in self.travellers) {
                if (peo.idd == peoTwo.idd) {
                    [muarry addObject:peo];
                }
            }
        }
        self.SelectedTravellers(muarry);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma --mark<空白页处理>
#pragma --<空白页处理>
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    UIImage *tmp = [super imageForEmptyDataSet:scrollView];
    if (self.empty_typeV2 == succes_empty_numV2){
        return nil;
    }
    return tmp;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSAttributedString *tmp = [super titleForEmptyDataSet:scrollView];
    if (self.empty_typeV2 == succes_empty_numV2){
        NSString *text = self.NodataDescribe;
        NSDictionary *attributes = @{NSFontAttributeName:PingFangSC_Medium(14),
                                     NSForegroundColorAttributeName:ColorWithHex(0xFFFFFF,0.5)};
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return tmp;
}
@end
