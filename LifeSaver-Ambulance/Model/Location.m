//
//  Location.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "Location.h"

@implementation Location

+ (instancetype)locationFromDictionary:(NSDictionary *)dictionary {
    Location *location = [[Location alloc]init];
    location.latitude = dictionary[@"lat"];
    location.longitude = dictionary[@"long"];
    return location;
}
@end
