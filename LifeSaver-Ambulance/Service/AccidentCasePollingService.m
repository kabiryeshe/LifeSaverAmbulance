//
//  AccidentCasePollingService.m
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import "AccidentCasePollingService.h"
#import <AFNetworking/AFNetworking.h>

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
    
    _timer = [NSTimer timerWithTimeInterval:5.0
                                            target:self
                                          selector:@selector(pollForUpdates) userInfo:nil
                                           repeats:YES];
    [_timer fire];
}

- (void)pollForUpdates {

    [_manager GET:@"url" parameters:@{@"id":@"123"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject[@"assignment"]) {
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}


- (AFHTTPRequestOperationManager *)manager {
    if(!_manager) {
        _manager = [AFHTTPRequestOperationManager manager];
    }
    return _manager;
}




@end
