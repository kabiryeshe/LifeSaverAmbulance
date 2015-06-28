//
//  BaseController.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeElapsedView.h"

@interface BaseController : UIViewController

@property (strong, nonatomic) IBOutlet TimeElapsedView *timeElapsedView;


@end
