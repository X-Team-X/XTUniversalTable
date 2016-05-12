//
//  XTUTDeafaultSectionHeaderFooter.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTDefaultSectionHeaderFooter.h"

@interface XTUTDefaultSectionHeaderFooter ()

@end

@implementation XTUTDefaultSectionHeaderFooter

+ (instancetype)footerWithHeight:(CGFloat)height title:(NSString *)title {
    XTUTDefaultSectionHeaderFooter *footer = [[self alloc] init];
    [footer configureWithHeight:height title:title];
    return footer;
}

+ (instancetype)headerWithHeight:(CGFloat)height title:(NSString *)title {
    XTUTDefaultSectionHeaderFooter *header = [[self alloc] init];
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
