//
//  NSString+check.h
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (check)
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString*) telNumber;
#pragma 正则匹配身份证
+ (BOOL)checkIdCardNumber:(NSString*) telNumber;
#pragma --mark<正则匹配身份证>
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
#pragma mark - 计算内容文本的高度方法
+ (CGFloat)HeightForText:(NSString *)text withFont:(UIFont *)font withTextWidth:(CGFloat)textWidth;
#pragma mark - 计算内容文本的宽度方法
+ (CGFloat)WidthForText:(NSString *)text withFont:(UIFont *)font;
#pragma mark - 返回月
+ (NSInteger)returnMonth:(NSString *)str;
#pragma mark - 返回年
+ (NSInteger)returnYear:(NSString *)str;
#pragma mark - 返回一个月有多少天
+ (NSInteger)howManyDaysInThisYear:(NSInteger)year withMonth:(NSInteger)month;
#pragma --mark<返回一个富文本可变字符串  字体  颜色 行间距 换行模式>
+ (NSMutableAttributedString *)creatStrWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color LineSpacing:(CGFloat )lineSpacing Alignment:(CGFloat )alignment BreakMode:(NSLineBreakMode)breakMode  firstLineHeadIndent:(CGFloat )firstLineHeadIndent  headIndent:(CGFloat )headIndent  paragraphSpacing:(CGFloat )paragraphSpacing WordSpace:(CGFloat)WordSpace;
@end
