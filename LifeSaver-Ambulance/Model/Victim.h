//
//  Victim.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MedicalInsurance.h"

@interface Victim : NSObject

@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *photoURL;
@property(nonatomic) NSInteger age;
@property(nonatomic, strong)NSString *gender;
@property(nonatomic, strong) NSString *emergencyContactPerson;
@property(nonatomic, strong) NSString *emergencyContactNumber;
@property(nonatomic, strong) NSString *bloodGroup;
@property(nonatomic, strong) NSString *birthMark;
@property(nonatomic, strong) MedicalInsurance *medicalInsurace;
@property(nonatomic, strong) NSArray *medicalRecords;



+ (instancetype)victimFromDictionary:(NSDictionary *)dictionary;

@end
