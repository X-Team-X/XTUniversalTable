//
//  DemoCellA.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/5.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "DemoCellA.h"
#import "RowDataA.h"

@implementation DemoCellA

+ (CGSize)sizeWithData:(id<XTUTRow>)data constrainedToSize:(CGSize)size {
    return CGSizeMake(size.width, 44.0f);
}

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier {
    // Already register in storyboard
}

- (void)configureWithData:(id<XTUTRow>)data {
    if ([data isKindOfClass:[RowDataA class]]) {
        RowDataA *rowData = data;
        self.textLabel.text = rowData.title;
    }
}

@end
