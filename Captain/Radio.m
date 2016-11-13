//
//  Radio.m
//  Captain
//
//  Created by quantum on 13/11/2016.
//  Copyright © 2016 Quantum Productions. All rights reserved.
//

#import "Radio.h"

@implementation Radio

- (id)init {
    self = [super init];
    [self setup];
    return self;
}

- (NSURL *)urlFromName:(NSString *)name {
    NSString *path  = [[NSBundle mainBundle] pathForResource:name ofType:@"m4a"];
    if (path) {
        return [NSURL fileURLWithPath:path];
    }
    
    NSString *wavPath = [[NSBundle mainBundle] pathForResource:name ofType:@"wav"];
    return [NSURL fileURLWithPath:wavPath];
}

- (void)setup {
    for (int i = 1; i < 23; i++) {
        NSString *name = [NSString stringWithFormat:@"o%d", i];
        NSURL *pathURL = [self urlFromName:name];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &offers[i]);
    };
    
    for (int i = 1; i < 9; i++) {
        NSString *name = [NSString stringWithFormat:@"w%d", i];
        NSURL *pathURL = [self urlFromName:name];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &who[i]);
    };
    
    for (int i = 1; i < 16; i++) {
        NSString *name = [NSString stringWithFormat:@"r%d", i];
        NSURL *pathURL = [self urlFromName:name];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &reasons[i]);
    };
    
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"for_our" ofType:@"m4a"];
    NSURL *pathURL = [NSURL fileURLWithPath : path];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef) pathURL, &forOur);
}

- (void)playMessage {
    int w = (arc4random() % 9) + 1;
    int o = (arc4random() % 23) + 1;
    int o2 = (arc4random() % 23) + 1;
    int r = (arc4random() % 16) + 1;
    
    AudioServicesPlaySystemSound(who[w]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        AudioServicesPlaySystemSound(offers[o]);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            AudioServicesPlaySystemSound(forOur);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                AudioServicesPlaySystemSound(offers[o2]);
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    AudioServicesPlaySystemSound(reasons[r]);
                });
            });
        });
    });
}

@end
