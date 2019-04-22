//
//  FilterModuleFactory.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterModuleFactory.h"
#import "FilterViewController.h"
#import "FilterPreseter.h"
#import "FilterInteractor.h"
#import "FilterRouter.h"

@implementation FilterModuleFactory

- (UIViewController*)viewControllerWithImage:(UIImage*)image
                        navigationController:(UINavigationController*)navigationController {
    FilterViewController *viewController = [FilterViewController new];
    FilterInteractor *interactor = [FilterInteractor new];
    FilterRouter *router = [[FilterRouter alloc] initWithNavigationController:navigationController];
    FilterPreseter *presenter = [[FilterPreseter alloc] initWithView:viewController image:image interactor:interactor router:router];
    viewController.output = presenter;
    interactor.output = presenter;
    return viewController;
}

@end
