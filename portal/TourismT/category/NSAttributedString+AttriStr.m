//
//  NSAttributedString+AttriStr.m
//  TourismT
//
//  Created by Store on 16/12/6.
//  Copyright © 2016年 qxc122@126.com. All rights reserved.
//

#import "NSAttributedString+AttriStr.h"

@implementation NSAttributedString (AttriStr)
+ (NSAttributedString *)getNSAttributedStringWithLetterspacing:(CGFloat)etterspacing andStr:(NSString *)inputStr{
    NSDictionary *dic = @{NSKernAttributeName:@(etterspacing)};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:inputStr attributes:dic];
    return attributeStr;
}
@end
