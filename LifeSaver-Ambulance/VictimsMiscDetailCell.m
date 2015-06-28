//
//  VictimsMiscDetailCell.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "VictimsMiscDetailCell.h"
#import "LSLabel.h"

@interface VictimsMiscDetailCell () {
    
    __weak IBOutlet LSLabel *detailLabel;
}



@end
@implementation VictimsMiscDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)populateWithTitle:(NSString *)title {
    detailLabel.text = title;
}
@end
