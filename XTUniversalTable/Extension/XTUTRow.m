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

+ (instancetype)rowWithIdentifier:(NSString *)renderIdentifier
                      classString:(NSString *)renderClassString
                             data:(id)data {
    XTUTRow *row = [[self alloc] init];
    row.renderIdentifier = renderIdentifier;
    row.renderClassString = renderClassString;
    row.data = data;
    return row;
}

- (Class<XTUTCell>)renderClass {
    if (!_cls) {
        _cls = NSClassFromString(self.renderClassString);
        NSAssert([_cls conformsToProtocol:@protocol(XTUTCell)], @"'renderClass' must CONFIRM to protocol 'XTUTCell'");
    }
    return _cls;
}

@end
