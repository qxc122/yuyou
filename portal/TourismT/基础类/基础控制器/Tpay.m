//
//  Tpay.m
//  TourismT
//
//  Created by Store on 2017/2/23.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "Tpay.h"
#import "NSDictionary+toData.h"



@implementation Tpay
- (void)tPayMethodmoney:(NSString *)money businessName:(NSString *)businessName businessID:(NSString *)businessID state:(NSString *)state tState:(NSString *)tState{
    NSString *TUlr = @"testwalletTbi://";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:TUlr]]){
        
//        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//        NSNumber *numAmt = datajsonData[@"tranAmt"];
//        NSString *supportTcoinstr = @"";
//        if (datajsonData[@"supportTcoin"]) {
//            supportTcoinstr = datajsonData[@"supportTcoin"];
//        }
//        NSDictionary *data = @{
//                               @"businessID":datajsonData[@"prepayId"],
//                               @"businessName":datajsonData[@"orderDesc"],
//                               @"money":[NSString stringWithFormat:@"%@",numAmt],
//                               @"supportTcoin":supportTcoinstr,
//                               };
//        
//        [pasteboard setData:[NSDictionary returnDataWithDictionary:data] forPasteboardType:@"data"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:TUlr]];
    }else{
        if (![NSThread isMainThread]) {
            dispatch_sync(dispatch_get_main_queue(), ^(){
                if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwallet://"]]){
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您当前的T钱包版本不支持该操作" message:@"去升级" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                    alert.tag = 1011;
                    [alert show];
                }else{
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您还没有安装T钱包客户端哦" message:@"去安装" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                    alert.tag = 1011;
                    [alert show];
                }
            });
        }else{
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"testwallet://"]]){
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您当前的T钱包版本不支持该操作" message:@"去升级" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                alert.tag = 1011;
                [alert show];
            }else{
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"您还没有安装T钱包客户端哦" message:@"去安装" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                alert.tag = 1011;
                [alert show];
            }
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1011) {
        if (buttonIndex == 1) {
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/cn/app/t-qian-bao/id1061514008?mt=8"];
            if ([[UIApplication sharedApplication] canOpenURL:url]){
                [[UIApplication sharedApplication] openURL:url];
            }
        }
    }
}
@end
