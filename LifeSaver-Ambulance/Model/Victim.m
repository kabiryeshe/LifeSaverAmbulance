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
    victim.age =  [dictionary[@"age"] integerValue];
    victim.gender = dictionary[@"gender"];
    victim.photoURL = dictionary[@"photo"];
    victim.bloodGroup = [dictionary valueForKeyPath:@"medical_info.blood_group"];
    victim.emergencyContactNumber = [dictionary valueForKeyPath:@"emergency_details.contact_no"];
     victim.emergencyContactPerson = [dictionary valueForKeyPath:@"emergency_details.name"];
    victim.birthMark = [dictionary[@"birth_marks"]firstObject];
    victim.medicalRecords = dictionary[@"medical_records"];
    victim.medicalInsurace = [MedicalInsurance medicalRecordFromDictionary:dictionary[@"medical_insurance_policy"]];
    return victim;
}

@end
