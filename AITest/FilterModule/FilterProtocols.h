//
//  FilterProtocols.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Preview.h"

@protocol FilterViewInput <NSObject>

- (void)setupImage:(UIImage*)image;

@end

@protocol FilterViewOutput <NSObject>

- (void)viewDidLoad;

@end

@protocol FilterInteractorInput <NSObject>

- (void)obtainPreviewsForImage:(UIImage*)image;

@end

@protocol FilterInteractorOutput <NSObject>

- (void)didReceivePreviews:(NSArray<Preview*>*)filters;

@end
