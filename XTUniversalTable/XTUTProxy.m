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
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.delegate sections].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<XTUTSection> XTUTSection = [self.delegate sections][section];
    return [XTUTSection numberOfRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTRow> row = [self rowAtIndexPath:indexPath];
    UITableViewCell<XTUTCell> *cell = [tableView dequeueReusableCellWithIdentifier:[row renderIdentifer]
                                                                     forIndexPath:indexPath];
    [cell configureWithData:row];
    if ([self.delegate respondsToSelector:@selector(didConfigureTableView:cell:atIndexPath:)]) {
        [self.delegate didConfigureTableView:tableView
                                        cell:cell
                                 atIndexPath:indexPath];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

// footer
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if (!footer) {
        return 0.0f;
    }
    
    // Customize first
    if ([footer respondsToSelector:@selector(renderClass)]) {
        Class<XTUTSectionHeaderFooterView> footerClass = [footer renderClass];
        return [footerClass sizeWithData:footer constrainedToSize:self.tableView.frame.size].height;
    }
    if ([footer respondsToSelector:@selector(height)]) {
        return [footer height];
    }
    
    return 0.0f;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if ([footer respondsToSelector:@selector(title)]) {
        return [footer title];
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> footer = [self footerAtSection:section];
    if ([footer respondsToSelector:@selector(renderIdentifer)]) {
        UITableViewHeaderFooterView<XTUTSectionHeaderFooterView> *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[footer renderIdentifer]];
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
    if ([header respondsToSelector:@selector(renderClass)]) {
        Class<XTUTSectionHeaderFooterView> headerClass = [header renderClass];
        return [headerClass sizeWithData:header constrainedToSize:self.tableView.frame.size].height;
    }
    
    if ([header respondsToSelector:@selector(height)]) {
        return [header height];
    }
    
    return 0.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    id<XTUTSectionHeaderFooter> header = [self headerAtSection:section];
    if ([header respondsToSelector:@selector(renderIdentifer)]) {
        UITableViewHeaderFooterView<XTUTSectionHeaderFooterView> *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[header renderIdentifer]];
        [headerView configureWithData:header];
        return headerView;
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

// Row
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTSection> XTUTSection = [self.delegate sections][indexPath.section];
    id<XTUTRow> row = [XTUTSection rowAtIndex:indexPath.row];
    Class<XTUTCell> cellClass = [row renderClass];
    return [cellClass sizeWithData:row constrainedToSize:self.tableView.frame.size].height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(didSelectTableView:atIndexPath:withRowData:)]) {
        id<XTUTRow> row = [self rowAtIndexPath:indexPath];
        [self.delegate didSelectTableView:tableView
                              atIndexPath:indexPath
                              withRowData:row];
    }
}

#pragma mark - Utility

- (id<XTUTSectionHeaderFooter>)headerAtSection:(NSInteger)section {
    id<XTUTSection> XTUTSection = [self.delegate sections][section];
    return [XTUTSection header];
}

- (id<XTUTSectionHeaderFooter>)footerAtSection:(NSInteger)section {
    id<XTUTSection> XTUTSection = [self.delegate sections][section];
    return [XTUTSection footer];
}

- (id<XTUTRow>)rowAtIndexPath:(NSIndexPath *)indexPath {
    id<XTUTSection> section = [self.delegate sections][indexPath.section];
    return [section rowAtIndex:indexPath.row];
}

@end
