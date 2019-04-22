//
//  CollectionViewManager.m
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "CollectionViewManager.h"

@interface CollectionViewManager()

@property (strong, nonatomic) NSArray<id<CellModel>> *cellModels;

@end

@implementation CollectionViewManager

-(instancetype)initWithCellModels:(NSArray<id<CellModel>>*)cellModels {
    self = [super init];
    if (self) {
        _cellModels = cellModels;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    __auto_type cellModel = self.cellModels[indexPath.row];
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellModel.cellId forIndexPath:indexPath];
    if ([cell conformsToProtocol:@protocol(CellModelCofigurable)]) {
        __auto_type configurableCell = (id<CellModelCofigurable>)cell;
        [configurableCell configureWithModel:cellModel];
    }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cellModels.count;
}

@end
