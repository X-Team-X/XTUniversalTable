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

@interface ResumeBaseInfoCell ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ResumeBaseInfoCell

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier {
    
}

+ (CGSize)sizeWithData:(id<XTUTRow>)data constrainedToSize:(CGSize)size {
    return CGSizeMake(size.width, 100.0f);
//    XTUTRow *row = data;
//    NSAttributedString *attrText = [self attrBaseInfo:row.data];
//    return [attrText xt_sizeConstrainedToSize:CGSizeMake(size.width - 20.0f, size.height)];
}

- (void)configureWithData:(id<XTUTRow>)data {
    if ([data isKindOfClass:[XTUTRow class]]) {
        XTUTRow *row = data;
        self.textView.attributedText = [[self class] attrBaseInfo:row.data];
    }
}

+ (NSAttributedString *)attrBaseInfo:(NSDictionary *)baseInfo {
    NSString *text = [NSString stringWithFormat:@"Phone : %@\n"
                      "E-mail : %@\n"
                      "Github : %@",
                      baseInfo[@"phone"],
                      baseInfo[@"email"],
                      baseInfo[@"github"]];
    NSMutableAttributedString *attrText = [NSMutableAttributedString xt_attributedStringWithString:text];
    [attrText xt_setFont:[UIFont systemFontOfSize:16.0f]];
    [attrText xt_setTextColor:[UIColor xt_colorWithHex:0x666666]];
    [attrText xt_modifyParagraphStylesWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.lineSpacing = 5.0f;
    }];
    return attrText;
}

@end
