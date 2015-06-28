//
//  LSLabel.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "LSLabel.h"

@implementation LSLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self setFont:[UIFont fontWithName:@"AvenirNextCondensed-DemiBold" size:self.font.pointSize]];
}


@end
