//
//  VendorController.m
//  Festivus
//
//  Created by Skyler Tanner on 8/8/15.
//  Copyright (c) 2015 Alan Barth. All rights reserved.
//

#import "VendorController.h"

static NSString * const kVendorsKey = @"vendors";


@interface VendorController ()

@property (strong, nonatomic) NSArray *vendors;

@end

@implementation VendorController

- (instancetype)init
{
    self = [super init];
    if (self) {
        if ([[NSUserDefaults standardUserDefaults] objectForKey:kVendorsKey]) {
            self.vendors = [[NSUserDefaults standardUserDefaults] objectForKey:kVendorsKey];
        } else {
            [self serializeJSONData];
        }
    }
    return self;
}


- (NSArray *)favoritedVendors {
    NSPredicate *isFavorite = [NSPredicate predicateWithFormat:@"isFavorite == 1"];
    NSArray *favoritedEvents = [self.vendors filteredArrayUsingPredicate:isFavorite];
    
    return favoritedEvents;
}

- (void)serializeJSONData {
    
    self.vendors = [self getDataForResorce:@"clcvendors"];
    
}

- (NSArray *)getDataForResorce:(NSString *)resource {
    
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSError *error;
    
    NSDictionary *vendorData = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[bundle URLForResource:resource withExtension:@"json"]] options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        NSLog(@"%@", error);
    }
    
    NSMutableArray *vendors = [NSMutableArray new];
    
    for (NSDictionary *vendorDictionary in vendorData[@"vendors"]) {
        Vendor *vendor = [[Vendor alloc] initWithDictionary:vendorDictionary];
        [vendors addObject:vendor];
    }
    
    return vendors;
}

- (void)saveVendors {
    [[NSUserDefaults standardUserDefaults] setObject:self.vendors forKey:kVendorsKey];
}

- (void)setFavorite:(Vendor *)vendor {
    vendor.isFavorite = YES;
    
    [self saveVendors];
}

- (void)removeFavorite:(Vendor *)vendor {
    vendor.isFavorite = NO;
    
    [self saveVendors];
}

@end
