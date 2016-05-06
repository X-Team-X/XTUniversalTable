//
//  ViewController.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ViewController.h"
#import "RowDataA.h"
#import "RowDataB.h"
#import "XTUniversalTable.h"

@interface ViewController () <XTUTProxyDataSource, XTUTProxyDelegate> {
    NSArray<id<XTUTSection>> *_sections;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) XTUTProxy *tableProxy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableProxy = [[XTUTProxy alloc] initWithTableView:self.tableView];
    self.tableProxy.dataSource = self;
    self.tableProxy.delegate = self;
}

#pragma mark - UI events

- (IBAction)reload:(id)sender {
    _sections = nil;
    [self.tableView reloadData];
}


#pragma mark - XTUTProxyDataSource

- (NSArray<id<XTUTSection>>  * _Nullable)sections {
    if (!_sections) {
        // Section A
        NSMutableArray *rowsA = [NSMutableArray array];
        u_int32_t randomA = arc4random() % 5 + 5;
        for (u_int32_t i = 0; i < randomA; i++) {
            RowDataA *rowData = [RowDataA new];
            rowData.title = @"Row A - title";
            [rowsA addObject:rowData];
        }
        XTUTSection *sectionA = [XTUTSection sectionWithRows:rowsA
                                                      header:nil
                                                      footer:nil];
    
        _sections = @[sectionA];
    }
    return _sections;
}

#pragma mark - XTUTProxyDelegate

- (void)didConfigureTableView:(UITableView *)tableView cell:(id<XTUTCell>)cell atIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didSelectTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withRowData:(id<XTUTRow>)rowData {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
