//
//  RowDataB.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "RowDataB.h"
#import "DemoCellB.h"

@implementation RowDataB

- (NSString *)renderIdentifier {
    return @"DemoCellB";
}

- (Class<XTUTCell>)renderClass {
    return [DemoCellB class];
}

@end
