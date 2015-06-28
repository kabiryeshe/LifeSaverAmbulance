//
//  EmergencyContactInfoCell.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "EmergencyContactInfoCell.h"
#import "Victim.h"

@interface EmergencyContactInfoCell() {
    
    __weak IBOutlet UIImageView *victimsImageView;
    __weak IBOutlet UILabel *victimsName;
    __weak IBOutlet UILabel *emergencyContactNameLabel;
    __weak IBOutlet UILabel *emergencyContactNumberLabel;
}

@end


@implementation EmergencyContactInfoCell


- (void)populateWithContent:(Victim *)victim {
    
    victimsImageView.image = [UIImage imageNamed:victim.photoURL];
    victimsName.text = victim.name;
    emergencyContactNameLabel.text = victim.emergencyContactPerson;
    emergencyContactNumberLabel.text = victim.emergencyContactNumber;
}

@end
