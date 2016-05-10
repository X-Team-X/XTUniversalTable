//
//  UIColor+XTConvenience.h
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (XTConvenience)

+ (instancetype)xt_colorWithHex:(unsigned int)hex;

+ (instancetype)xt_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

@end
