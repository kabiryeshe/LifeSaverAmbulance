//
//  AccidentSummaryController.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "AccidentSummaryController.h"
#import "AccidentCase.h"
#import "VictimInfoTableCell.h"
#import "VictimDetailController.h"

@interface AccidentSummaryController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distanceFromAccidentLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *estimatedTimeToReachLabel;
@property (weak, nonatomic) IBOutlet UILabel *victimsLabel;
@property (weak, nonatomic) IBOutlet UITableView *victimsTableView;
@property (weak, nonatomic) IBOutlet UIView *timerView;

@end

@implementation AccidentSummaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accidentCase = [AccidentCase currentAccidentCase];
    [self.timerView addSubview:self.timeElapsedView];
}


- (void)populateSummaryPanel {
    
    self.distanceFromAccidentLocationLabel.text = @"10 Km";
    self.estimatedTimeToReachLabel.text = @"20 mins";
    self.victimsLabel.text = [@(self.accidentCase.victims.count) stringValue];
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.accidentCase.victims.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VictimInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VictimInfoTableCell"];
    [cell populateWithVictimInfo:self.accidentCase.victims[indexPath.row]];
    
    return cell
    ;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"VictimDetails" sender:self.accidentCase.victims[indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual: @"VictimDetails"]) {
        ((VictimDetailController *)segue.destinationViewController).victim = sender;
    }
}

@end
