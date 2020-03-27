//
//  TBConfigureAspectProxy.m
//  TableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import "TBConfigureAspectProxy.h"

@implementation TBConfigureAspectProxy

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numberOfSectionsBlock) {
        return self.numberOfSectionsBlock(tableView);
    }
    if (self.numberOfRowsInSection != nil) {
        return 1;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.numberOfRowsInSection) {
        return self.numberOfRowsInSection(tableView, section);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TBConfigureAspectCellModel *cellModel = [self cellModelAsTableView:tableView atIndexPath:indexPath];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.cellClassName forIndexPath:indexPath];
    if (cellModel.configureModelForCellBlock) {
        cellModel.configureModelForCellBlock(cellModel, cell, indexPath);
    }
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.headerModelAtIndexPathBlock == nil) {
        return nil;
    }
    TBConfigureAspectHeaderFooterModel *headerModel = self.headerModelAtIndexPathBlock(tableView, section);
    if (headerModel == nil) {
        return nil;
    }
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerModel.headerFooterViewName];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.headerModelAtIndexPathBlock == nil) {
        return 0.0;
    }
    TBConfigureAspectHeaderFooterModel *footerModel = self.headerModelAtIndexPathBlock(tableView, section);
    return footerModel.headerFooterHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.footerModelAtIndexPathBlock == nil) {
        return nil;
    }
    TBConfigureAspectHeaderFooterModel *footerModel = self.footerModelAtIndexPathBlock(tableView, section);
    if (footerModel == nil) {
        return nil;
    }
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:footerModel.headerFooterViewName];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (self.footerModelAtIndexPathBlock == nil) {
        return 0.0;
    }
    TBConfigureAspectHeaderFooterModel *footerModel = self.footerModelAtIndexPathBlock(tableView, section);
    return footerModel.headerFooterHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TBConfigureAspectCellModel *cellModel = [self cellModelAsTableView:tableView atIndexPath:indexPath];
    if (cellModel.cellHeightConfigureBlock) {
        return cellModel.cellHeightConfigureBlock(cellModel, indexPath);
    }
    return cellModel.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TBConfigureAspectCellModel *cellModel = [self cellModelAsTableView:tableView atIndexPath:indexPath];
    if (cellModel.didSelectAtCellBlock) {
        cellModel.didSelectAtCellBlock(cellModel, indexPath);
    }
}

- (TBConfigureAspectCellModel *)cellModelAsTableView:(UITableView *)tableView atIndexPath:(NSIndexPath *)indexPath {
    TBConfigureAspectCellModel *cellModel = nil;
    if (self.cellModelAtIndexPathBlock) {
        cellModel = self.cellModelAtIndexPathBlock(tableView, indexPath);
    }
    return cellModel;
}

@end
