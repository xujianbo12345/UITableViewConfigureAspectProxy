# UITableViewConfigureAspectProxy
使用Model处理UITableViewDataSource、UITableViewDelegate，方便于如果UITableView每个Cell都是不一样的样式，并且有不一样的处理，不需要编写繁琐并且不易阅读的if else，而且每一个Cell对应一个Model，你可以在Block中单独处理，增加代码阅读行以及保证代码长期可维护的处理。


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
