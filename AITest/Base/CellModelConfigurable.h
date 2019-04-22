//
//  CellModelConfigurable.h
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

@protocol CellModel <NSObject>

@property (strong, nonatomic) NSString *cellId;
@property (strong, nonatomic) NSString* modelId;

@end

@protocol CellModelCofigurable <NSObject>

- (void)configureWithModel:(id<CellModel>)model;

@end
