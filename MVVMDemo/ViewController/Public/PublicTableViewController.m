//
//  PublicTableViewController.m
//  MVVMDemo
//
//  Created by hc_cyril on 2017/5/16.
//  Copyright © 2017年 Clark. All rights reserved.
//

#import "PublicTableViewController.h"
#import "PublicWeiboViewModel.h"
#import "PublicCell.h"

@interface PublicTableViewController ()
@property(strong, nonatomic) NSArray *publicModelArray;
@end

@implementation PublicTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.title = @"MVVM";
    PublicWeiboViewModel *publicViewModel = [[PublicWeiboViewModel alloc] init];
    [publicViewModel setblockWithReturnBlock:^(id returnValue) {
        [SVProgressHUD dismiss];
        _publicModelArray = returnValue;
        [self.tableView reloadData];
        DDLog(@"%@", _publicModelArray);
    } errorBlock:^(id errorCode) {
        [SVProgressHUD dismiss];
    } failureBlock:^{
        [SVProgressHUD dismiss];
    }];
    [publicViewModel fetchPublicWeibo];
    [SVProgressHUD showWithStatus:@"加载中..."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _publicModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PublicCell"];
    if (!cell) {
        cell = [[PublicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PublicCell"];
    }
    [cell setValueWithDic:_publicModelArray[indexPath.row]];
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [[PublicWeiboViewModel new] weiboDetailWithPublicModel:_publicModelArray[indexPath.row] viewController:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 221.0f;
}

#pragma Setter and getter

@end
