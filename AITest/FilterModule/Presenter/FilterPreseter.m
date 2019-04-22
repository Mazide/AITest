//
//  FilterPreseter.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterPreseter.h"
#import "FilterProtocols.h"

@interface FilterPreseter() 

@property (weak, nonatomic) id<FilterViewInput> view;
@property (strong, nonatomic) id<FilterInteractorInput> interactor;

@property (strong, nonatomic) UIImage *image;

@end

@implementation FilterPreseter

#pragma mark - init

- (instancetype)initWithView:(id<FilterViewInput>)view image:(UIImage*)image interactor:(id<FilterInteractorInput>)interactor {
    self = [super init];
    if (self) {
        _view = view;
        _image = image;
        _interactor = interactor;
    }
    return self;
}

#pragma mark - FilterViewOutput

- (void)viewDidLoad {
    [self.interactor obtainPreviewsForImage:self.image];
    [self.view setupImage:self.image];
}

#pragma mark - FilterInteractorOutput

- (void)didReceivePreviews:(NSArray<Preview *> *)previews {
    __auto_type cellModels = [NSMutableArray<PreviewCellModel*> new];
    for (Preview *preview in previews) {
        __auto_type cellModel = [[PreviewCellModel alloc] initWithCellId:@"PreviewCell"
                                                                 modelId:[preview.name hash]
                                                            previewImage:preview.image];
        [cellModels addObject:cellModel];
    }
    [self.view displayPreviews:cellModels];
}

@end
