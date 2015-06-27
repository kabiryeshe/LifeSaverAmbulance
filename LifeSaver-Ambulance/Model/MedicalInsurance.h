//
//  MedicalInsurance.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MedicalInsurance : NSObject

@property(nonatomic, strong) NSString *provider;
@property(nonatomic, strong) NSString *insuranceId;
@property(nonatomic, strong) NSString *contactNumber;

@end
