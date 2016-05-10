//
//  ResumeHeaderView.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ResumeSectionHeaderView.h"
#import "ResumeSectionHeader.h"

@interface ResumeSectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *showSwitch;

@end

@implementation ResumeSectionHeaderView

- (void)awakeFromNib {
    [super awakeFromNib];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor colorWithWhite:249.0/255.0 alpha:1.0f];
    self.backgroundView = view;
}

+ (CGSize)sizeWithData:(id<XTUTSectionHeaderFooter>)data constrainedToSize:(CGSize)size {
    return (CGSize){.width = size.width, .height = 40.0f};
}

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass(self) bundle:nil] forHeaderFooterViewReuseIdentifier:identifier];
}

- (void)configureWithData:(id<XTUTSectionHeaderFooter>)data {
    if ([data isKindOfClass:[ResumeSectionHeader class]]) {
        ResumeSectionHeader *header = data;
        self.titleLabel.text = header.title;
        self.showSwitch.on = header.expanded;
    }
}

@end
