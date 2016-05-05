//
//  XTUTProtocols.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XTUTSectionHeaderFooter;
@protocol XTUTRow;

NS_ASSUME_NONNULL_BEGIN

@protocol XTUTCell <NSObject>

+ (CGSize)sizeWithData:(id<XTUTRow> _Nullable)data constrainedToSize:(CGSize)size;

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;

- (void)configureWithData:(id<XTUTRow> _Nullable)data;

@end

@protocol XTUTSectionHeaderFooterView <NSObject>

+ (CGSize)sizeWithData:(id<XTUTSectionHeaderFooter> _Nullable)data constrainedToSize:(CGSize)size;

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;

- (void)configureWithData:(id<XTUTSectionHeaderFooter> _Nullable)data;

@end

@protocol XTUTRow <NSObject>

- (NSString *)renderIdentifer;

- (Class<XTUTCell>)renderClass;

@end

@protocol XTUTSectionHeaderFooter <NSObject>

@optional

- (NSString * _Nullable)renderIdentifer;

- (__nullable Class<XTUTSectionHeaderFooterView>)renderClass;

- (CGFloat)height;

- (NSString * _Nullable)title;

@end

@protocol XTUTSection <NSObject>

- (NSInteger)numberOfRows;

- (id<XTUTRow>)rowAtIndex:(NSInteger)index;

- (__nullable id<XTUTSectionHeaderFooter>)header;

- (__nullable id<XTUTSectionHeaderFooter>)footer;

NS_ASSUME_NONNULL_END

@end
