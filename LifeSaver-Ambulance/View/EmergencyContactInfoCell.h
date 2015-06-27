//
//  EmergencyContactInfoCell.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Victim;

@interface EmergencyContactInfoCell : UITableViewCell

- (void)populateWithContent:(Victim *)victim;

@end
