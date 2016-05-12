//
//  XTUTDefaultSectionHeaderFooter.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface XTUTDefaultSectionHeaderFooter : NSObject <XTUTSectionHeaderFooter>

+ (instancetype)headerWithHeight:(CGFloat)height
                           title:(nullable NSString *)title;

+ (instancetype)footerWithHeight:(CGFloat)height
                           title:(nullable NSString *)title;

@property (assign, nonatomic) CGFloat height;
@property (copy, nonatomic, nullable) NSString *title;

@end

NS_ASSUME_NONNULL_END
