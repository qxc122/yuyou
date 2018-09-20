//
//  My stage myStageVc.m
//  TourismT
//
//  Created by Store on 2017/4/25.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myStageVc.h"
#import "CusNavigationBar.h"
#import "myStageThisMonth.h"
#import "myStageVcAll.h"
#import "WJItemsControlView.h"
#import "myStageVcHead.h"
#import "RecordVc.h"
#import "failLoad.h"

#define HEIGHT_Head  225.f
#define HEIGHT_SlidingHead  52.f


@interface myStageVc ()<UIScrollViewDelegate>
{
    WJItemsControlView *_itemControlView;
}
@property (nonatomic,strong) myStageThisMonth *myStageThisMonthVc;
@property (nonatomic,strong) myStageVcAll *myStageVcAllVc;
@property (nonatomic,weak) UIScrollView *scroll;
@property (nonatomic,weak) CusNavigationBar *cusNavigationBar;
@property (nonatomic,weak) myStageVcHead *head;

@property (nonatomic,strong) myStageHome *date;
@property (nonatomic,weak) failLoad *failload;
@end

@implementation myStageVc

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self setUIFirst];
    [self setUI];
    [self loadDate];
    
    failLoad *failload = [[failLoad alloc]init];
    kWeakSelf(self);
    failload.reLoadBtn = ^(){
        [weakself loadDate];
    };
    self.failload = failload;
    failload.hidden = YES;
    failload.desStr  =@"亲，加载失败了";
    failload.reloadStr  =@"点击重新加载";
    failload.imageStr  =load_fail_image;
    [self.view  addSubview:failload];
    [failload mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
    
    
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wechatPayStateCan:) name:wechatPayState object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loadDate)
                                                 name:Repaymentsuccess
                                               object:nil];
}

#pragma  -mark<微信支付>
- (void)wechatPayStateCan:(NSNotification *)user{
    NSDictionary *dic = user.userInfo;
    NSString *code = dic[wechatPayState];
    if ([code intValue] == WXSuccess) {
        [self loadDate];
//        if (self.huanSucces) {
//            self.huanSucces();
//        }
    }
}

- (void)setUIFirst{
    self.fd_prefersNavigationBarHidden = YES;
    
    UIView *view = [[UIView alloc]init];
    [self.view addSubview:view];
    kWeakSelf(self);

    myStageVcHead *head = [[myStageVcHead alloc]init];
    self.head = head;
    self.head.hidden = YES;
    [self.view addSubview:head];
    
    CusNavigationBar *cusNavigationBar =[[CusNavigationBar alloc]init];
    cusNavigationBar.endDaojishi = ^(){
        [weakself popSelf];
    };
    [cusNavigationBar.right addTarget:self action:@selector(jiluClick) forControlEvents:UIControlEventTouchUpInside];

    cusNavigationBar.titleStr = @"我的分期";
    self.cusNavigationBar = cusNavigationBar;
    [self.view addSubview:cusNavigationBar];
    
    
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.equalTo(@(HEIGHT_Head));
    }];
    
    [cusNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.left.equalTo(self.view);
        make.top.equalTo(self.view);
        NSLog(@"%f",ScreenWidth);
        NSLog(@"%f",ScreenWidth);
        NSLog(@"%f",ScreenHeight);
        NSLog(@"%f",ScreenHeight);
        if (ScreenHeight==812){
            make.height.equalTo(@(HEIGHT_NavbarX));
        }else{

            make.height.equalTo(@(HEIGHT_Navbar));
        }
    }];

//    2、获得scale：
    
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    

//    3、获取分辨率
    
//    CGFloat width = ScreenWidth*scale_screen;
//    
//    CGFloat height = ScreenHeight*scale_screen;
//    NSLog(@"sdf");
}

