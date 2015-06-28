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
#import <AVFoundation/AVFoundation.h>

@interface AccidentCasePollingService () {
    NSTimer *_timer;
    AVAudioPlayer *_player;
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
            [AccidentCase setCurrentAccidentCase:accidentCase];
            NSNotification *accidentCaseReceivedNotification = [NSNotification notificationWithName:AccidentCaseReceivedNotification
                                                                                             object:nil
                                                                                           userInfo:@{@"accidentCase" : accidentCase}];
            [[NSNotificationCenter defaultCenter]postNotification:accidentCaseReceivedNotification];
            [_timer invalidate];
            
            [self playAmbulanceSound];
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error in fetching accident service");
    }];
}

- (void)playAmbulanceSound {
    NSString *path;
    
    NSURL *url;
    
    path =[[NSBundle mainBundle] pathForResource:@"ambulance_sound" ofType:@"mp3"];
    
    url = [NSURL fileURLWithPath:path];
    _player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
    [_player setVolume:1.0];
    [_player play];
}

- (void)stopSound {
    [_player pause];
}

- (AFHTTPRequestOperationManager *)manager {
    if(!_manager) {
        _manager = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:BaseURL]];
    }
    return _manager;
}




@end
