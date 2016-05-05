//
//  RowDataA.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "RowDataA.h"
#import "DemoCellA.h"

@implementation RowDataA

- (NSString *)renderIdentifer {
    return @"DemoCellA";
}

- (Class<XTUTCell>)renderClass {
    return [DemoCellA class];
}

@end
