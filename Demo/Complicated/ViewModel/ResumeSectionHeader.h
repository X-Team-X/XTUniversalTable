//
//  ResumeSectionHeader.h
//  XTUniversalTable
//
//  Created by wuwen on 16/5/9.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTUniversalTable.h"

@interface ResumeSectionHeader : NSObject <XTUTSectionHeaderFooter>

@property (copy, nonatomic) NSString *title;
@property (assign, nonatomic) BOOL expanded;

@end
