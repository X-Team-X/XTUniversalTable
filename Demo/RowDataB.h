//
//  RowDataB.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTUTProtocols.h"

@interface RowDataB : NSObject <XTUTRow>

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *detail;

@end
