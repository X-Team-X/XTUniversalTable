//
//  ResumeBaseInfoCell.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ResumeBaseInfoCell.h"
#import "NSAttributedString+XTConvenience.h"
#import "UIColor+XTConvenience.h"
#import "ResumeBaseInfoCellViewModel.h"

@interface ResumeBaseInfoCell ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ResumeBaseInfoCell

+ (void)registerToTableView:(UITableView *)tableView {
    
}

+ (CGSize)sizeWithData:(id<XTUTRow>)data constrainedToSize:(CGSize)size {
    if ([data isKindOfClass:[ResumeBaseInfoCellViewModel class]]) {
        ResumeBaseInfoCellViewModel *baseInfo = data;
        NSAttributedString *attrText = [self attrBaseInfo:baseInfo];
        CGSize attrTextSize = [attrText boundingRectWithSize:CGSizeMake(size.width - 20.0f, size.height)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                     context:nil].size;
        return CGSizeMake(size.width, ceilf(attrTextSize.height) + 40.0f);
    }
    return CGSizeZero;
}

+ (NSString *)identifier {
    return @"ResumeBaseInfoCell";
}

- (void)configureWithData:(id<XTUTRow>)data {
    if ([data isKindOfClass:[ResumeBaseInfoCellViewModel class]]) {
        ResumeBaseInfoCellViewModel *baseInfo = data;
        self.textView.attributedText = [[self class] attrBaseInfo:baseInfo];
    }
}

+ (NSAttributedString *)attrBaseInfo:(ResumeBaseInfoCellViewModel *)baseInfo {
    NSString *text = [NSString stringWithFormat:@"Phone : %@\n"
                      "E-mail : %@\n"
                      "Github : %@\n"
                      "Blog: %@",
                      baseInfo.phone,
                      baseInfo.email,
                      baseInfo.github,
                      baseInfo.blog];
    NSMutableAttributedString *attrText = [NSMutableAttributedString xt_attributedStringWithString:text];
    [attrText xt_setFont:[UIFont systemFontOfSize:16.0f]];
    [attrText xt_setTextColor:[UIColor xt_colorWithHex:0x666666]];
    [attrText xt_modifyParagraphStylesWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.lineSpacing = 5.0f;
    }];
    return attrText;
}

@end
