//
//  PreviewCellModel.h
//  AITest
//
//  Created by Nikita Demidov on 22/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModelConfigurable.h"

NS_ASSUME_NONNULL_BEGIN

@interface PreviewCellModel : NSObject <CellModel>

@property (strong, nonatomic) UIImage *preview;

- (instancetype)initWithCellId:(NSString*)cellId modelId:(NSUInteger)modelId previewImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
