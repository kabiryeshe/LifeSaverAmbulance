//
//  VictimDetailController.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "VictimDetailController.h"
#import "VictimsMiscDetailCell.h"

typedef enum {
    MedicalDetails,
    MedicalInsuranceDetails,
    EmergencyContact,
    ClinicalRecords
    
} VictimDetailCell;

@interface VictimDetailController ()

@property (weak, nonatomic) IBOutlet UILabel *bloodGroup;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *birthmark;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *timerView;

@end

@implementation VictimDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.victim.name;
    
    [self.timerView addSubview:self.timeElapsedView];
    [self populatePersonalInfo];
    
}

- (void)populatePersonalInfo {
    self.imageView.image = [UIImage imageNamed:self.victim.photoURL];
    self.bloodGroup.text = self.victim.bloodGroup;
    self.gender.text = self.victim.gender;
    self.birthmark.text = self.victim.birthMark;
    self.age.text = [@(self.victim.age)stringValue];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *titles = @[@"Medical Details",@"Medical Insurance Details",@"Emergency Contact",@"Clinical Records"];
    VictimsMiscDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VictimsMiscDetailCell"];
    [cell populateWithTitle:titles[indexPath.row]];
    
    return cell
    ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *info = @"";
    NSString *alerTitle = @"";
    
    if(indexPath.row == ClinicalRecords)
        return;
    
    if(indexPath.row == MedicalDetails) {
        alerTitle = @"Medical Details";
        for (NSString *record in self.victim.medicalRecords) {
            
            info = [NSString stringWithFormat:@"%@%@\n",info,record];
        }
        
    }
    
    if(indexPath.row == MedicalInsuranceDetails) {
                alerTitle = @"Medical Insurance Details";
        MedicalInsurance *insurance = self.victim.medicalInsurace;
        info  = [NSString stringWithFormat:@"Agency : %@ \n Insurace Id : %@ \n Contact No: %@", insurance.provider, insurance.insuranceId, insurance.contactNumber];
    }
    
    if(indexPath.row == EmergencyContact) {
                alerTitle = @"Emergency Contact";
        info = [NSString stringWithFormat:@"Contact Person : %@ \n Contact No: %@", self.victim.emergencyContactPerson, self.victim.emergencyContactNumber];
    }
    
    [[[UIAlertView alloc]initWithTitle:alerTitle
                              message:info
                             delegate:self
                    cancelButtonTitle:@"OK"
                    otherButtonTitles:nil] show ];
}


@end
