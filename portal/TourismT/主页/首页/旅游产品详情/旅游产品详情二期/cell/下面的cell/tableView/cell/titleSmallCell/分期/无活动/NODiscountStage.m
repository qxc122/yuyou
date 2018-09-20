//
//  NODiscountStage.m
//  TourismT
//
//  Created by Store on 2017/8/7.
//  Copyright © 2017年 qxc122@126.com. All rights reserved.
//

#import "NODiscountStage.h"


@interface NODiscountStage ()




@property (nonatomic,weak) UIImageView *stagesImage;
@property (nonatomic,weak) UILabel *stagesTitle;
@property (nonatomic,weak) UILabel *stagesContent;
@property (nonatomic,weak) UILabel *stagesMore;
@property (nonatomic,weak) UIImageView *stagesMoreImage;

@end

@implementation NODiscountStage
+ (instancetype)returnCellWith:(UITableView *)tableView
{
    NODiscountStage *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (cell == nil) {
        cell = [[NODiscountStage alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([self class])];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *stages = [UIView new];
        [self.contentView addSubview:stages];
        
        UIImageView *stagesImage = [UIImageView new];
        [self.contentView addSubview:stagesImage];
        
        UILabel *stagesTitle = [UILabel new];
        [self.contentView addSubview:stagesTitle];
        
        UILabel *stagesContent = [UILabel new];
        [self.contentView addSubview:stagesContent];
        
        UILabel *stagesMore = [UILabel new];
        [self.contentView addSubview:stagesMore];
        
        UIImageView *stagesMoreImage = [UIImageView new];
        [self.contentView addSubview:stagesMoreImage];

        UIButton *stagesBtn= [UIButton new];
        [self.contentView addSubview:stagesBtn];
        
        [stages mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(self.price.mas_bottom).offset(14);
            make.height.equalTo(@40);
        }];
        [stagesImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.price);
            make.centerY.equalTo(stages);
            make.width.equalTo(@18);
            make.height.equalTo(@18);
        }];
        [stagesTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesImage.mas_right).offset(6);
            make.centerY.equalTo(stages);
            make.width.equalTo(@50);
        }];
        [stagesContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesTitle.mas_right).offset(20);
            make.right.equalTo(stagesMore.mas_left).offset(-10);
            make.centerY.equalTo(stages);
        }];
        
        [stagesMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(stagesMoreImage.mas_left).offset(-9);
            make.centerY.equalTo(stages);
        }];
        [stagesMoreImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-15);
            make.centerY.equalTo(stages);
            make.width.equalTo(@6);
            make.height.equalTo(@12);
        }];
        [stagesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(stagesMore);
            make.right.equalTo(stagesMoreImage);
            make.centerY.equalTo(stagesMoreImage);
            make.height.equalTo(@40);
        }];
        
        [self.lineBottom mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
            make.top.equalTo(stages.mas_bottom);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@10);
        }];

        self.stages = stages;
        self.stagesImage = stagesImage;
        self.stagesTitle = stagesTitle;
        self.stagesContent = stagesContent;
        self.stagesMore = stagesMore;
        self.stagesMoreImage = stagesMoreImage;
        [stagesBtn addTarget:self action:@selector(stagesBtnClick) forControlEvents:UIControlEventTouchUpInside];
        //        [stagesTitle setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        //        [stagesMore setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        //        [stagesContent setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        //set

        
        //        price.font = PingFangSC_Regular(14);
        //        price.textColor = ColorWithHex(0x000000, 0.87);
        stagesTitle.font = PingFangSC_Regular(12);
        stagesTitle.textColor = ColorWithHex(0xFB704B, 1.0);
        stagesContent.font = PingFangSC_Regular(12);
        stagesContent.textColor = ColorWithHex(0x000000, 0.54);
        
        stagesMore.font = PingFangSC_Regular(12);
        stagesMore.textColor = ColorWithHex(0x000000, 0.54);
        

        stages.backgroundColor = ColorWithHex(0xFFF2EF, 1.0);
        self.stagesImage.image = ImageNamed(@"分期付款");
        self.stagesMoreImage.image = ImageNamed(@"向右灰色");
        
        self.stagesTitle.text = @"免息分期";
        //test
        //        self.title.text = @"123";
        //        self.startPlace.text = @"123";
        //        self.time.text = @"123";
        //        self.endPlace.text = @"123";
        //        self.price.text = @"123";
        //        self.stagesContent.text = @"123";
        //        self.stagesMore.text = @"123";
        
    }
    return self;
}
- (void)stagesBtnClick{
    if (self.lookWebUrl) {
        self.lookWebUrl(self.data.periodTypesUrl);
    }
}
- (void)setData:(tourDetaisData *)data{
    [super setData:data];
    self.stagesContent.text = data.minPriceStr;
    self.stagesMore.text = data.periodTypeNum;
    
    if ([data.travel.price hasSuffix:@"起"]) {
        NSString *all = data.travel.price;
        NSRange range2 = [all rangeOfString:@"起"];
        NSRange range1 = NSMakeRange(0, all.length-range2.length);
        
        NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:all];
        NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Medium(20),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic1 range:range1];
        
        NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:PingFangSC_Regular(12),NSFontAttributeName,ColorWithHex(0xFB704B, 1.0),NSForegroundColorAttributeName, nil];
        [attri setAttributes:dic2 range:range2];
        self.price.attributedText = attri;
    }
}

@end
