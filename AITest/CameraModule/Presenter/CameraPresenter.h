//
//  CameraPresenter.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CameraProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CameraPresenter : NSObject <CameraViewOutput>

- (instancetype)initWithView:(id<CameraViewInput>)view router:(id<CameraRouterInput>)router;

@end

NS_ASSUME_NONNULL_END
