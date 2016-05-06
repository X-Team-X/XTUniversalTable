//
//  SimpleCell.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "SimpleCell.h"

@implementation SimpleCell

+ (void)registerToTableView:(UITableView *)tableView withIdentifier:(NSString *)identifier {
    
}

+ (CGSize)sizeWithData:(id<XTUTRow>)data constrainedToSize:(CGSize)size {
    return CGSizeMake(size.width, 44.0f);
}

- (void)configureWithData:(id<XTUTRow>)data {
    XTUTRow *simpleRow = data;
    self.textLabel.text = simpleRow.data[@"name"];
}

@end
