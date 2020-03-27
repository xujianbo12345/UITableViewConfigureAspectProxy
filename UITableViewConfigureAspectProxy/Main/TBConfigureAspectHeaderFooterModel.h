//
//  TBConfigureAspectHeaderFooterModel.h
//  TableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBConfigureAspectHeaderFooterModel : NSObject

/// UITableViewHeaderFooterView Name, Default is UITableViewHeaderFooterView
@property (copy, nonatomic) NSString *headerFooterViewName;

/// UITableViewHeaderFooter Height, Default is zero
@property (assign, nonatomic) CGFloat headerFooterHeight;

/// 配置每一个UITableViewHeaderFooterView
@property (copy, nonatomic) void (^configureModelForHeaderFooterBlock)(TBConfigureAspectHeaderFooterModel *headerFooterModel, __kindof UITableViewHeaderFooterView *headerFooterView, NSInteger section);

/// 配置UITableViewHeaderFooterView高度
@property (copy, nonatomic) CGFloat (^headerFooterHeightConfigureBlock)(TBConfigureAspectHeaderFooterModel *headerFooterModel,  NSInteger section);

@end

NS_ASSUME_NONNULL_END
