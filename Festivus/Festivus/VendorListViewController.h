//
//  SearchViewController.h
//
//  Created by Daniel Dayley on 8/8/15.
//  Copyright (c) 2015 Daniel Dayley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VendorController.h"

@interface VendorListViewController : UIViewController
@property (strong, nonatomic) NSString *sortDescriptor;
@property (strong, nonatomic) VendorController *datasource;
@end
