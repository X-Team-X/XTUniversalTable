//
//  ResumeInfoViewModel.h
//  XTUniversalTable
//
//  Created by wuwen on 16/5/12.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResumeBaseInfoCellViewModel.h"
#import "ResumeEducationCellViewModel.h"
#import "ResumeWorkCellViewModel.h"
#import "ResumeProjectCellViewModel.h"

@interface ResumeInfoViewModel : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *avatar;
@property (strong, nonatomic) ResumeBaseInfoCellViewModel *baseInfo;
@property (copy, nonatomic) NSArray<ResumeEducationCellViewModel *> *education;
@property (copy, nonatomic) NSArray<ResumeWorkCellViewModel *> *work;
@property (copy, nonatomic) NSArray<ResumeProjectCellViewModel *> *projects;
@property (copy, nonatomic) NSArray<NSString *> *skills;

- (void)loadResumeInfoWithCompletion:(void(^)(NSError *error))completion;

@end
