//
//  TBConfigureAspectProxy.h
//  TableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TBConfigureAspectCellModel.h"
#import "TBConfigureAspectHeaderFooterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBConfigureAspectProxy : NSObject <UITableViewDataSource, UITableViewDelegate>

/// 获取section数量
@property (copy, nonatomic) NSInteger (^numberOfSectionsBlock)(UITableView *tableView);

/// 获取每个section下row的数量
@property (copy, nonatomic) NSInteger (^numberOfRowsInSection)(UITableView *tableView, NSInteger section);

/// 获取对应IndexPath的CellModel
@property (copy, nonatomic) TBConfigureAspectCellModel * (^cellModelAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

/// 获取TableViewHeaderView对应的数据Model
@property (copy, nonatomic) TBConfigureAspectHeaderFooterModel * (^headerModelAtIndexPathBlock)(UITableView *tableView, NSInteger section);

/// 获取TableViewFooterView对应的数据Model
@property (copy, nonatomic) TBConfigureAspectHeaderFooterModel * (^footerModelAtIndexPathBlock)(UITableView *tableView, NSInteger section);

@end

NS_ASSUME_NONNULL_END
