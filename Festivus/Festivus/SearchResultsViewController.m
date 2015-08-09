//
//  SearchResultsViewController.m
//  SkillFinder
//
//  Created by Daniel Dayley on 8/8/15.
//  Copyright (c) 2015 Daniel Dayley. All rights reserved.
//

#import "SearchResultsViewController.h"

@interface SearchResultsViewController ()

@end

@implementation SearchResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerNib:[UINib nibWithNibName:@"NoResultsCell" bundle:nil] forCellReuseIdentifier:@"noResultsCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.filteredResults.count == 0) {
        return 1; // If no results in self.filtered results, return a noResults cell.
    }
    return self.filteredResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.filteredResults.count == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noResultsCell"];
        [tableView setAllowsSelection:NO];
        return cell; // Return a noResults cell if there are no results.
    }
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    return cell;
}

@end
