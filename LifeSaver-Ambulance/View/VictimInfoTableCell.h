//
//  VictimInfoTableCell.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Victim;

@interface VictimInfoTableCell : UITableViewCell

- (void)populateWithVictimInfo:(Victim *)victim;

@end
