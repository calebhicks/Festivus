//
//  VendorController.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "VendorController.h"

@implementation VendorController


-(NSArray *)favoritedVendors {
    NSPredicate *isFavorite = [NSPredicate predicateWithFormat:@"isFavorite == 1"];
    NSArray *favoritedVendors = [self.vendors filteredArrayUsingPredicate:isFavorite];
    
    return favoritedVendors;
}

-(NSArray *)vendors {
    
    NSURL *url1 =[NSURL fileURLWithPath:@"www.google.com"];
    NSURL *url2 =[NSURL fileURLWithPath:@"www.cnn.com"];
    NSURL *url3 =[NSURL fileURLWithPath:@"www.amazon.com"];
    
    NSArray *linksArray = [[NSArray alloc]initWithObjects:url1,url2,url3, nil];
    
    Vendor *vendor1 = [Vendor new];
    Vendor *vendor2 = [Vendor new];
    Vendor *vendor3 = [Vendor new];
    Vendor *vendor4 = [Vendor new];
    
    vendor1.name = @"Vendor1";
    vendor1.vendorDescription= @"The first vendor";
    vendor1.locationName = @"Galivan Center";
    vendor1.links = linksArray;
    vendor1.phoneNumber= @"8015555555";
    vendor1.isFavorite = FALSE;
    vendor1.category = @"Art";
    vendor1.email = @"vendor1@whereVendorsLive.com";
    vendor1.boothLocation = @"You know, in the back corner";
    
    vendor2.name = @"Vendor2";
    vendor2.vendorDescription= @"The second vendor";
    vendor2.locationName = @"Galivan Center";
    vendor2.links = linksArray;
    vendor2.phoneNumber= @"8015555555";
    vendor2.isFavorite = TRUE;
    vendor2.category = @"Art";
    vendor2.email = @"vendorTwo@whereVendorsLive.com";
    vendor2.boothLocation = @"You know, the opposite corner";
    
    vendor3.name = @"Vendor3";
    vendor3.vendorDescription= @"The third vendor";
    vendor3.locationName = @"Galivan Center";
    vendor3.links = linksArray;
    vendor3.phoneNumber= @"8015555555";
    vendor3.isFavorite = FALSE;
    vendor3.category = @"Art";
    vendor3.email = @"vendorNumber3@whereVendorsLive.com";
    vendor3.boothLocation = @"You know, the other corner";
    
    vendor4.name = @"Vendor4";
    vendor4.vendorDescription= @"The fourth vendor";
    vendor4.locationName = @"Galivan Center";
    vendor4.links = linksArray;
    vendor4.phoneNumber= @"8015555555";
    vendor4.isFavorite = TRUE;
    vendor4.category = @"Pottery";
    vendor4.email = @"fourthVendor@whereVendorsLive.com";
    vendor4.boothLocation = @"You know, the corner not taken";
    
    return @[vendor1,vendor2,vendor3,vendor4];
}

-(void)setFavorite:(Vendor *)vendor {
    vendor.isFavorite =YES;
}

-(void)removeFavorite:(Vendor *)vendor {
    vendor.isFavorite = NO;
}

@end
