//
//  CameraModuleFactory.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CameraModuleFactory : NSObject

- (UIViewController *)viewControllerWithNavigationViewController:(UINavigationController*)navigationViewController;

@end

NS_ASSUME_NONNULL_END
