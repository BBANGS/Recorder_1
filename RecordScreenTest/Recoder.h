//
//  Recoder.h
//  RecordScreenTest
//
//  Created by HCJEONG-MAC on 30/01/2019.
//  Copyright © 2019 RSUPPORT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <AVKit/AVKit.h>


@interface Recoder : NSObject

@property AVCaptureScreenInput *screenInput;
@property AVCaptureSession *captureSession;
@property AVCaptureMovieFileOutput *captureOutput;
@property AVCaptureInput *captureInput;
@property AVCaptureDevice *captureDevice;
@property AVCaptureDeviceInput *captureDeviceInput;

- (void)startRecord;
- (void)stopRecord;

@end
