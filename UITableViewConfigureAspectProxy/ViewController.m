//
//  ViewController.m
//  UITableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import "ViewController.h"
#import "TBConfigureAspectProxy.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *configureModels;
@property (strong, nonatomic) TBConfigureAspectProxy *proxy;
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    TBConfigureAspectCellModel *cm1 = [[TBConfigureAspectCellModel alloc] init];
    cm1.cellHeightConfigureBlock = ^CGFloat(TBConfigureAspectCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        return 80;
    };
    cm1.configureModelForCellBlock = ^(TBConfigureAspectCellModel * _Nonnull cellModel, __kindof UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        cell.textLabel.text = @"第一个cell";
        cell.contentView.backgroundColor = [UIColor redColor];
    };
    cm1.didSelectAtCellBlock = ^(TBConfigureAspectCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"点击了第一个" message:@"click" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:action];
        [weakSelf presentViewController:alertController animated:YES completion:NULL];
    };
    
    TBConfigureAspectCellModel *cm2 = [[TBConfigureAspectCellModel alloc] init];
    cm2.cellHeightConfigureBlock = ^CGFloat(TBConfigureAspectCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        return 40;
    };
    cm2.configureModelForCellBlock = ^(TBConfigureAspectCellModel * _Nonnull cellModel, __kindof UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        cell.textLabel.text = @"第二个cell";
        cell.contentView.backgroundColor = [UIColor yellowColor];
    };
    
    TBConfigureAspectCellModel *cm3 = [[TBConfigureAspectCellModel alloc] init];
    cm3.cellHeightConfigureBlock = ^CGFloat(TBConfigureAspectCellModel * _Nonnull cellModel, NSIndexPath * _Nonnull indexPath) {
        return 60;
    };
    cm3.configureModelForCellBlock = ^(TBConfigureAspectCellModel * _Nonnull cellModel, __kindof UITableViewCell * _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        cell.textLabel.text = @"第三个cell";
        cell.contentView.backgroundColor = [UIColor blueColor];
    };
    
    _configureModels = @[
        cm1, cm2, cm3
    ];
    
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self.proxy;
        _tableView.delegate = self.proxy;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
}

- (TBConfigureAspectProxy *)proxy {
    if (!_proxy) {
        _proxy = [[TBConfigureAspectProxy alloc] init];
        __weak typeof(self)weakSelf = self;
        _proxy.numberOfRowsInSection = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
            return weakSelf.configureModels.count;
        };
        _proxy.cellModelAtIndexPathBlock = ^TBConfigureAspectCellModel * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            return weakSelf.configureModels[indexPath.row];
        };
    }
    return _proxy;
}

@end
