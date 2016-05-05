//
//  XTUTSection.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTSection.h"

@implementation XTUTSection

- (NSInteger)numberOfRows {
    return self.rows.count;
}

- (id<XTUTRow>)rowAtIndex:(NSInteger)index {
    if (index >= 0 && index < self.rows.count) {
        return self.rows[index];
    }
    return nil;
}

@end
