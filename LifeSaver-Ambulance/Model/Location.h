//
//  Location.h
//  LifeSaver-Ambulance
//
//  Created by Tushar on 27/06/15.
//  Copyright (c) 2015 thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property(nonatomic, strong) NSString* latitude;
@property(nonatomic, strong) NSString* longitude;

+ (instancetype)locationFromDictionary:(NSDictionary *)dictionary;

@end
