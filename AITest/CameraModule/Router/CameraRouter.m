//
//  CameraRouter.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraRouter.h"
#import "FilterModuleFactory.h"

@interface CameraRouter()

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation CameraRouter

#pragma mark - init

- (instancetype)initWithNavigationController:(UINavigationController*)navigationController {
    self = [super init];
    if (self) {
        _navigationController = navigationController;
    }
    return self;
}

#pragma mark - CameraRouterInput

- (void)openFilterViewWithImage:(UIImage*)image {
    FilterModuleFactory *filterModuleFactory = [FilterModuleFactory new];
    UIViewController *filterViewContoller = [filterModuleFactory viewControllerWithImage:image navigationController:self.navigationController];
    [self.navigationController pushViewController:filterViewContoller animated:YES];
}

-(void)openImagePickerWithDelegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>) delegate {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = delegate;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    imagePicker.allowsEditing = NO;
    [self.navigationController.viewControllers.lastObject presentViewController:imagePicker animated:YES completion:nil];
}

@end
