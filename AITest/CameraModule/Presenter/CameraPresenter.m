//
//  CameraPresenter.m
//  AITest
//
//  Created by Nikita Demidov on 21/04/2019.
//  Copyright © 2019 Nikita Demidov. All rights reserved.
//

#import "CameraPresenter.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraPresenter() <AVCapturePhotoCaptureDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) id<CameraViewInput> view;
@property (strong, nonatomic) id<CameraRouterInput> router;

@property (strong, nonatomic) AVCaptureSession *capturesSession;
@property (strong, nonatomic) AVCapturePhotoOutput *stillImageOutput;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *videoPreviewLayer;

@end

@implementation CameraPresenter

#pragma mark - init

- (instancetype)initWithView:(id<CameraViewInput>)view router:(id<CameraRouterInput>)router {
    self = [super init];
    if (self) {
        _view = view;
        _router = router;
    }
    return self;
}

#pragma mark - CameraViewOutput

- (void)viewDidAppear {
    [self setupCaptureSession];
}

- (void)didTapTakePhoto {
    AVCapturePhotoSettings *settings = [AVCapturePhotoSettings photoSettingsWithFormat:@{AVVideoCodecKey: AVVideoCodecTypeJPEG}];
    [self.stillImageOutput capturePhotoWithSettings:settings delegate:self];
}

- (void)didTapTakeFromGallery {
    [self.router openImagePickerWithDelegate:self];
}

#pragma mark - AVCaptureSession setup

- (void)setupCaptureSession {
    self.capturesSession = [AVCaptureSession new];
    self.capturesSession.sessionPreset = AVCaptureSessionPresetPhoto;
    
    AVCaptureDevice *backCamera = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!backCamera) {
        NSLog(@"Unable to access back camera!");
        return;
    }
    
    NSError *error;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera
                                                                        error:&error];
    if (error) {
        NSLog(@"Error Unable to initialize back camera: %@", error.localizedDescription);
        return;
    }
    
    self.stillImageOutput = [AVCapturePhotoOutput new];
    
    BOOL isCanAddInput = [self.capturesSession canAddInput:input];
    BOOL isCanAddOutput = [self.capturesSession canAddOutput:self.stillImageOutput];
    if (!isCanAddInput) {
        NSLog(@"Can't add input");
        return;
    }
    
    if (!isCanAddOutput) {
        NSLog(@"Can't add output");
        return;
    }
    
    [self.capturesSession addInput:input];
    [self.capturesSession addOutput:self.stillImageOutput];
    [self setupLivePreview];
}

- (void)setupLivePreview {
    self.videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:self.capturesSession];
    if (!self.videoPreviewLayer) {
        NSLog(@"Error Unable to initialize videoPreviewLayer");
        return;
    }
    
    self.videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    self.videoPreviewLayer.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
    [self.view setupPreviewLayer:self.videoPreviewLayer];
    
    dispatch_queue_t globalQueue =  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_async(globalQueue, ^{
        [self.capturesSession startRunning];
    });
}

#pragma mark - AVCapturePhotoCaptureDelegate

- (void)captureOutput:(AVCapturePhotoOutput *)output didFinishProcessingPhoto:(AVCapturePhoto *)photo error:(nullable NSError *)error {
    NSData *imageData = photo.fileDataRepresentation;
    if (imageData) {
        UIImage *image = [UIImage imageWithData:imageData];
        [self.router openFilterViewWithImage:image];
    }
}

#pragma mark - UINavigationControllerDelegate, UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.router openFilterViewWithImage:image];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
