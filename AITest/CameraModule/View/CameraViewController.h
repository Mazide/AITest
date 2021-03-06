//
//  CameraViewController.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface CameraViewController : UIViewController <CameraViewInput>

@property (strong, nonatomic) id<CameraViewOutput> output;

@end

NS_ASSUME_NONNULL_END
