//
//  AppDelegate.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "AppDelegate.h"
#import "CameraViewController.h"
#import "CameraModuleFactory.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    CGRect windowFrame = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: windowFrame];
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    [navigationController setNavigationBarHidden:YES];
    CameraModuleFactory *factory = [CameraModuleFactory new];
    UIViewController *cameraViewController = [factory viewControllerWithNavigationViewController:navigationController];
    [navigationController setViewControllers:@[cameraViewController]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
