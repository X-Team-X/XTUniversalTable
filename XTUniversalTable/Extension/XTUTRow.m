//
//  XTUTRow.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTRow.h"

@interface XTUTRow ()

@property (weak, nonatomic) Class cls;

@end

@implementation XTUTRow

+ (instancetype)rowWithClassString:(NSString *)cellClassString
                              data:(id)data {
    XTUTRow *row = [[self alloc] init];
    row.cellClassString = cellClassString;
    row.data = data;
    return row;
}

- (Class<XTUTCell>)cellClass {
    if (!_cls) {
        _cls = NSClassFromString(self.cellClassString);
        NSAssert([_cls conformsToProtocol:@protocol(XTUTCell)], @"'renderClass' must CONFIRM to protocol 'XTUTCell'");
    }
    return _cls;
}

- (void)setData:(id)data {
    _data = data;
    self.cellHeight = nil;
}

@end
