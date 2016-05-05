//
//  DemoCellB.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "DemoCellB.h"
#import "RowDataB.h"

@implementation DemoCellB

+ (CGSize)sizeWithData:(id<XTUTRow>)data constrainedToSize:(CGSize)size {
    return CGSizeMake(size.width, 88.0f);
}

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier {
    // Already register in storyboard
}

- (void)configureWithData:(id<XTUTRow>)data {
    if ([data isKindOfClass:[RowDataB class]]) {
        RowDataB *rowData = data;
        self.textLabel.text = rowData.title;
        self.detailTextLabel.text = rowData.detail;
    }
}

@end
