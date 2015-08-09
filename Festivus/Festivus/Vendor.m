//
//  Vendor.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "Vendor.h"

static NSString *nameKey = @"name";
static NSString *vendorDescriptionKey = @"vendorDescription";
static NSString *locationNameKey = @"locationName";
static NSString *locationCoordinateKey = @"locationCoordinate";
static NSString *linksKey = @"links";
static NSString *phoneNumberKey = @"phoneNumber";
static NSString *isFavoriteKey = @"isFavorite";
static NSString *categoryKey = @"category";
static NSString *emailKey = @"email";
static NSString *boothLocationKey = @"boothLocation";

@implementation Vendor

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    
    self.name = [aDecoder decodeObjectForKey:nameKey];
    self.vendorDescription = [aDecoder decodeObjectForKey:vendorDescriptionKey];
    self.locationName = [aDecoder decodeObjectForKey:locationNameKey];
    self.locationCoordinate = [aDecoder decodeObjectForKey:locationCoordinateKey];
    self.links = [aDecoder decodeObjectForKey:linksKey];
    self.phoneNumber = [aDecoder decodeObjectForKey:phoneNumberKey];
    NSNumber *isFavBoolNum = [aDecoder decodeObjectForKey:isFavoriteKey];
    if ([isFavBoolNum  isEqual:@1]) {
        self.isFavorite = YES;
    } else if ([isFavBoolNum  isEqual:@0]) {
        self.isFavorite = NO;
    }
    self.category = [aDecoder decodeObjectForKey:categoryKey];
    self.email = [aDecoder decodeObjectForKey:emailKey];
    self.boothLocation = [aDecoder decodeObjectForKey:boothLocationKey];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.name forKey:nameKey];
    [aCoder encodeObject:self.vendorDescription forKey:vendorDescriptionKey];
    [aCoder encodeObject:self.locationName forKey:locationNameKey];
    [aCoder encodeObject:self.locationCoordinate forKey:locationCoordinateKey];
    [aCoder encodeObject:self.links forKey:linksKey];
    [aCoder encodeObject:self.phoneNumber forKey:phoneNumberKey];
    if (self.isFavorite) {
        [aCoder encodeObject:@1 forKey:isFavoriteKey];
    } else {
        [aCoder encodeObject:@0 forKey:isFavoriteKey];
    }
    [aCoder encodeObject:self.category forKey:categoryKey];
    [aCoder encodeObject:self.email forKey:emailKey];
    [aCoder encodeObject:self.boothLocation forKey:boothLocationKey];
    
}

@end
