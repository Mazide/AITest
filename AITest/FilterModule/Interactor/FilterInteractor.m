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
    NSMutableArray<Preview*> *previews = [NSMutableArray<Preview*> new];
    UIImage *previewImage = [self imageWithImage:image scaledToSize:CGSizeMake(70, 70)];
    for (int i=0; i<10; i++) {
        Preview *preview = [[Preview alloc] initWithName:@"filterName" image:previewImage];
        [previews addObject:preview];
    }
    [self.output didReceivePreviews:previews];
//    NSArray<NSString*>* filtersNames = [CIFilter filterNamesInCategory:kCICategoryBuiltIn];
//    NSMutableArray<Preview*> *previews = [NSMutableArray<Preview*> new];
//    for (NSString *name in filtersNames) {
//        @autoreleasepool {
//            CIFilter *filter = [CIFilter filterWithName:name];
//
//            CIContext *context = [[CIContext alloc] initWithOptions:nil];
//            CIImage *ciImage = [[CIImage alloc] initWithImage:image];
//            [filter setDefaults];
//            NSLog(name);
////            [filter setValue:ciImage forKey:kCIInputImageKey];
//
////            CIImage *filteredImageData = [filter valueForKey:kCIInputImageKey];
////            CGImageRef imageRef = [context createCGImage:filteredImageData fromRect:filteredImageData.extent];
////
////            UIImage *filteredImage = [UIImage imageWithCGImage:imageRef scale:image.scale orientation:image.imageOrientation];
////            Preview *preview = [[Preview alloc] initWithName:name image:filteredImage];
////            [previews addObject:preview];
//        }
//    }
//
//    [self.output didReceivePreviews:previews];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
