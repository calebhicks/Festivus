//
//  SearchResultsViewController.h
//
//  Created by Daniel Dayley on 8/8/15.
//  Copyright (c) 2015 Daniel Dayley. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NoResultsCell.h" // A customized cell to show when there are no results.

@interface SearchResultsViewController : UITableViewController
@property (nonatomic, strong) NSArray *filteredResults;
@end
