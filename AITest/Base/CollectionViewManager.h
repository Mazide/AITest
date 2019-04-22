//
//  CollectionViewManager.h
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModelConfigurable.h"

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewManager : NSObject <UICollectionViewDataSource>

- (instancetype)initWithCellModels:(NSArray<id<CellModel>>*)cellModels;

@end

NS_ASSUME_NONNULL_END
