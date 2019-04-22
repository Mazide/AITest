//
//  PreviewCell.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "PreviewCell.h"
#import "PreviewCellModel.h"

@implementation PreviewCell

-(void)layoutSubviews {
    [super layoutSubviews];
    self.previewImageView.layer.cornerRadius = 4.0;
    self.previewImageView.clipsToBounds = YES;
}

#pragma mark - CellModelCofigurable

- (void)configureWithModel:(id<CellModel>)model {
    if (![model isKindOfClass:[PreviewCellModel class]]) {
        return;
    }
    
    PreviewCellModel *previewCellModel = (PreviewCellModel*)model;
    self.previewImageView.image = previewCellModel.preview;
}

@end
