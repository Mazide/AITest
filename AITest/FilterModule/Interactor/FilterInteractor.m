//
//  FilterInteractor.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterInteractor.h"

@implementation FilterInteractor

- (void)obtainPreviewsForImage:(UIImage *)image {
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        NSMutableArray<Preview*> *previews = [NSMutableArray<Preview*> new];
        
        CGFloat targetWidth = 70;
        CGFloat targetHeight = image.size.height/(image.size.width/targetWidth);
        UIImage *previewImage = [self imageWithImage:image scaledToSize:CGSizeMake(targetWidth, targetHeight)];

        CIContext *context = [[CIContext alloc] initWithOptions:nil];
        __auto_type filtersNames = @[@"CIPhotoEffectTonal",
                                     @"CIPhotoEffectProcess",
                                     @"CIPhotoEffectNoir",
                                     @"CIPhotoEffectMono",
                                     @"CIColorPosterize",
                                     @"CIColorInvert",
                                     @"CIPixellate",
                                     @"CIMaximumComponent",
                                     @"CIMinimumComponent",
                                     @"CIPhotoEffectTransfer",
                                     @"CISepiaTone",
                                     @"CIVignette"];
        CIImage *ciImage = [[CIImage alloc] initWithImage:previewImage];
        
        for (NSString *filterName in filtersNames) {
            @autoreleasepool {
                CIImage *filteredCIImage = [self filterWithName:filterName forImage:ciImage];
                CGImageRef imageRef = [context createCGImage:filteredCIImage fromRect:filteredCIImage.extent];
                UIImage *filteredImage = [UIImage imageWithCGImage:imageRef scale:previewImage.scale orientation:previewImage.imageOrientation];
                Preview *preview = [[Preview alloc] initWithName:filterName image:filteredImage];
                [previews addObject:preview];
                CGImageRelease(imageRef);
            }
        }

        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output didReceivePreviews:previews];
        });
    });
}

- (void)obtainFilteredImage:(UIImage*)image withFilterName:(NSString *)filterName {
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(concurrentQueue, ^{
        CIImage *ciImage = [[CIImage alloc] initWithImage:image];
        CIImage *filteredCIImage = [self filterWithName:filterName forImage:ciImage];
        CIContext *context = [[CIContext alloc] initWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:filteredCIImage fromRect:filteredCIImage.extent];
        UIImage *filteredImage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
        CGImageRelease(imageRef);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output didReceiveFiltedImage:filteredImage];
        });
    });
}

- (CIImage*)filterWithName:(NSString*)name forImage:(CIImage*)ciImage {
    CIFilter *filter = [CIFilter filterWithName:name];
    [filter setValue:ciImage forKey:kCIInputImageKey];
    CIImage *filteredImageData = [filter outputImage];
    return filteredImageData;
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
