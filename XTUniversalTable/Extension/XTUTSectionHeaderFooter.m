//
//  XTUTSectionHeaderFooter.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTSectionHeaderFooter.h"

@interface XTUTSectionHeaderFooter ()

@property (weak, nonatomic) Class cls;

@end

@implementation XTUTSectionHeaderFooter

+ (instancetype)footerWithHeight:(CGFloat)height title:(NSString *)title {
    XTUTSectionHeaderFooter *footer = [[self alloc] init];
    [footer configureWithHeight:height title:title];
    return footer;
}

+ (instancetype)headerWithHeight:(CGFloat)height title:(NSString *)title {
    XTUTSectionHeaderFooter *header = [[self alloc] init];
    header.height = height;
    header.title = title;
    [header configureWithHeight:height title:title];
    return header;
}

- (void)configureWithHeight:(CGFloat)height
                      title:(NSString *)title {
    self.height = height;
    self.title = title;
}

@end
