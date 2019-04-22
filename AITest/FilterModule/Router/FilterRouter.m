//
//  FilterRouter.m
//  AITest
//
//  Created by Nikita Demidov on 23/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterRouter.h"

@interface FilterRouter()

@property (strong, nonatomic) UINavigationController *navigationController;

@end

@implementation FilterRouter

#pragma mark - init

- (instancetype)initWithNavigationController:(UINavigationController*)navigationController {
    self = [super init];
    if (self) {
        _navigationController = navigationController;
    }
    return self;
}

#pragma mark - FilterRouterInput

-(void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showShareExtensionWithImage:(UIImage *)image {
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:@[image] applicationActivities:nil];
    [self.navigationController.topViewController presentViewController:activityController animated:YES completion:nil];
}


@end
