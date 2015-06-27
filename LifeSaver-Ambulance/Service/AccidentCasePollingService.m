//
//  AccidentCasePollingService.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "AccidentCasePollingService.h"
#import <AFNetworking/AFNetworking.h>
#import "AccidentCase.h"
#import "LSConstants.h"
@interface AccidentCasePollingService () {
    NSTimer *_timer;
}

@property(nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

static AccidentCasePollingService *_sharedInstance;

@implementation AccidentCasePollingService

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedInstance = [[self alloc]init];
        
    });
    return _sharedInstance;
}


- (void)start {
    
    NSLog(@"Started Accident Case Polling Service");
    
     _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(pollForUpdates) userInfo:nil repeats:YES];
   

    [_timer fire];
}

- (void)pollForUpdates {
    
    NSString *url = @"ambulance/1/accident";
    
    NSLog(@"Polling for accident Details!");

    [self.manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject[@"victims"]) {

            AccidentCase *accidentCase = [AccidentCase caseFromDictionary:responseObject];
            NSNotification *accidentCaseReceivedNotification = [NSNotification notificationWithName:AccidentCaseReceivedNotification
                                                                                             object:nil
                                                                                           userInfo:@{@"case" : accidentCase}];
            [[NSNotificationCenter defaultCenter]postNotification:accidentCaseReceivedNotification];
            [_timer invalidate];

        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


- (AFHTTPRequestOperationManager *)manager {
    if(!_manager) {
        _manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
    }
    return _manager;
}




@end
