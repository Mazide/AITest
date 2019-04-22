//
//  FilterPreseter.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterProtocols.h"
#import "FilterRouter.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterPreseter : NSObject <FilterViewOutput, FilterInteractorOutput>

- (instancetype)initWithView:(id<FilterViewInput>)view
                       image:(UIImage*)image
                  interactor:(id<FilterInteractorInput>)interactor
                      router: (id<FilterRouterInput>)router;

@end

NS_ASSUME_NONNULL_END
