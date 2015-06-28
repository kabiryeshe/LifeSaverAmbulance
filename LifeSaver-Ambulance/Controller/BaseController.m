//
//  BaseController.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "BaseController.h"
#import "TimeElapsedView.h"

@interface BaseController ()

@end

@implementation BaseController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSBundle mainBundle]loadNibNamed:@"TimeElapsedView"
                                 owner:self
                               options:nil];
    
}


@end
