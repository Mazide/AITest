//
//  CameraRouter.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CameraProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CameraRouter : NSObject <CameraRouterInput>

- (instancetype)initWithNavigationController:(UINavigationController*)navigationController;

@end

NS_ASSUME_NONNULL_END
