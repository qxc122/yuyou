//
//  HaveArry.m
//  TourismT
//
//  Created by Store on 2017/8/9.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "HaveArry.h"
#import "YYLabel.h"
#import "YYText.h"
#import "NSAttributedString+YYText.h"
#import "NSString+check.h"

@interface HaveArry ()
@property (nonatomic,weak) YYLabel *titleArry;
@end

@implementation HaveArry
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    HaveArry *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[HaveArry alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        YYLabel *titleArry = [[YYLabel alloc]init];
        [self.contentView addSubview:titleArry];

        [self.content mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.right.equalTo(self.more);
            make.top.equalTo(self.line.mas_bottom).offset(15);
        }];
        
        [titleArry mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.content);
            make.right.equalTo(self.content);
            make.top.equalTo(self.content.mas_bottom).offset(15);
            make.bottom.equalTo(self.contentView).offset(-30);
        }];
        self.titleArry = titleArry;
        titleArry.numberOfLines = 0;
    }
    return self;
}
- (void)setOneDate:(banyouNoticationForOneS *)oneDate{
    [super setOneDate:oneDate];
    
    UIColor *tmp;
    if (oneDate.isRead) {
        tmp = ColorWithHex(0x000000, 0.4);
    } else {
        tmp = ColorWithHex(0x000000, 0.87);
    }
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,ColorWithHex(0x000000, 0.4),NSForegroundColorAttributeName, nil];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(14),NSFontAttributeName,tmp,NSForegroundColorAttributeName, nil];
    
    NSMutableAttributedString *All = [NSMutableAttributedString new];
    for (dataMapsOne *one in oneDate.Arry_dataMaps) {
        NSMutableAttributedString *text = [NSMutableAttributedString new];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:one.name attributes:dic]];
        CGFloat width = [NSString WidthForText:one.name withFont:PingFangSC_Regular(14)];
        UIView *place = [[UIView alloc]initWithFrame:CGRectMake(0, 0, spaceing_width-width, 10)];
        
        NSMutableAttributedString *attachText3 = [NSMutableAttributedString yy_attachmentStringWithContent:place contentMode:UIViewContentModeCenter attachmentSize:place.frame.size alignToFont:PingFangSC_Regular(14) alignment:YYTextVerticalAlignmentTop];
        [text appendAttributedString:attachText3];
        

        [text appendAttributedString:[[NSAttributedString alloc] initWithString:one.value attributes:dic2]];
        if (![one isEqual:[oneDate.Arry_dataMaps lastObject]]) {
            [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:dic2]];
        }
        text.yy_headIndent = spaceing_width;
        text.yy_paragraphSpacing = 12;
        [All appendAttributedString:text];
    }
    self.titleArry.attributedText = All;
}
@end
