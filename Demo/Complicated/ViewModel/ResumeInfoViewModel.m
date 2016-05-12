//
//  ResumeInfoViewModel.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/12.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ResumeInfoViewModel.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>

@implementation ResumeInfoViewModel

//+ (NSArray *)mj_objectClassInArray {
//    
//}

- (void)loadResumeInfoWithCompletion:(void (^)(NSError *))completion {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:@"https://raw.githubusercontent.com/X-Team-X/XTUniversalTable/master/Demo/Resource/info.json"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSDictionary *JSONObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                        options:NSJSONReadingMutableContainers
                                                                          error:nil];
             [self mj_setKeyValues:JSONObject];
             if (completion) {
                 completion(nil);
             }
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             if (completion) {
                 completion(error);
             }
         }];
}

@end
