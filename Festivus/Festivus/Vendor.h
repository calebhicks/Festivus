//
//  Vendor.h
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;

@interface Vendor : NSObject <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *vendorDescription;
@property (strong, nonatomic) NSString *locationName;
@property (strong, nonatomic) CLLocation *locationCoordinate;
@property (strong, nonatomic) NSArray *links;
@property (strong, nonatomic) NSString *phoneNumber;
@property (assign, nonatomic) BOOL isFavorite;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *boothLocation;

@end
