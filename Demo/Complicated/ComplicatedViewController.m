//
//  ComplicatedViewController.m
//  XTUniversalTable
//
//  Created by wuwen on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "ComplicatedViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <AFNetworking/UIKit+AFNetworking.h>
#import "XTUniversalTable.h"
#import "ResumeSectionHeader.h"

@interface ComplicatedViewController ()

@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarBackgroundView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) XTUTProxy *tableProxy;

@end

@implementation ComplicatedViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadResumeInfo];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGRect frame = self.tableHeaderView.frame;
    frame.size = self.avatarBackgroundView.frame.size;
    self.tableHeaderView.frame = frame;
    self.tableView.tableHeaderView = self.tableHeaderView;
}

- (void)updateUI {
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:self.viewModel.avatar]];
    self.nameLabel.text = self.viewModel.name;
    [self assembleTableData];
    [self.tableView reloadData];
}

#pragma mark - Data

- (void)loadResumeInfo {
    [SVProgressHUD show];
    [self.viewModel loadResumeInfoWithCompletion:^(NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"Network error!"];
            [SVProgressHUD dismissWithDelay:2.0f];
        } else {
            [SVProgressHUD dismiss];
            [self updateUI];
        }
    }];
}

- (void)assembleTableData {
    NSMutableArray<XTUTSection *> *sections = [NSMutableArray array];
    
    // base info
    XTUTSection *baseInfoSection = [XTUTSection sectionWithRows:@[self.viewModel.baseInfo]
                                                         header:[self headerWithTitle:@"GENERAL"]
                                                         footer:nil];
    
    [sections addObject:baseInfoSection];
    
    // education info
    XTUTSection *educationSection = [XTUTSection sectionWithRows:nil
                                                         header:[self headerWithTitle:@"EDUCATION"]
                                                         footer:nil];
    
    [sections addObject:educationSection];

    // work
//    XTUTSection *workSection = [XTUTSection sectionWithRows:nil
//                                                          header:[self headerWithTitle:@"WORK"]
//                                                          footer:nil];
//    
//    [sections addObject:workSection];

    self.tableProxy.sections = sections;
}

- (ResumeSectionHeader *)headerWithTitle:(NSString *)title {
    ResumeSectionHeader *header = [[ResumeSectionHeader alloc] init];
    header.title = title;
    return header;
}

#pragma mark - Getters & setters 

- (XTUTProxy *)tableProxy  {
    if (!_tableProxy) {
        if (self.tableView) {
            _tableProxy = [[XTUTProxy alloc] initWithTableView:self.tableView];
        }
    }
    return _tableProxy;
}

@end
