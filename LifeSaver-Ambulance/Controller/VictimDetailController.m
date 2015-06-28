//
//  VictimDetailController.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 28/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "VictimDetailController.h"

@interface VictimDetailController ()

@property (weak, nonatomic) IBOutlet UILabel *bloodGroup;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *birthmark;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation VictimDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.victim.name;
    self.imageView.image = [UIImage imageNamed:self.victim.photoURL];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    return cell
    ;
}

- (CGFloat)tableView:(UITableView *)tableView  heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Row Selected");
}


@end
