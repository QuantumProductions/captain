//
//  Radio.h
//  Captain
//
//  Created by quantum on 13/11/2016.
//  Copyright © 2016 Quantum Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface Radio : NSObject {
    SystemSoundID offers[23];
    SystemSoundID reasons[16];
    SystemSoundID who[9];
    SystemSoundID forOur;
}

- (void)playMessage;

@end


