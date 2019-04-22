//
//  PreviewCellModel.m
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "PreviewCellModel.h"

@implementation PreviewCellModel

@synthesize cellId;
@synthesize modelId;

- (instancetype)initWithCellId:(NSString *)cellId modelId:(NSUInteger)modelId previewImage:(UIImage *)image {
    self = [super init];
    if (self) {
        self.cellId = cellId;
        self.modelId = modelId;
        self.preview = image;
    }
    return self;
}

@end
