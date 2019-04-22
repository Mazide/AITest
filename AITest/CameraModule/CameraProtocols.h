//
//  CameraProtocols.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CameraViewInput <NSObject>

- (void)setupPreviewLayer:(CALayer*)previewLayer;

@end

@protocol CameraViewOutput <NSObject>

- (void)viewDidAppear;
- (void)didTapTakePhoto;
- (void)didTapTakeFromGallery;

@end

@protocol CameraRouterInput <NSObject>

- (void)openFilterViewWithImage:(UIImage*)image;
- (void)openImagePickerWithDelegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate;
@end

