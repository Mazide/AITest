//
//  CameraModuleFactory.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "CameraModuleFactory.h"
#import "CameraViewController.h"
#import "CameraPresenter.h"
#import "CameraRouter.h"

@implementation CameraModuleFactory

- (UIViewController *)viewControllerWithNavigationViewController:(UINavigationController*)navigationViewController {
    CameraViewController *viewController = [[CameraViewController alloc] initWithNibName:@"CameraViewController" bundle:nil];
    CameraRouter *router = [[CameraRouter alloc] initWithNavigationController:navigationViewController];
    CameraPresenter *presenter = [[CameraPresenter alloc] initWithView:viewController router:router];
    viewController.output = presenter;
    return viewController;
}

@end
