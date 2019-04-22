//
//  FilterViewController.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "FilterViewController.h"

@interface FilterViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FilterViewController

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output viewDidLoad];
}

#pragma mark - FilterViewInput

- (void)setupImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
