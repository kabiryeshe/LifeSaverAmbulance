//
//  AccidentCase.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "AccidentCase.h"
#import <DateTools/DateTools.h>

static AccidentCase *_accidentCase;

@implementation AccidentCase

+ (instancetype)caseFromDictionary:(NSDictionary *)dictionary {

    AccidentCase *accidentCase = [[AccidentCase alloc]init];
    accidentCase.location = [Location locationFromDictionary:dictionary[@"location"]];
    accidentCase.timeOfAccident = [NSDate dateWithTimeIntervalSinceNow: -70];  // dictionary[@"time_of_occurrence"];
    NSMutableArray *victims = [[NSMutableArray alloc]init];
    for(NSDictionary *victimDictionary in dictionary[@"victims"]) {
        
        Victim *victim = [Victim victimFromDictionary:victimDictionary];
        [victims addObject:victim];
        
    }
    accidentCase.victims = victims;
    return accidentCase;
}

+ (AccidentCase *)currentAccidentCase {
    return _accidentCase;
}

+ (void)setCurrentAccidentCase : (AccidentCase *)accidentCase {
    
    _accidentCase = accidentCase;
}

- (NSString *)timeElapsedSinceIncident {
    
    NSInteger minutesElapsed = (NSInteger)  [self.timeOfAccident minutesAgo];
    NSInteger hours = (minutesElapsed / 60);
    NSInteger mins =  (minutesElapsed % 60);
    NSString *hoursString = (hours > 0) ? [NSString stringWithFormat:@"%@ hour ", @(hours)] : @"";
    NSString *minutesString = (mins > 0) ? [NSString stringWithFormat:@"%@ min", @(mins)] : @"";
    return [NSString stringWithFormat:@"%@%@",hoursString,minutesString];
    
}

@end
