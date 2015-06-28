//
//  MedicalInsurance.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "MedicalInsurance.h"

@implementation MedicalInsurance


+ (instancetype)medicalRecordFromDictionary:(NSDictionary *)dictionary {
    
    MedicalInsurance *medicalInsurance = [[MedicalInsurance alloc]init];
    medicalInsurance.contactNumber =  dictionary[@"contact_no"];
    medicalInsurance.provider = dictionary[@"provider"];
    medicalInsurance.insuranceId = dictionary[@"insurance_id"];
    return medicalInsurance;    
}
@end
