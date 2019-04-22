//
//  FilterPreseter.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterPreseter.h"
#import "FilterProtocols.h"

NSString *const NoneFilterName = @"None";

@interface FilterPreseter() 

@property (weak, nonatomic) id<FilterViewInput> view;
@property (strong, nonatomic) id<FilterInteractorInput> interactor;
@property (strong, nonatomic) id<FilterRouterInput> router;

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UIImage *filteredImage;

@end

@implementation FilterPreseter

#pragma mark - init

- (instancetype)initWithView:(id<FilterViewInput>)view
                       image:(UIImage*)image
                  interactor:(id<FilterInteractorInput>)interactor
                      router:(id<FilterRouterInput>)router {
    self = [super init];
    if (self) {
        _view = view;
        _image = image;
        _interactor = interactor;
        _router = router;
    }
    return self;
}

#pragma mark - FilterViewOutput

- (void)viewDidLoad {
    [self.interactor obtainPreviewsForImage:self.image];
    [self.view displayImage:self.image];
}

- (void)didSelectPreview:(PreviewCellModel *)model {
    if ([model.modelId isEqualToString:NoneFilterName]) {
        [self.view displayImage:self.image];
        return;
    }
    [self.interactor obtainFilteredImage:self.image withFilterName:model.modelId];
}

- (void)didTapBack {
    [self.router back];
}


- (void)didTapShare {
    [self.router showShareExtensionWithImage:self.filteredImage];
}


#pragma mark - FilterInteractorOutput

- (void)didReceivePreviews:(NSArray<Preview *> *)previews {
    __auto_type cellModels = [NSMutableArray<PreviewCellModel*> new];
    __auto_type cellId = @"PreviewCell";
    __auto_type noneCellModel = [[PreviewCellModel alloc] initWithCellId:cellId
                                                                 modelId:NoneFilterName
                                                            previewImage:self.image];
    [cellModels addObject:noneCellModel];
    for (Preview *preview in previews) {
        __auto_type cellModel = [[PreviewCellModel alloc] initWithCellId:cellId
                                                                 modelId:preview.name
                                                            previewImage:preview.image];
        [cellModels addObject:cellModel];
    }
    
    [self.view displayPreviews:cellModels];
}

- (void)didReceiveFiltedImage:(UIImage *)image {
    self.filteredImage = image;
    [self.view displayImage:image];
}


@end
