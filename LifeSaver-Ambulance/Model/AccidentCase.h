//
//  AccidentCase.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Victim.h"
#import "Location.h"

@interface AccidentCase : NSObject

@property(nonatomic, strong) NSArray* victims;
@property(nonatomic, strong) NSString* timeOfAccident;
@property(nonatomic, strong) Location* location;

@end
