
#import "EmergencyContactsListingController.h"
#import "EmergencyContactInfoCell.h"
#import "AccidentCase.h"

@interface EmergencyContactsListingController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *timerView;

@end

@implementation EmergencyContactsListingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.victims = [AccidentCase currentAccidentCase].victims;
    [self.timerView addSubview:self.timeElapsedView];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.victims.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EmergencyContactInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmergencyContactInfoCell"];
    [cell populateWithContent:self.victims[indexPath.row]];
    
    return cell
    ;
}


@end
