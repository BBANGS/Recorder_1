//
//  AppDelegate.m
//  RecordScreenTest
//
//  Created by HCJEONG-MAC on 30/01/2019.
//  Copyright © 2019 RSUPPORT. All rights reserved.
//

#import "AppDelegate.h"
#import "Recoder.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property Recoder *record;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _record = [[Recoder alloc] init];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (IBAction)startRecord:(NSButton *)sender {
    [_record startRecord];
}

- (IBAction)stopRecord:(NSButton *)sender {
    [_record stopRecord];
}

@end
