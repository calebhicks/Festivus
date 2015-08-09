//
//  SearchResultsViewController.m
//  SkillFinder
//
//  Created by Daniel Dayley on 8/8/15.
//  Copyright (c) 2015 Daniel Dayley. All rights reserved.
//

#import "SearchResultsViewController.h"
#import "VendorController.h"
#import "EventSearchResultTableViewCell.h"

@interface SearchResultsViewController ()

@end

@implementation SearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"NoResultsTableViewCell" bundle:nil] forCellReuseIdentifier:@"noResultsCell"];
        [self.tableView registerNib:[UINib nibWithNibName:@"EventSearchResultTableViewCell" bundle:nil] forCellReuseIdentifier:@"searchResultCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.filteredResults.count == 0) {
        return 1; // If no results in self.filtered results, return a noResults cell.
    }
    return self.filteredResults.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 138; // Check the cell's xib file height to get appropriately looking cells.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.filteredResults.count == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noResultsCell"];
        [tableView setAllowsSelection:NO];
        return cell; // Return a noResults cell if there are no results.
    }
    
    Vendor *currentVendor = self.filteredResults[indexPath.row];
    
    EventSearchResultTableViewCell *resultCell = [tableView dequeueReusableCellWithIdentifier:@"searchResultCell"];
    
    if (!resultCell) {
        resultCell = [[EventSearchResultTableViewCell alloc] init];
    }
    
    resultCell.nameLabel.text = currentVendor.name;
    
    return resultCell;
}

@end
