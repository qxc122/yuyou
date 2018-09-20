//
//  myContactsPeoples.m
//  TourismT
//
//  Created by Store on 2017/1/13.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "myContactsPeoples.h"
#import "myContactsPeoplesCell.h"
#import "sectionHEADmyContacts.h"
#import "ChatViewController.h"
#import "ChatDemoHelper.h"
#import "myOrotherHome.h"
@interface myContactsPeoples ()
@property (nonatomic,strong) contactsAndgroups *contectPeo;


//@property (nonatomic,strong) membersGroupS *embersPeo;  //群组 成员

@end

@implementation myContactsPeoples
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.type = peo_myContactsPeoples_ENMU;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    if (self.type == peo_myContactsPeoples_ENMU) {
        self.title = @"联系人";
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        self.title = @"群成员";
    }

}
- (void)setUI{
    [self.basicTableView registerClass:[myContactsPeoplesCell class] forCellReuseIdentifier:NSStringFromClass([myContactsPeoplesCell class])];
    // Do any additional setup after loading the view.
    if (self.type == peo_myContactsPeoples_ENMU) {
        [self.header beginRefreshing];
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        if (self.embersPeo) {
            self.empty_typeV2 = succes_empty_numV2;
        }else{
            [self.header beginRefreshing];
        }
    }
}
- (void)loadNewData{
    kWeakSelf(self);
    if (self.type == peo_myContactsPeoples_ENMU) {
        [[ToolRequest sharedInstance]getTravelDetailWithNONEsuccess:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.contectPeo = [contactsAndgroups mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadsuccessSet:nil code:errorCode footerIsShow:NO totalPages:0];
        }];
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        [[ToolRequest sharedInstance] appuseremchatmembersWithidd:weakself.oneIdd NONEsuccess:^(id dataDict, NSString *msg, NSInteger code) {
            weakself.embersPeo = [membersGroupS mj_objectWithKeyValues:dataDict];
            [weakself loadNewDataEndHeadsuccessSet:nil code:code footerIsShow:NO totalPages:0];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [weakself loadNewDataEndHeadsuccessSet:nil code:errorCode footerIsShow:NO totalPages:0];
        }];
    }
}

