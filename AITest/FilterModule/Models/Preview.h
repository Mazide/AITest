//
//  Preview.h
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Preview : NSObject

@property (strong, readonly, nonatomic) NSString *name;
@property (strong, readonly, nonatomic) UIImage *image;

-(instancetype)initWithName:(NSString*)name image:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
