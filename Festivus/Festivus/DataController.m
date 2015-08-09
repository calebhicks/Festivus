//
//  DataController.m
//  Festivus
//
//  Created by Caleb Hicks on 8/8/15.
//  Copyright © 2015 Alan Barth. All rights reserved.
//

#import "DataController.h"
#import "Event.h"
#import "Vendor.h"

static NSString * const kVendorJSONURL = @"https://dl.dropboxusercontent.com/u/74616/devmtn/clcvendors.json";
static NSString * const kMusicJSONURL = @"https://dl.dropboxusercontent.com/u/74616/devmtn/clcmusic.json";
static NSString * const kWorkshopJSONURL = @"";


typedef NS_ENUM(NSUInteger, DataType) {
    DataTypeEvents,
    DataTypeVendors,
};

@implementation DataController


+ (void)checkForUpdatedData {

    NSBundle *bundle = [NSBundle mainBundle];
    
    NSError *error;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[bundle URLForResource:@"clcmusic" withExtension:@"json"]] options:NSJSONReadingAllowFragments error:&error];
    
    if (error) {
        return;
    } else {
        [DataController validateData:dictionary completion:^(BOOL valid) {
            if (valid) {
                [DataController serializeData:dictionary];
            }
        }];
    }
}

+ (void)validateData:(NSDictionary *)dictionary completion:(void (^)(BOOL valid))completionHandler {
    
    
    
    completionHandler(YES);
}

+ (void)serializeData:(NSDictionary *)data {
    
    for (NSDictionary *musicEvent in data) {
        
    }
    
}

+ (void)flushData {
    
    
    
}


@end
