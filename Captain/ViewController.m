//
//  ViewController.m
//  Captain
//
//  Created by quantum on 13/11/2016.
//  Copyright © 2016 Quantum Productions. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.radio = [[Radio alloc] init];
}

- (IBAction)captainButtonTapped {
    [self.radio playMessage];
}

@end
