//
//  CollectionViewDataSource.m
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "CollectionViewDataSource.h"

@interface CollectionViewDataSource()

@property (strong, nonatomic) NSArray<id<CellModel>> *cellModels;

@end

@implementation CollectionViewDataSource

-(instancetype)initWithCellModels:(NSArray<id<CellModel>>*)cellModels {
    self = [super init];
    if (self) {
        _cellModels = cellModels;
    }
    return self;
}

- (id<CellModel>)modelForIndexPath:(NSIndexPath*)indexPath {
    __auto_type cellModel = self.cellModels[indexPath.row];
    return cellModel;
}

#pragma mark - UICollectionViewDataSource

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    __auto_type cellModel = [self modelForIndexPath:indexPath];
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
