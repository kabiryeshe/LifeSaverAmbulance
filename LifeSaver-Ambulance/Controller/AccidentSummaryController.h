//
//  AccidentSummaryController.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseController.h"

@class AccidentCase;

@interface AccidentSummaryController : BaseController

@property (nonatomic, strong)AccidentCase *accidentCase;

@end
