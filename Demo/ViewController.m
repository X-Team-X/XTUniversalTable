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

@interface ViewController () <XTUTProxyDelegate> {
    NSArray<id<XTUTSection>> *_sections;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) XTUTProxy *tableProxy;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableProxy = [[XTUTProxy alloc] initWithTableView:self.tableView];
    self.tableProxy.delegate = self;
}

#pragma mark - UI events

- (IBAction)reload:(id)sender {
    _sections = nil;
    [self.tableView reloadData];
}


#pragma mark - XTUTProxyDelegate

- (NSArray<id<XTUTSection>>  * _Nullable)sections {
    if (!_sections) {
        // Section A
        XTUTSection *sectionA = [XTUTSection new];
        XTUTSectionHeader *headerA = [XTUTSectionHeader new];
        headerA.height = 30.0f;
        headerA.title = @"SECTION HEADER A";
        XTUTSectionFooter *footerA = [XTUTSectionFooter new];
        footerA.height = 20.0f;
        footerA.title = @"SECTION FOOTER A";
        sectionA.header = headerA;
        sectionA.footer = footerA;
        NSMutableArray *rowsA = [NSMutableArray array];
        u_int32_t randomA = arc4random() % 20;
        for (u_int32_t i = 0; i < randomA; i++) {
            RowDataA *rowData = [RowDataA new];
            rowData.title = @"Row A - title";
            [rowsA addObject:rowData];
        }
        sectionA.rows = rowsA;
        
        // Section B
        XTUTSection *sectionB = [XTUTSection new];
        XTUTSectionHeader *headerB = [XTUTSectionHeader new];
        headerB.height = 50.0f;
        headerB.title = @"SECTION HEADER B";
        XTUTSectionFooter *footerB = [XTUTSectionFooter new];
        footerB.height = 30.0f;
        footerB.title = @"SECTION FOOTER B";
        sectionB.header = headerB;
        sectionB.footer = footerB;
        NSMutableArray *rowsB = [NSMutableArray array];
        u_int32_t randomB = arc4random() % 20;
        for (u_int32_t i = 0; i < randomB; i++) {
            RowDataB *rowData = [RowDataB new];
            rowData.title = @"Row B - title";
            [rowsB addObject:rowData];
        }
        sectionB.rows = rowsB;

        _sections = @[sectionA, sectionB];
    }
    return _sections;
}

- (void)didConfigureTableView:(UITableView *)tableView cell:(id<XTUTCell>)cell atIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didSelectTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath withRowData:(id<XTUTRow>)rowData {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
