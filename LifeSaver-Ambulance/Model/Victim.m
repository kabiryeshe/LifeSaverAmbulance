//
//  Victim.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "Victim.h"

@implementation Victim

+ (instancetype)victimFromDictionary:(NSDictionary *)dictionary {
    Victim *victim = [[Victim alloc]init];
    victim.name = dictionary[@"name"];
    victim.age = (NSInteger)dictionary[@"age"];
    victim.photoURL = dictionary[@"photo"];
    victim.bloodGroup = [dictionary valueForKeyPath:@"medical_info.blood_group"];
    victim.emergencyContactNumber = [dictionary valueForKeyPath:@"emergency_details.contact_no"];
     victim.emergencyContactPerson = [dictionary valueForKeyPath:@"emergency_details.name"];
    victim.identificationMark = dictionary[@"identification_mark"];
    return victim;
    
}

@end
