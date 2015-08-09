//
//  VendorController.h
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vendor.h"

@interface VendorController : NSObject

@property (strong, nonatomic, readonly) NSArray *vendors;
@property (strong, nonatomic, readonly) NSArray *favoritedVendors;

- (void)setFavorite:(Vendor*)vendor;
- (void)removeFavorite:(Vendor*)vendor;

@end
