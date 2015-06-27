//
//  AccidentCase.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "AccidentCase.h"


@implementation AccidentCase

+ (instancetype)caseFromDictionary:(NSDictionary *)dictionary {

    AccidentCase *accidentCase = [[AccidentCase alloc]init];
    accidentCase.location = [Location locationFromDictionary:dictionary[@"location"]];
    accidentCase.timeOfAccident = dictionary[@"time_of_occurrence"];
    NSMutableArray *victims = [[NSMutableArray alloc]init];
    for(NSDictionary *victimDictionary in dictionary[@"victims"]) {
        
        Victim *victim = [Victim victimFromDictionary:victimDictionary];
        [victims addObject:victim];
        
    }
    accidentCase.victims = victims;
    return accidentCase;
}

@end
