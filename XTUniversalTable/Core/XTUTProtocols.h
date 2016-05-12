//
//  XTUTProtocols.h
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

/**
 *  A table view content.
 *
 *  |-------------------|
 *  |   section header  |
 *  |-------------------|
 *  |       row 1       |
 *  |-------------------|
 *  |       row 2       |
 *  |-------------------|
 *  |      ......       |
 *  |-------------------|
 *  |   section footer  |
 *  |-------------------|
 *  |other sections ....|
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XTUTSectionHeaderFooter;
@protocol XTUTRow;

NS_ASSUME_NONNULL_BEGIN

/**
 *  A `UITableViewCell` object should implement the given methods.
 *  These methods will be called to set table view data source and delegate.
 */
@protocol XTUTCell <NSObject>

/**
 *  Ask the proper size of cell for given row data and constrained size.
 *  Height of the return size will be used as a return value in `tableView:heightForRowAtIndexPath:`.
 *
 *  @param data Row data, see `XTUTRow` for detail.
 *  @param size Constrained size.
 *
 *  @return Proper size of the cell.
 */
+ (CGSize)sizeWithData:(nullable id<XTUTRow>)data constrainedToSize:(CGSize)size;

/**
 *  Register cell to a table view.
 *  Call `registerNib:forCellReuseIdentifier:` or `registerClass:forCellReuseIdentifier:` in the implementation.
 *  If cell was registered in a story board, leave the implementation empty.
 *
 *  @param tableView  A table view object.
 */
+ (void)registerToTableView:(UITableView *)tableView;

/**
 *  Ask identifier for the cell. The returen value will be used to register and dequeue cell, should be unique.
 *
 *  @return The identifier.
 */
+ (NSString *)identifier;

/**
 *  Configure cell content with row data.
 *  This method will be invoked in `tableView:cellForRowAtIndexPath:`
 *
 *  @param data Row data, see `XTUTRow` for detail.
 */
- (void)configureWithData:(nullable id<XTUTRow>)data;

@end

/**
 *  A `UITableHeaderFooterView` object should implement the given methods.
 *  These methods will be called to set table view data source and delegate.
 *  You don't need a subclass of `UITableHeaderFooterView` which confirm to this protocol,
 *  if you use the default section header/footer. A class which confirm to protocol `XTUTSectionHeaderFooter`
 *  will work well.
 *
 */
@protocol XTUTSectionHeaderFooterView <NSObject>

/**
 *  Asks the proper size of section header/footer for given section data and constrained size.
 *
 *  @param data Section header/footer data, see `XTUTSectionHeaderFooter` for detail.
 *  @param size Constrained size
 *
 *  @return Proper size of the section header/footer.
 */
+ (CGSize)sizeWithData:(nullable id<XTUTSectionHeaderFooter>)data constrainedToSize:(CGSize)size;

/**
 *  Register table section header/footer view to a table view.
 *  Call `registerNib:forHeaderFooterViewReuseIdentifier:` or `registerClass:forHeaderFooterViewReuseIdentifier:` in the implementation.
 *
 *  @param tableView  A table view object.
 */
+ (void)registerToTableView:(UITableView *)tableView;

/**
 *  Ask identifier for the cell. The returen value will be used to register and dequeue table header/footer, should be unique.
 *
 *  @return The identifier.
 */
+ (NSString *)identifier;

/**
 *  Configure section header/footer content with section header/footer data.
 *
 *  @param data Section header/footer data, see `XTUTSectionHeaderFooter` for detail.
 */
- (void)configureWithData:(nullable id<XTUTSectionHeaderFooter>)data;

@end

/**
 *  Abstract table view cell data.
 */
@protocol XTUTRow <NSObject>

/**
 *  Ask the correspond cell class.
 *
 *  @return A cell class.
 */
- (Class<XTUTCell>)cellClass;

// The cached height. You don't need to access the property, set this to nil to invalidate cache at proper time.
@property (strong, nonatomic) NSNumber *cellHeight;

@end

/**
 *  Abastact table view section header/footer data.
 *  Implement `renderClass` for a customized section header/footer.
 *  Implement `height` and `title` for a default section header/footer.
 */
@protocol XTUTSectionHeaderFooter <NSObject>

@optional

/**
 *  Ask the correspond section header/footer class.
 *
 *  @return A section header/footer class.
 */
- (nullable Class<XTUTSectionHeaderFooterView>)headerFooterClass;

/**
 *  Ask the height of section header/footer.
 *
 *  @return Height.
 */
- (CGFloat)height;

/**
 *  Ask the title of section header/footer.
 *
 *  @return Title.
 */
- (nullable NSString *)title;

@end

/**
 *  Abstract table view section data.
 */
@protocol XTUTSection <NSObject>

/**
 *  Ask for the number of rows in the section.
 *  Invoked in `tableView:numberOfRowsInSection:`
 *
 *  @return Number of rows.
 */
- (NSInteger)numberOfRows;

/**
 *  Ask for the row data at given index.
 *
 *  @param index Index of row.
 *
 *  @return Row data.
 */
- (nullable id<XTUTRow>)rowAtIndex:(NSInteger)index;

/**
 *  Ask for the section header data.
 *
 *  @return Section header data.
 */
- (nullable id<XTUTSectionHeaderFooter>)header;

/**
 *  Ask for the section footer data.
 *
 *  @return Section footer data.
 */
- (nullable id<XTUTSectionHeaderFooter>)footer;

NS_ASSUME_NONNULL_END

@end
