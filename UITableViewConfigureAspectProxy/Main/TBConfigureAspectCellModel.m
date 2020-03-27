//
//  TBConfigureAspectCellModel.m
//  TableViewConfigureAspectProxy
//
//  Created by Hongwei Chen on 2020/3/27.
//  Copyright © 2020 Hongwei Chen. All rights reserved.
//

#import "TBConfigureAspectCellModel.h"

@implementation TBConfigureAspectCellModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.cellClassName = NSStringFromClass([UITableViewCell class]);
        self.cellHeight = 44.0;
    }
    return self;
}

@end
