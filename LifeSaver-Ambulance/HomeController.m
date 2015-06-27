//
//  ViewController.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "HomeController.h"
#import "AccidentCase.h"
#import "LSConstants.h"

@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(accidentHappened:)
                                                name:AccidentCaseReceivedNotification
                                              object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)accidentHappened:(NSNotification *)notification {
    
    [self performSegueWithIdentifier:@"AccidentDetails" sender:self];
    
    
}

@end
