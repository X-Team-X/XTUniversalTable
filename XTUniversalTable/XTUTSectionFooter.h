//
//  XTUTSectionFooter.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

@interface XTUTSectionFooter : NSObject <XTUTSectionHeaderFooter>

@property (assign, nonatomic) CGFloat height;
@property (copy, nonatomic) NSString *title;

@end
