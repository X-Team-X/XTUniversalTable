//
//  XTUTProxy.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "XTUTProxy.h"

@interface XTUTProxy ()

@property (weak, nonatomic) UITableView *tableView;

@end

@implementation XTUTProxy

#pragma mark - Life cycle

- (instancetype)initWithTableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _tableView = tableView;
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    return self;
}

- (instancetype)init {
    return [self initWithTableView:nil];
}

- (void)dealloc {
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<XTUTSection> XTUTSection = self.sections[section];
    return [XTUTSection numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTRow> row = [self rowAtIndexPath:indexPath];
    Class<XTUTCell> cellCls = [row cellClass];
    UITableViewCell<XTUTCell> *cell = [tableView dequeueReusableCellWithIdentifier:[cellCls identifier]
                                                                      forIndexPath:indexPath];
    [cell configureWithData:row];
    if ([self.delegate respondsToSelector:@selector(didConfigureTableView:cell:atIndexPath:)]) {
        [self.delegate didConfigureTableView:tableView
                                        cell:cell
                                 atIndexPath:indexPath];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if ([footer respondsToSelector:@selector(title)]) {
        return [footer title];
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> header = [self headerAtSection:section];
    if ([header respondsToSelector:@selector(title)]) {
        return [header title];
    }
    return nil;
}

#pragma mark - UITableViewDelegate

// Footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if (!footer) {
        return 0.0f;
    }
    
    // Customize first
    if ([footer respondsToSelector:@selector(headerFooterClass)]) {
        Class<XTUTSectionHeaderFooterView> footerClass = [footer headerFooterClass];
        return [footerClass sizeWithData:footer constrainedToSize:CGSizeMake(self.tableView.frame.size.width, MAXFLOAT)].height;
    }
    if ([footer respondsToSelector:@selector(height)]) {
        return [footer height];
    }
    
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if ([footer respondsToSelector:@selector(headerFooterClass)]) {
        Class<XTUTSectionHeaderFooterView> headerViewCls = [footer headerFooterClass];
        UITableViewHeaderFooterView<XTUTSectionHeaderFooterView> *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[headerViewCls identifier]];
        [footerView configureWithData:footer];
        return footerView;
    }
    return nil;
}

// Header
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> header = [self headerAtSection:section];
    if (!header) {
        return 0.0f;
    }
    
    // Customize first
    if ([header respondsToSelector:@selector(headerFooterClass)]) {
        Class<XTUTSectionHeaderFooterView> headerClass = [header headerFooterClass];
        return [headerClass sizeWithData:header constrainedToSize:CGSizeMake(self.tableView.frame.size.width, MAXFLOAT)].height;
    }
    
    if ([header respondsToSelector:@selector(height)]) {
        return [header height];
    }
    
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> header = [self headerAtSection:section];
    if ([header respondsToSelector:@selector(headerFooterClass)]) {
        Class<XTUTSectionHeaderFooterView> headerViewCls = [header headerFooterClass];
        UITableViewHeaderFooterView<XTUTSectionHeaderFooterView> *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[headerViewCls identifier]];
        [headerView configureWithData:header];
        return headerView;
    }
    return nil;
}

// Row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTRow> row = [self rowAtIndexPath:indexPath];
    CGFloat height = 0;
    if (row.cellHeight) {
        height = [row.cellHeight floatValue];
    } else {
        Class<XTUTCell> cellCls = [row cellClass];
        height = [cellCls sizeWithData:row constrainedToSize:CGSizeMake(self.tableView.frame.size.width, MAXFLOAT)].height;
        row.cellHeight = @(height);
    }
    if (fabs(height) < FLT_EPSILON) {
        height = 44.0f;
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectTableView:atIndexPath:withRowData:)]) {
        id<XTUTRow> row = [self rowAtIndexPath:indexPath];
        [self.delegate didSelectTableView:tableView
                              atIndexPath:indexPath
                              withRowData:row];
    }
}

#pragma mark - Private

- (void)registerTableViewComponents {
    
    void (^registerHeaderFooter)(id<XTUTSectionHeaderFooter>) = ^(id<XTUTSectionHeaderFooter> headerFooter) {
        if ([headerFooter respondsToSelector:@selector(headerFooterClass)]) {
            Class<XTUTSectionHeaderFooterView> cls = [headerFooter headerFooterClass];
            [cls registerToTableView:self.tableView];
        }
    };
    
    [self.sections enumerateObjectsUsingBlock:^(id<XTUTSection>  _Nonnull section, NSUInteger idx, BOOL * _Nonnull stop) {
        // Header
        id<XTUTSectionHeaderFooter> header = [section header];
        registerHeaderFooter(header);
        // Row
        NSInteger rowCount = [section numberOfRows];
        for (NSInteger i; i < rowCount; i++) {
            id<XTUTRow> row = [section rowAtIndex:i];
            Class<XTUTCell> cls = [row cellClass];
            [cls registerToTableView:self.tableView];
        }
        // Footer
        id<XTUTSectionHeaderFooter> footer = [section footer];
        registerHeaderFooter(footer);
    }];
}

#pragma mark - Utility

- (id<XTUTSectionHeaderFooter>)headerAtSection:(NSInteger)section {
    if (section < 0
        || section >= self.sections.count) {
        return nil;
    }
    id<XTUTSection> XTUTSection = self.sections[section];
    return [XTUTSection header];
}

- (id<XTUTSectionHeaderFooter>)footerAtSection:(NSInteger)section {
    if (section < 0
        || section >= self.sections.count) {
        return nil;
    }
    id<XTUTSection> XTUTSection = self.sections[section];
    return [XTUTSection footer];
}

- (id<XTUTSection>)sectionAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section < 0
        || indexPath.section >= self.sections.count) {
        return nil;
    }
    return self.sections[indexPath.section];
}

- (id<XTUTRow>)rowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTSection> section = [self sectionAtIndexPath:indexPath];
    return [section rowAtIndex:indexPath.row];
}

#pragma mark - Setters & getters

- (void)setSections:(NSArray<id<XTUTSection>> *)sections {
    _sections = sections;
    [self registerTableViewComponents];
}

@end
