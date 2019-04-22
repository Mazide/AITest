//
//  FilterInteractor.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterInteractor.h"

@interface FilterInteractor()

@property (weak, nonatomic) id<FilterInteractorOutput> output;

@end

@implementation FilterInteractor

- (instancetype)initWithOutput:(id<FilterInteractorOutput>) output {
    self = [super init];
    if (self) {
        _output = output;
    }
    return self;
}

- (void)obtainPreviewsForImage:(UIImage *)image {
    NSArray<NSString*>* filtersNames = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
    NSMutableArray<Preview*> *previews = [NSMutableArray<Preview*> new];
    for (NSString *name in filtersNames) {
        @autoreleasepool {
            CIFilter *filter = [CIFilter filterWithName:name];
            
            CIContext *context = [[CIContext alloc] initWithOptions:nil];
            CIImage *ciImage = [[CIImage alloc] initWithImage:image];
            [filter setDefaults];
            NSLog(name);
//            [filter setValue:ciImage forKey:kCIInputImageKey];
            
//            CIImage *filteredImageData = [filter valueForKey:kCIInputImageKey];
//            CGImageRef imageRef = [context createCGImage:filteredImageData fromRect:filteredImageData.extent];
//
//            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
//            Preview *preview = [[Preview alloc] initWithName:name image:filteredImage];
//            [previews addObject:preview];
        }
    }

    [self.output didReceivePreviews:previews];
}

@end
