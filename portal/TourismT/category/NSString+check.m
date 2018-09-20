//
//  NSString+check.m
//  TourismT
//
//  Created by Store on 16/12/27.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "NSString+check.h"

@implementation NSString (check)
#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString*) telNumber
{
    NSString *pattern =@"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}
#pragma 正则匹配身份证
+ (BOOL)checkIdCardNumber:(NSString*) telNumber
{
    NSString *pattern = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X|x)$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:telNumber];
    return isMatch;
}

+ (NSString*)dictionaryToJson:(NSDictionary *)dic{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


#pragma mark - 计算内容文本的高度方法
+ (CGFloat)HeightForText:(NSString *)text withFont:(UIFont *)font withTextWidth:(CGFloat)textWidth
{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: font};
    // 设定最大宽高
    CGSize size = CGSizeMake(textWidth, CGFLOAT_MAX);
    // 计算文字Frame
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.height;
}

#pragma mark - 计算内容文本的宽度方法
+ (CGFloat)WidthForText:(NSString *)text withFont:(UIFont *)font{
    // 获取文字字典
    NSDictionary *dict = @{NSFontAttributeName: font};
    // 设定最大宽高
    CGSize size = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    // 计算文字Frame
    CGRect frame = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    return frame.size.width;
}

+ (NSInteger)returnMonth:(NSString *)str{
    NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int remainSecond =[[str stringByTrimmingCharactersInSet:nonDigits] intValue];
    NSLog(@" num %d ",remainSecond);
    
    NSString *Mon = [NSString stringWithFormat:@"%d",remainSecond];
    if (Mon.length >2) {
        return [[Mon substringWithRange:NSMakeRange(Mon.length-2, 2)] integerValue];
    } else {
        return remainSecond;
    }
    return 12;
}
+ (NSInteger)returnYear:(NSString *)str{
    NSCharacterSet* nonDigits =[[NSCharacterSet decimalDigitCharacterSet] invertedSet];
    int remainSecond =[[str stringByTrimmingCharactersInSet:nonDigits] intValue];
    NSLog(@" num %d ",remainSecond);
    
    NSString *Mon = [NSString stringWithFormat:@"%d",remainSecond];
    if (Mon.length >=4) {
        return [[Mon substringWithRange:NSMakeRange(0, 4)] integerValue];
    }
    return [NSDate date].year;
}

+ (NSInteger)howManyDaysInThisYear:(NSInteger)year withMonth:(NSInteger)month{
    if((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12))
        return 31 ;
    
    if((month == 4) || (month == 6) || (month == 9) || (month == 11))
        return 30;
    
    if((year % 4 == 1) || (year % 4 == 2) || (year % 4 == 3))
    {
        return 28;
    }
    
    if(year % 400 == 0)
        return 29;
    
    if(year % 100 == 0)
        return 28;
    
    return 29;
}

+ (NSMutableAttributedString *)creatStrWithText:(NSString *)text Font:(UIFont *)font Color:(UIColor *)color LineSpacing:(CGFloat )lineSpacing Alignment:(CGFloat )alignment BreakMode:(NSLineBreakMode)breakMode  firstLineHeadIndent:(CGFloat )firstLineHeadIndent  headIndent:(CGFloat )headIndent  paragraphSpacing:(CGFloat )paragraphSpacing WordSpace:(CGFloat)WordSpace{
    if (text && text.length) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpacing];//调整行间距
        [paragraphStyle setAlignment:alignment];
        [paragraphStyle setLineBreakMode:breakMode];
        
        
        NSDictionary *dic = @{NSFontAttributeName: font,
                       NSForegroundColorAttributeName: color,
                       NSParagraphStyleAttributeName: paragraphStyle,
                              NSKernAttributeName:@(WordSpace)};
        return [[NSMutableAttributedString alloc] initWithString:text attributes:dic];
    }
    return [[NSMutableAttributedString alloc] initWithString:@""];
}

@end
