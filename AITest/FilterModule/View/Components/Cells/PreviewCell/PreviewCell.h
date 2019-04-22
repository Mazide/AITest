//
//  PreviewCell.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellModelConfigurable.h"

NS_ASSUME_NONNULL_BEGIN

@interface PreviewCell : UICollectionViewCell <CellModelCofigurable>

@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;

@end

NS_ASSUME_NONNULL_END
