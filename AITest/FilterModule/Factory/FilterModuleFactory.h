//
//  FilterModuleFactory.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilterModuleFactory : NSObject

- (UIViewController*)viewControllerWithImage:(UIImage*)image
                        navigationController:(UINavigationController*)navigationController;
@end

NS_ASSUME_NONNULL_END
