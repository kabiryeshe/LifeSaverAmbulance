//
//  TimeElapsedView.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "TimeElapsedView.h"
#import "AccidentCase.h"

@interface TimeElapsedView() {
    
    __weak IBOutlet UILabel *timeElapsedLabel;
}

@end

@implementation TimeElapsedView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self startTimerView];
}

- (void)startTimerView {
    [[NSTimer scheduledTimerWithTimeInterval:30
                                      target:self
                                    selector:@selector(updateTimeElapsed)
                                    userInfo:nil
                                     repeats:YES] fire];
    
}

- (void)updateTimeElapsed {
    timeElapsedLabel.text = [[AccidentCase currentAccidentCase]timeElapsedSinceIncident];
}

@end
