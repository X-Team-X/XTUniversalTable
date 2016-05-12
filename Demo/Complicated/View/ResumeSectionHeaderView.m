//
//  ResumeHeaderView.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ResumeSectionHeaderView.h"
#import "ResumeSectionHeader.h"
#import "UIColor+XTConvenience.h"

@interface ResumeSectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *showSwitch;

@end

@implementation ResumeSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor xt_colorWithHex:0xf0f0f0];
    self.backgroundView = view;
}

#pragma mark - XTUTSectionHeaderFooterView

+ (CGSize)sizeWithData:(id<XTUTSectionHeaderFooter>)data constrainedToSize:(CGSize)size {
    return (CGSize){.width = size.width, .height = 40.0f};
}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forHeaderFooterViewReuseIdentifier:[self identifier]];
}

+ (NSString *)identifier {
    return @"ResumeSectionHeaderView";
}

- (void)configureWithData:(id<XTUTSectionHeaderFooter>)data {
    if ([data isKindOfClass:[ResumeSectionHeader class]]) {
        ResumeSectionHeader *header = data;
        self.titleLabel.text = header.title;
        self.showSwitch.on = header.expanded;
    }
}

@end
