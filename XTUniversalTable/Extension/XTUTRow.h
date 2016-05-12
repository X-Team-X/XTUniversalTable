//
//  XTUTRow.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface XTUTRow : NSObject <XTUTRow>

+ (instancetype)rowWithClassString:(NSString *)renderClassString
                              data:(id)data;

@property (copy, nonatomic) NSString *renderClassString;
@property (strong, nonatomic, nullable) NSNumber *height;
@property (strong, nonatomic, nullable) id data;

@end

NS_ASSUME_NONNULL_END
