//
//  ResumeSectionHeader.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ResumeSectionHeader.h"
#import "ResumeSectionHeaderView.h"

@implementation ResumeSectionHeader

- (NSString *)renderIdentifier {
    return @"ResumeSectionHeader";
}

- (Class<XTUTSectionHeaderFooterView>)renderClass {
    return [ResumeSectionHeaderView class];
}

@end
