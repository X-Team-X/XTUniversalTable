//
//  XTUTSection.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

@interface XTUTSection : NSObject <XTUTSection>

NS_ASSUME_NONNULL_BEGIN

+ (instancetype)sectionWithRows:(nullable NSArray<id<XTUTRow>> *)rows
                         header:(nullable id<XTUTSectionHeaderFooter>)header
                         footer:(nullable id<XTUTSectionHeaderFooter>)footer;

@property (copy, nonatomic, nullable) NSArray<id<XTUTRow>> *rows;
@property (strong, nonatomic, nullable) id<XTUTSectionHeaderFooter> header;
@property (strong, nonatomic, nullable) id<XTUTSectionHeaderFooter> footer;

NS_ASSUME_NONNULL_END

@end
