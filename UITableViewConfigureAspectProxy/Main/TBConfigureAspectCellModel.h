//
//  TBConfigureAspectCellModel.h
//  TableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBConfigureAspectCellModel : NSObject

/// className for cell, default className is UITableViewCell
@property (copy, nonatomic) NSString *cellClassName;

/// Height for cell, default 44
@property (assign, nonatomic) CGFloat cellHeight;

/// 配置每一个Cell
@property (copy, nonatomic) void (^configureModelForCellBlock)(TBConfigureAspectCellModel *cellModel, __kindof UITableViewCell *cell, NSIndexPath *indexPath);

/// 配置Cell高度
@property (copy, nonatomic) CGFloat (^cellHeightConfigureBlock)(TBConfigureAspectCellModel *cellModel,  NSIndexPath *indexPath);

/// Cell点击方法进行回调 无此方法默认使用cellHeight
@property (copy, nonatomic) void (^didSelectAtCellBlock)(TBConfigureAspectCellModel *cellModel,  NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
