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

+ (instancetype)rowWithIdentifier:(NSString *)renderIdentifer
                      classString:(NSString *)renderClassString
                             data:(id)data;

@property (copy, nonatomic) NSString *renderIdentifer;
@property (copy, nonatomic) NSString *renderClassString;
@property (strong, nonatomic, nullable) id data;

NS_ASSUME_NONNULL_END

@end
