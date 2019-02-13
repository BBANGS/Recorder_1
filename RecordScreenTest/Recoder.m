//
//  Recoder.m
//  RecordScreenTest
//
//  Created by HCJEONG-MAC on 30/01/2019.
//  Copyright © 2019 RSUPPORT. All rights reserved.
//

#import "Recoder.h"

@implementation Recoder

- (instancetype)init
{
    self = [super init];
    if (self) {
        _captureSession = [[AVCaptureSession alloc] init];
        
        _screenInput = [[AVCaptureScreenInput alloc] initWithDisplayID:CGMainDisplayID()];
        CGDirectDisplayID displays[3];
        uint32 tmp;
        CGGetActiveDisplayList(3, displays, &tmp);
        AVCaptureScreenInput *s2 = [[AVCaptureScreenInput alloc] initWithDisplayID:displays[1]];
        [_screenInput setCapturesCursor:YES];
        _captureOutput = [[AVCaptureMovieFileOutput alloc] init];
//        _captureInput = [[AVCaptureInput alloc] init];
        NSError *err = nil;
        NSLog(@"%@ %@", [AVCaptureDevice devices], [[AVCaptureDevice devices] objectAtIndex:1]);
        AVCaptureDevice *audioDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
        [audioDevice unlockForConfiguration];
        AVCaptureDeviceInput *audioInput = [[AVCaptureDeviceInput alloc] initWithDevice:audioDevice error:&err];
        
        NSLog(@"input ; %@ ,device : %@, %@, %li", [audioInput device], audioDevice, audioInput, [err code]);
//        _captureDevice = [AVCaptureDevice alloc]
//        _captureDeviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio] error:nil];
        
//        AVCaptureConnection *connect = [[AVCaptureConnection alloc]initWithInputPort:_captureDeviceInput.ports[0] videoPreviewLayer:self];
//        [_captureSession addConnection:connect];
        
        if([_captureSession canAddInput:_screenInput]) {
            NSLog(@"YES main");
            [_captureSession addInput:_screenInput];
        }
        
        if([_captureSession canAddInput:s2]) {
            NSLog(@"YES S2");
            [_captureSession addInput:s2];
        }
        if([_captureSession canAddInput:audioInput]) {
            NSLog(@"YES AUDIO");
            [_captureSession addInput:audioInput];
        }
        if([_captureSession canAddOutput:_captureOutput]) {
            NSLog(@"YES");
        }
        else {
            NSLog(@"NO");
        }
        
        
       
        [_captureSession addOutput:_captureOutput];
        
//        [_captureSession addOutput:_capureDataOutput];
    }
    return self;
}

- (void)startRecord {
    [_captureSession startRunning];
    NSURL *url = [NSURL fileURLWithPath:@"/Volumes/DISK_PARTITION/test.mp4"];
    [_captureOutput startRecordingToOutputFileURL:url recordingDelegate:self];
}

- (void)stopRecord {
    [_captureOutput stopRecording];
    [_captureSession stopRunning];
}

@end
