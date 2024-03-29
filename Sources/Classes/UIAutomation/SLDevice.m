//
//  SLDevice.m
//  Subliminal
//
//  For details and documentation:
//  http://github.com/inkling/Subliminal
//
//  Copyright 2013 Inkling Systems, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "SLDevice.h"

#import "SLTerminal.h"


@implementation SLDevice

+ (SLDevice *)currentDevice {
    static SLDevice *device;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        device = [[SLDevice alloc] init];
    });
    return device;
}

- (void)deactivateAppForDuration:(NSTimeInterval)duration {
    [[SLTerminal sharedTerminal] evalWithFormat:@"UIATarget.localTarget().deactivateAppForDuration(%g)", duration];
}

@end
