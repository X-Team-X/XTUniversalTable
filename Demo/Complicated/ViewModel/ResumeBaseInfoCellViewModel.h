//
//  ResumeBaseInfoCellViewModel.h
//  XTUniversalTable
//
//  Created by wuwen on 16/5/12.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTUTProtocols.h"

@interface ResumeBaseInfoCellViewModel : NSObject <XTUTRow>

@property (copy, nonatomic) NSString *phone;
@property (copy, nonatomic) NSString *email;
@property (copy, nonatomic) NSString *github;
// XTUTRow
@property (strong, nonatomic) NSNumber *height;

@end
