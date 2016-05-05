//
//  XTUTSection.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

@interface XTUTSection : NSObject <XTUTSection>

+ (instancetype)sectionWithRows:(NSArray<id<XTUTRow>> *)rows
                         header:(id<XTUTSectionHeaderFooter>)header
                         footer:(id<XTUTSectionHeaderFooter>)footer;

@property (copy, nonatomic) NSArray<id<XTUTRow>> *rows;
@property (strong, nonatomic) id<XTUTSectionHeaderFooter> header;
@property (strong, nonatomic) id<XTUTSectionHeaderFooter> footer;

@end
