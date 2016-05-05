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

+ (CGSize)sizeWithData:(nullable id<XTUTRow>)data constrainedToSize:(CGSize)size;

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;

- (void)configureWithData:(nullable id<XTUTRow>)data;

@end

@protocol XTUTSectionHeaderFooterView <NSObject>

+ (CGSize)sizeWithData:(nullable id<XTUTSectionHeaderFooter>)data constrainedToSize:(CGSize)size;

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier;

- (void)configureWithData:(nullable id<XTUTSectionHeaderFooter>)data;

@end

@protocol XTUTRow <NSObject>

- (NSString *)renderIdentifer;

- (Class<XTUTCell>)renderClass;

@optional
- (nullable id)data;

@end

@protocol XTUTSectionHeaderFooter <NSObject>

@optional

- (nullable NSString *)renderIdentifer;

- (nullable Class<XTUTSectionHeaderFooterView>)renderClass;

- (CGFloat)height;

- (nullable NSString *)title;

@end

@protocol XTUTSection <NSObject>

- (NSInteger)numberOfRows;

- (nullable id<XTUTRow>)rowAtIndex:(NSInteger)index;

- (nullable id<XTUTSectionHeaderFooter>)header;

- (nullable id<XTUTSectionHeaderFooter>)footer;

NS_ASSUME_NONNULL_END

@end
