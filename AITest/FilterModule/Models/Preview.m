//
//  Preview.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "Preview.h"

@implementation Preview

-(instancetype)initWithName:(NSString *)name image:(UIImage *)image {
    self = [super init];
    if (self) {
        _name = name;
        _image = image;
    }
    return self;
}

@end
