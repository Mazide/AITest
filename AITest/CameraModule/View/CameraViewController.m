//
//  CameraViewController.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@property (weak, nonatomic) IBOutlet UIView *previewView;
@property (weak, nonatomic) IBOutlet UIButton *takePhotoButton;

@property (weak, nonatomic) CALayer *previewLayer;

@end

@implementation CameraViewController

#pragma mark - View life cycle

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.output viewDidAppear];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.previewLayer.frame = self.previewView.bounds;
}

- (IBAction)takePhoto:(id)sender {
    [self.output didTapTakePhoto];
}

- (IBAction)takeFromGallery:(id)sender {
    [self.output didTapTakeFromGallery];
}

#pragma mark - CameraViewInput

- (void)setupPreviewLayer:(CALayer *)previewLayer {
    [self.previewView.layer addSublayer:previewLayer];
    previewLayer.frame = self.previewView.bounds;
    self.previewLayer = previewLayer;
}

@end
