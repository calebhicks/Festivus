//
//  Event.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "Event.h"

static NSString *nameKey = @"name";
static NSString *dateKey = @"date";
static NSString *startDateKey = @"startDate";
static NSString *endDateKey = @"endDate";
static NSString *eventDescriptionKey = @"eventDescription";
static NSString *locationNameKey = @"locationName";
static NSString *locationCoordinateKey = @"locationCoordinate";
static NSString *isFavoriteKey = @"isFavorite";
static NSString *urlKey = @"url";
static NSString *categoryKey = @"category";

@implementation Event

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    
    self.name = [aDecoder decodeObjectForKey:nameKey];
    self.date = [aDecoder decodeObjectForKey:dateKey];
    self.startDate = [aDecoder decodeObjectForKey:startDateKey];
    self.endDate = [aDecoder decodeObjectForKey:endDateKey];
    self.eventDescription = [aDecoder decodeObjectForKey:eventDescriptionKey];
    self.locationName = [aDecoder decodeObjectForKey:locationNameKey];
    self.locationCoordinate = [aDecoder decodeObjectForKey:locationCoordinateKey];
    NSNumber *isFavBoolNum = [aDecoder decodeObjectForKey:isFavoriteKey];
    if ([isFavBoolNum  isEqual:@1]) {
        self.isFavorite = YES;
    } else if ([isFavBoolNum  isEqual:@0]) {
        self.isFavorite = NO;
    }
    self.url = [aDecoder decodeObjectForKey:urlKey];
    self.category = [aDecoder decodeObjectForKey:categoryKey];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:nameKey];
    [aCoder encodeObject:self.date forKey:dateKey];
    [aCoder encodeObject:self.startDate forKey:startDateKey];
    [aCoder encodeObject:self.endDate forKey:endDateKey];
    [aCoder encodeObject:self.eventDescription forKey:eventDescriptionKey];
    [aCoder encodeObject:self.locationName forKey:locationNameKey];
    [aCoder encodeObject:self.locationCoordinate forKey:locationCoordinateKey];
    if (self.isFavorite) {
        [aCoder encodeObject:@1 forKey:isFavoriteKey];
    } else {
        [aCoder encodeObject:@0 forKey:isFavoriteKey];
    }
    [aCoder encodeObject:self.url forKey:urlKey];
    [aCoder encodeObject:self.category forKey:categoryKey];
}

@end






