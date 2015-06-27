//
//  VictimInfoTableCell.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "VictimInfoTableCell.h"
#import "Victim.h"

@interface VictimInfoTableCell() {
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UILabel *nameLabel;
    __weak IBOutlet UILabel *ageLabel;
    __weak IBOutlet UILabel *genderLabel;
}

@end

@implementation VictimInfoTableCell

- (void)populateWithVictimInfo:(Victim *)victim {
    nameLabel.text = victim.name;
    ageLabel.text = [@(victim.age) stringValue];
    genderLabel.text = victim.gender;
}

@end
