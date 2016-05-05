//
//  XTUTSection.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

@interface XTUTSection : NSObject <XTUTSection>

@property (copy, nonatomic) NSArray<id<XTUTRow>> *rows;
@property (strong, nonatomic) id<XTUTSectionHeaderFooter> header;
@property (strong, nonatomic) id<XTUTSectionHeaderFooter> footer;

@end
