//
//  FilterProtocols.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Preview.h"
#import "PreviewCellModel.h"

@protocol FilterViewInput <NSObject>

- (void)displayImage:(UIImage*)image;
- (void)displayPreviews:(NSArray<PreviewCellModel*>*)previewsCellsModels;

@end

@protocol FilterViewOutput <NSObject>

- (void)viewDidLoad;
- (void)didSelectPreview:(PreviewCellModel*)model;
- (void)didTapShare;
- (void)didTapBack;

@end

@protocol FilterInteractorInput <NSObject>

- (void)obtainPreviewsForImage:(UIImage*)image;
- (void)obtainFilteredImage:(UIImage*)image withFilterName:(NSString *)filterName;

@end

@protocol FilterInteractorOutput <NSObject>

- (void)didReceivePreviews:(NSArray<Preview*>*)filters;
- (void)didReceiveFiltedImage:(UIImage*)image;

@end

@protocol FilterRouterInput <NSObject>

- (void)back;
- (void)showShareExtensionWithImage:(UIImage*)image;

@end
