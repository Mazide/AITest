//
//  FilterInteractor.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterInteractor.h"

@interface FilterInteractor()

@property (strong, nonatomic) NSOperationQueue *filterQueue;

@end

@implementation FilterInteractor

-(NSOperationQueue *)filterQueue {
    if (!_filterQueue) {
        _filterQueue = [[NSOperationQueue alloc] init];
    }
    return _filterQueue;
}

- (void)obtainPreviewsForImage:(UIImage *)image withTargetWidth:(CGFloat)targetWidth {
    [self.filterQueue cancelAllOperations];
    __block NSMutableArray<Preview*> *previews = [NSMutableArray<Preview*> new];
    __weak typeof(self) weakSelf = self;
    NSOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        CGFloat targetHeight = image.size.height/(image.size.width/targetWidth);
        UIImage *previewImage = [weakSelf imageWithImage:image scaledToSize:CGSizeMake(targetWidth, targetHeight)];
        
        CIContext *context = [[CIContext alloc] initWithOptions:nil];
        __auto_type filtersNames = [weakSelf filtersNames];
        CIImage *ciImage = [[CIImage alloc] initWithImage:previewImage];
        
        for (NSString *filterName in filtersNames) {
            @autoreleasepool {
                CIImage *filteredCIImage = [weakSelf filterWithName:filterName forImage:ciImage];
                CGImageRef imageRef = [context createCGImage:filteredCIImage fromRect:filteredCIImage.extent];
                UIImage *filteredImage = [UIImage imageWithCGImage:imageRef scale:previewImage.scale orientation:previewImage.imageOrientation];
                Preview *preview = [[Preview alloc] initWithName:filterName image:filteredImage];
                [previews addObject:preview];
                CGImageRelease(imageRef);
            }
        }
    }];
    NSOperation *completionOperation = [NSBlockOperation blockOperationWithBlock:^{
        [self.output didReceivePreviews:previews];
    }];
    [completionOperation addDependency:blockOperation];
    
    [[NSOperationQueue currentQueue] addOperation:completionOperation];
    [self.filterQueue addOperation:blockOperation];
}

- (void)obtainFilteredImage:(UIImage*)image withFilterName:(NSString *)filterName {
    [self.filterQueue cancelAllOperations];
    __block UIImage *filteredImage = nil;
    __weak typeof(self) weakSelf = self;
    NSOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        CIImage *ciImage = [[CIImage alloc] initWithImage:image];
        CIImage *filteredCIImage = [weakSelf filterWithName:filterName forImage:ciImage];
        CIContext *context = [[CIContext alloc] initWithOptions:nil];
        CGImageRef imageRef = [context createCGImage:filteredCIImage fromRect:filteredCIImage.extent];
        filteredImage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
        CGImageRelease(imageRef);
    }];
    NSOperation *completionOperation = [NSBlockOperation blockOperationWithBlock:^{
        [weakSelf.output didReceiveFiltedImage:filteredImage];
    }];
    [completionOperation addDependency:blockOperation];
    
    [[NSOperationQueue currentQueue] addOperation:completionOperation];
    [self.filterQueue addOperation:blockOperation];
}

- (NSArray<NSString*>*)filtersNames {
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
    return filtersNames;
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