- (void)loadDate{
    kWeakSelf(self);
    [MBProgressHUD showLoadingMessage:@"加载中..." toView:self.view];
    
    [[ToolRequest sharedInstance]appuserperiodperiod_listsuccess:^(id dataDict, NSString *msg, NSInteger code) {
        NSLog(@"df");
//        dataDict = nil;
        weakself.failload.hidden = YES;
        weakself.empty_type = succes_empty_num;
        weakself.date = [myStageHome mj_objectWithKeyValues:dataDict];
//        weakself.date = nil; //TODO
        weakself.cusNavigationBar.hidenBack = YES;
        weakself.head.hidden = NO;
        weakself.head.date = weakself.date;
        [MBProgressHUD hideHUDForView:weakself.view];
        
        _myStageThisMonthVc.empty_type = weakself.empty_type;
        _myStageVcAllVc.empty_type = weakself.empty_type;
        _myStageThisMonthVc.date = weakself.date;
        _myStageVcAllVc.date = weakself.date;
        
        _itemControlView.hidden = NO;
        weakself.scroll.hidden = NO;
    } failure:^(NSInteger errorCode, NSString *msg) {
        NSLog(@"df");
        weakself.failload.hidden = NO;
        weakself.empty_type = fail_empty_num;
        [MBProgressHUD hideHUDForView:weakself.view];
        [MBProgressHUD showPrompt:msg toView:weakself.view];
    }];
}


- (void)setUI{
    NSArray *array = @[@"本月分期",@"全部分期"];
    //4页内容的scrollView
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HEIGHT_SlidingHead+HEIGHT_Head, ScreenWidth, ScreenHeight-HEIGHT_SlidingHead-HEIGHT_Head)];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    self.scroll = scroll;
    _itemControlView.hidden = YES;
    self.scroll.hidden = YES;
    scroll.contentSize = CGSizeMake(ScreenWidth*2, 0);
    scroll.showsHorizontalScrollIndicator = NO;
    for (int i=0; i<array.count; i++) {
        basicVc *vc;
        if (i==0) {
            vc = [[myStageThisMonth alloc]init];
            _myStageThisMonthVc = (myStageThisMonth *)vc;
        } else if (i==1){
            vc = [[myStageVcAll alloc]init];
            _myStageVcAllVc = (myStageVcAll *)vc;
        }
        [self addChildViewController:vc];
        vc.view.frame = CGRectMake(ScreenWidth*i, 0, ScreenWidth,ScreenHeight-HEIGHT_SlidingHead-HEIGHT_Head);
        [scroll addSubview:vc.view];
    }
    [self.view addSubview:scroll];
    
    
    //头部控制的segMent
    WJItemsConfig *config = [[WJItemsConfig alloc]init];
    config.itemWidth = ScreenWidth/2.0;
    config.itemFont = PingFangSC_Regular(14);
    config.selectedColor = ColorWithHex(0x779CF4, 1.0);
    config.textColor = ColorWithHex(0x000000, 0.86);
    
    _itemControlView = [[WJItemsControlView alloc]initWithFrame:CGRectMake(0, HEIGHT_Head, ScreenWidth, HEIGHT_SlidingHead)];
    _itemControlView.tapAnimation = YES;
    _itemControlView.config = config;
    _itemControlView.titleArray = array;
    _itemControlView.hidden = YES;
    kWeakSelf(self);
    [_itemControlView setTapItemWithIndex:^(NSInteger index,BOOL animation){
        NSLog(@"index=%ld",index);
        [weakself.scroll setContentOffset:CGPointMake(index*ScreenWidth, 0) animated:YES];
    }];
    [self.view addSubview:_itemControlView];
}
#pragma --mark<打开我的还款记录>
- (void)jiluClick{
    RecordVc *vc = [RecordVc new];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView moveToIndex:offset];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    float offset = scrollView.contentOffset.x;
    offset = offset/CGRectGetWidth(scrollView.frame);
    [_itemControlView endMoveToIndex:offset];
    
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
