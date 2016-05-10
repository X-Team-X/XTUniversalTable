//
//  NSObject+XTUTRow.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/10.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "NSObject+XTUTRow.h"
#import <objc/runtime.h>

static const void *kCellHeightKey = &kCellHeightKey;
static const void *kCellIdentifierKey = &kCellIdentifierKey;
static const void *kCellClassStringKey = &kCellClassStringKey;

@implementation NSObject (XTUTRow)

#pragma mark - XTRow

- (Class<XTUTCell>)renderClass {
    return NSClassFromString(self.xtut_cellIdentifier);
}

- (NSString *)renderIdentifier {
    return self.xtut_cellClassString;
}

#pragma mark - Setters & getters

- (void)setXtut_cellHeight:(NSNumber *)xtut_cellHeight {
    objc_setAssociatedObject(self, kCellHeightKey, xtut_cellHeight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)xtut_cellHeight {
    return objc_getAssociatedObject(self, kCellHeightKey);
}

- (void)setXtut_cellIdentifier:(NSString *)xtut_cellIdentifier {
    objc_setAssociatedObject(self, kCellIdentifierKey, xtut_cellIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)xtut_cellIdentifier {
    return objc_getAssociatedObject(self, kCellIdentifierKey);
}

- (void)setXtut_cellClassString:(NSString *)xtut_cellClassString {
    objc_setAssociatedObject(self, kCellClassStringKey, xtut_cellClassString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)xtut_cellClassString {
    return objc_getAssociatedObject(self, kCellClassStringKey);
}

@end