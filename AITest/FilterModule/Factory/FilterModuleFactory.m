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

@implementation FilterModuleFactory

- (UIViewController*)viewControllerWithImage:(UIImage*)image {
    FilterViewController *viewController = [FilterViewController new];
    FilterInteractor *interactor = [FilterInteractor new];
    FilterPreseter *presenter = [[FilterPreseter alloc] initWithView:viewController image:image interactor:interactor];
    viewController.output = presenter;
    interactor.output = presenter;
    return viewController;
}

@end