#pragma --mark< UITableViewDelegate 高>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    kWeakSelf(self);
    return [tableView fd_heightForCellWithIdentifier:NSStringFromClass([myContactsPeoplesCell class]) configuration:^(myContactsPeoplesCell *cell) {
        [weakself configuremyContactsPeoplesCell:cell atIndexPath:indexPath];
    }];
    return 0.01;
}
#pragma --mark< 配置cell 的数据>
- (void)configuremyContactsPeoplesCell:(myContactsPeoplesCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    appS *decodedBag = [tourInfo sharedInstance].UserInfo;
    if (self.type == peo_myContactsPeoples_ENMU) {
        if (self.contectPeo.groupsA.count) {
            if (indexPath.section == 0) {
                cell.oneoe =  self.contectPeo.groupsA[indexPath.row];
            }else if (indexPath.section == 1){
                cell.oneoe =  self.contectPeo.contactsA[indexPath.row];
            }
        } else {
            cell.oneoe =  self.contectPeo.contactsA[indexPath.row];
        }
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        cell.MySelf = decodedBag.idd;
        cell.oneoe =  self.embersPeo.membersA[indexPath.row];
    }
    cell.index = indexPath.row;
    cell.YESorNOClick = ^(NSInteger index){
        NSInteger followId=0;
        if (weakself.type == peo_myContactsPeoples_ENMU) {
            UserS *one = weakself.contectPeo.contactsA[index];
            followId = one.idd;
        } else if (weakself.type == ALL_myContactsPeoples_ENMU){
            groupsForOneS *one = weakself.embersPeo.membersA[index];
            followId = one.idd;;
        }
        
        if (followId == decodedBag.idd) {
            [MBProgressHUD showPrompt:@"您不能关注自己～" toView:weakself.view];
            [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else {
            [MBProgressHUD showLoadingMessage:@"加载数据中..." toView:weakself.view];
            [[ToolRequest sharedInstance]followupdateWithtravelId:followId success:^(id dataDict, NSString *msg, NSInteger code) {
                [MBProgressHUD hideHUDForView:weakself.view];
                if (weakself.type == peo_myContactsPeoples_ENMU) {
                    UserS *one = weakself.contectPeo.contactsA[index];
                    one.isFollow = !one.isFollow;
                } else if (weakself.type == ALL_myContactsPeoples_ENMU){
                    groupsForOneS *one = weakself.embersPeo.membersA[index];
                    one.isFollow = !one.isFollow;
                }
                //            one.isFollow = !one.isFollow;
                [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
                
                //通知我的关注  和被关注 人数刷新
                NSNotification *notification =[NSNotification notificationWithName:myselfGuanNum object:nil userInfo:nil];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
                
            } failure:^(NSInteger errorCode, NSString *msg) {
                [MBProgressHUD hideHUDForView:weakself.view];
                [MBProgressHUD showPrompt:msg toView:weakself.view];
                
                [weakself.basicTableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            }];
        }
        
        
        /*
        [[ToolRequest sharedInstance]favoritedeleteWithids:idArry success:^(id dataDict, NSString *msg, NSInteger code) {
            [MBProgressHUD hideHUDForView:weakself.view];
            if (weakself.type == peo_myContactsPeoples_ENMU) {
                UserS *one = weakself.contectPeo.contactsA[index];
                one.isFollow = !one.isFollow;
            } else if (weakself.type == ALL_myContactsPeoples_ENMU){
                groupsForOneS *one = weakself.embersPeo.membersA[index];
                one.isFollow = !one.isFollow;
            }
//            one.isFollow = !one.isFollow;
            [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath  indexPathForRow:index inSection:section]] withRowAnimation:UITableViewRowAnimationNone];
            [MBProgressHUD showSuccess:msg toView:weakself.view];
        } failure:^(NSInteger errorCode, NSString *msg) {
            [MBProgressHUD hideHUDForView:weakself.view];
            [MBProgressHUD showPrompt:msg toView:weakself.view];
            
            [weakself.basicTableView reloadRowsAtIndexPaths:@[[NSIndexPath  indexPathForRow:index inSection:section]] withRowAnimation:UITableViewRowAnimationNone];
        }];
         */
    };
    cell.isChat = YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.type == peo_myContactsPeoples_ENMU) {
        if (self.empty_type == succes_empty_num) {
            return 50;
        }
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}

#pragma -mark<UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.type == peo_myContactsPeoples_ENMU) {
        if (self.contectPeo.groupsA.count) {
            if (section == 0) {
                return self.contectPeo.groupsA.count;
            }else if (section == 1){
                return self.contectPeo.contactsA.count;
            }
        } else {
            return self.contectPeo.contactsA.count;
        }
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        return self.embersPeo.membersA.count;
    }

    return 0.01;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.type == peo_myContactsPeoples_ENMU) {
        NSInteger tmp = 0;
        if (self.contectPeo.groupsA.count) {
            tmp++;
        }
        if (self.contectPeo.contactsA.count) {
            tmp++;
        }
        return tmp;
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        return 1;
    }
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.type == peo_myContactsPeoples_ENMU) {
        if (self.empty_type == succes_empty_num) {
            sectionHEADmyContacts *head = [[sectionHEADmyContacts alloc]init];
            if (section == 0) {
                if (self.contectPeo.groupsA.count) {
                    head.labelStr = @"同团群聊";
                } else {
                    head.labelStr = @"同团过的游友";
                }
            }else if (section == 1){
                head.labelStr = @"同团过的游友";
            }
            return head;
        }
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        
    }
    return nil;
}
#pragma --mark< 点击了  cell >
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.type == peo_myContactsPeoples_ENMU) {
        NSString *Chatter;
        EMConversationType type;
        ChatViewController *chatController;
        UserS *one;
        groupsS *Gone;
        if (indexPath.section == 0) {
            if (self.contectPeo.groupsA.count) {
                Gone = self.contectPeo.groupsA[indexPath.row];
                Chatter= Gone.idd;
                type = EMConversationTypeGroupChat;
            } else if (self.contectPeo.contactsA.count){
                one = self.contectPeo.contactsA[indexPath.row];
                Chatter= one.emChatId;
                type = EMConversationTypeChat;
            }
        } else if (indexPath.section == 1){
            one = self.contectPeo.contactsA[indexPath.row];
            Chatter= one.emChatId;
            type = EMConversationTypeChat;
        }

        //    [ChatDemoHelper shareHelper].chatVC = chatController;
        if (type == EMConversationTypeGroupChat) {
            
//            EMError *error = nil;
//            EMGroupOptions *setting = [[EMGroupOptions alloc] init];
//            setting.maxUsersCount = 500;
//            setting.style = EMGroupStylePublicOpenJoin;// 创建不同类型的群组，这里需要才传入不同的类型
//            EMGroup *group = [[EMClient sharedClient].groupManager createGroupWithSubject:@"群组名称" description:Gone.name invitees:@[@"",@""] message:@"旅游开始啦" setting:setting error:&error];
//            if(!error){
//                Chatter= group.groupId;
//                chatController = [[ChatViewController alloc]
//                                  initWithConversationChatter:Chatter conversationType:type];
//                NSLog(@"创建成功 -- %@",group);
//                [self.navigationController pushViewController:chatController animated:YES];
//            }else{
//                NSLog(@"创建失败 -- %@",group);
//            }
            
            chatController = [[ChatViewController alloc]
                              initWithConversationChatter:Chatter conversationType:type];
            chatController.title = Gone.name;
            chatController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:chatController animated:YES];
        } else if (type == EMConversationTypeChat) {
            chatController = [[ChatViewController alloc]
                              initWithConversationChatter:Chatter conversationType:type];
            chatController.UserOne = one;
            chatController.title = one.nickName?one.nickName:one.mobile;
            chatController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:chatController animated:YES];
        }
        
    } else if (self.type == ALL_myContactsPeoples_ENMU){
        groupsForOneS *oneForGroup =  self.embersPeo.membersA[indexPath.row];
        myOrotherHome *vc = [[myOrotherHome alloc]init];
        vc.idd = oneForGroup.idd;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}
