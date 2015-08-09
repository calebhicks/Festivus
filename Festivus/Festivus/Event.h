//
//  Event.h
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface Event : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@property (strong, nonatomic) NSString *eventDescription;
@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) CLLocation *locationCoordinate;
@property (nonatomic) BOOL isFavorite;
@property (strong, nonatomic) NSURL *url; //(registration url, or more info url)
@property (strong, nonatomic) NSString *category;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
