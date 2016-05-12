//
//  RootTableViewController.m
//  XTUniversalTable
//
//  Created by 吾问 on 16/5/6.
//  Copyright © 2016年 X-Team. All rights reserved.
//

#import "RootTableViewController.h"
#import "ComplicatedViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showComplicatedDemo"]) {
        ComplicatedViewController *controller = segue.destinationViewController;
        controller.viewModel = [ResumeInfoViewModel new];
    }
}

@end
