//
//  XTUTProxy.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XTUTProxyDelegate <NSObject>

- (NSArray<id<XTUTSection>> * _Nullable)sections;

@optional

- (void)didConfigureTableView:(UITableView *)tableView
                         cell:(id<XTUTCell>)cell
             atIndexPath:(NSIndexPath *)indexPath;

- (void)didSelectTableView:(UITableView *)tableView
               atIndexPath:(NSIndexPath *)indexPath
               withRowData:(id<XTUTRow>)rowData;

@end

@interface XTUTProxy : NSObject <UITableViewDelegate, UITableViewDataSource>

- (instancetype)initWithTableView:(UITableView  * _Nullable)tableView NS_DESIGNATED_INITIALIZER;

@property (weak, nonatomic) id<XTUTProxyDelegate> _Nullable delegate;

@end

NS_ASSUME_NONNULL_END