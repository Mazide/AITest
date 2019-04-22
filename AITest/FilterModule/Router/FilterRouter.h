//
//  FilterRouter.h
//  AITest
//
//  Created by Nikita Demidov on 23/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilterProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterRouter : NSObject <FilterRouterInput>

- (instancetype)initWithNavigationController:(UINavigationController*)navigationController;

@end

NS_ASSUME_NONNULL_END