#pragma --mark< 创建cell >
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    myContactsPeoplesCell *cell = [myContactsPeoplesCell returnCellWith:tableView];
    [self configuremyContactsPeoplesCell:cell atIndexPath:indexPath];
    return  cell;
}
//#pragma --mark< 编辑  cell >
//-(NSArray *)tableView:(UITableView* )tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewRowAction *deleteRoWAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"取消关注" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {//title可自已定义
//        kWeakSelf(self);
//        XAlertView *aleert = [[XAlertView alloc]initWithTitle:@"确定取消关注?" message:nil clickedBlock:^(XAlertView *alertView, BOOL canceled, NSInteger clickedIndex) {
//            if (!canceled) {
////                contentS *dataOne = weakself.data.contentA[indexPath.row];
////                [weakself delsetshouc:@[@(dataOne.idd)] :indexPath];
//            }
//        } cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [aleert show];
//    }];
//    
//    deleteRoWAction.backgroundColor = [UIColor redColor];//可以定义RowAction的颜色
//    return @[deleteRoWAction];//最后返回这俩个RowAction 的数组
//}
//#pragma --mark< 是否可以编辑 cell >
//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
//    return  YES;
//}
//#pragma --mark< 取消收藏 cell >
//- (void)delsetshouc:(NSArray *)arry :(NSIndexPath *)indexPath{
//    kWeakSelf(self);
//    [MBProgressHUD showLoadingMessage:@"取消收藏中..." toView:self.view];
//    [[ToolRequest sharedInstance]favoritedeleteWithids:arry success:^(id dataDict, NSString *msg, NSInteger code) {
//        [MBProgressHUD hideHUDForView:weakself.view];
//        [weakself.data.contentA removeObjectAtIndex:indexPath.row];
//        [weakself.basicTableView beginUpdates];
//        [weakself.basicTableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//        [weakself.basicTableView endUpdates];
//        [MBProgressHUD showSuccess:msg toView:weakself.view];
//    } failure:^(NSInteger errorCode, NSString *msg) {
//        [MBProgressHUD hideHUDForView:weakself.view];
//        [MBProgressHUD showPrompt:msg toView:weakself.view];
//    }];
//}

@end
