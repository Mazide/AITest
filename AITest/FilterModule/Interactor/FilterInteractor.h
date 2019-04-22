//
//  FilterInteractor.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilterProtocols.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilterInteractor : NSObject <FilterInteractorInput>

@property (weak, nonatomic) id<FilterInteractorOutput> output;

@end

NS_ASSUME_NONNULL_END
