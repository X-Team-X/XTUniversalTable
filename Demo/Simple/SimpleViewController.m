//
//  SimpleViewController.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "SimpleViewController.h"
#import "XTUniversalTable.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface SimpleViewController () {
    NSArray<id<XTUTSection>> *_sectons;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) XTUTProxy *tableProxy;

@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableProxy = [[XTUTProxy alloc] initWithTableView:self.tableView];
    [self loadData];
}

- (void)loadData {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD showWithStatus:@"loading"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    [manager GET:@"https://raw.githubusercontent.com/X-Team-X/XTUniversalTable/master/Demo/Resource/cities.json"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             [SVProgressHUD dismiss];
             NSDictionary<NSString *, NSArray *> *JSONObject = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                                               options:NSJSONReadingMutableContainers
                                                                                                 error:nil];
             
             NSMutableArray *sections = [NSMutableArray array];
             
             NSArray<NSString *> *sortedKeys = [[JSONObject allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString *key1, NSString *key2) {
                 return [key1 compare:key2];
             }];
             
             [sortedKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
                 // Rows
                 NSMutableArray *cityRows = [NSMutableArray array];
                 NSArray<NSDictionary *> *cities = JSONObject[key];
                 [cities enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull city, NSUInteger idx, BOOL * _Nonnull stop) {
                     XTUTRow *row = [XTUTRow rowWithIdentifier:@"cell"
                                                   classString:@"SimpleCell"
                                                          data:city];
                     if (row) {
                         [cityRows addObject:row];
                     }
                 }];
                 // Header
                 XTUTSectionHeaderFooter *header = [XTUTSectionHeaderFooter headerWithHeight:20.0f title:key];
                 // Section
                 XTUTSection *section = [XTUTSection sectionWithRows:cityRows
                                                              header:header
                                                              footer:nil];
                 [sections addObject:section];
             }];
             dispatch_async(dispatch_get_main_queue(), ^{
                 self.tableProxy.sections = sections;
                 [self.tableView reloadData];
             });
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             [SVProgressHUD dismiss];
             NSLog(@"Failed with error: %@", error);
         }];
}

@end
