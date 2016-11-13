//
//  ViewController.h
//  Captain
//
//  Created by quantum on 13/11/2016.
//  Copyright © 2016 Quantum Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Radio.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) Radio *radio;

- (IBAction)captainButtonTapped;

@end

