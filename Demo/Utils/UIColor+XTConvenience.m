//
//  UIColor+XTConvenience.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "UIColor+XTConvenience.h"

@implementation UIColor (XTConvenience)

+ (instancetype)xt_colorWithHex:(unsigned int)hex {
    return [self xt_colorWithHex:hex alpha:1];
}

+ (instancetype)xt_colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

@end
