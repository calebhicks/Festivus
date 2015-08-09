//
//  SearchViewController.m
//
//  Created by Daniel Dayley on 8/8/15.
//  Copyright (c) 2015 Daniel Dayley. All rights reserved.
//

#import "VendorListViewController.h"
#import "SearchResultsViewController.h"
//#import "SearchResultCell.h"

#pragma warning - Set this to the appropriate search key.

@interface VendorListViewController () <UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) SearchResultsViewController *resultsTableController;
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

@end

@implementation VendorListViewController

- (void)viewDidLoad {
   	[super viewDidLoad];
    self.resultsTableController = [[SearchResultsViewController alloc] init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:self.resultsTableController];
    [self.searchController setProvidesPresentationContextTransitionStyle:YES];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.resultsTableController.tableView.delegate = self;
    self.resultsTableController.tableView.dataSource = self.resultsTableController;
    self.searchController.delegate = self;
    self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
    self.searchController.searchBar.delegate = self;
    self.resultsTableController.tableView.separatorColor = [UIColor clearColor];
    
    self.tableView.rowHeight = self.view.frame.size.height - self.navigationController.navigationBar.frame.size.height - self.tabBarController.tabBar.frame.size.height - self.searchController.searchBar.frame.size.height;
    [self.tableView registerNib:[UINib nibWithNibName:@"SuggestedSearchCell" bundle:nil] forCellReuseIdentifier:@"suggestedSearchCell"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.tableView.separatorColor = [UIColor clearColor];
    // restore the searchController's active state
    if (self.searchControllerWasActive) {
        self.searchController.active = self.searchControllerWasActive;
        self.searchControllerWasActive = NO;
        if (self.searchControllerSearchFieldWasFirstResponder) {
            [self.searchController.searchBar becomeFirstResponder];
            self.searchControllerSearchFieldWasFirstResponder = NO;
        }
    }
}

#pragma mark - Tableview methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // BUILD ME!
    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    tableView.allowsSelection = NO;

    // BUILD ME!
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selectedRow = indexPath.row;
    SearchResultsViewController *searchResultTable = ((SearchResultsViewController *)self.searchController.searchResultsController);
    
    // THIS IS WHERE THE HANDOFF TO THE DETAILVIEWCONTROLLER SHOULD GO
    
    [tableView cellForRowAtIndexPath:indexPath].userInteractionEnabled = NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        return 100; // Check the cell's xib file height to get appropriately looking cells.
}

- (void)resetTable {
    [self.tableView reloadData];
    [self.view reloadInputViews];
}

#pragma mark - Searchbar methods


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self updateSearchResultsForSearchController:self.searchController];
    [searchBar resignFirstResponder];
}

-(void)searchSelected:(NSString *)searchName {
    [self.searchController.searchBar becomeFirstResponder];
    [self.searchController.searchBar setText:searchName];
}
    
#pragma mark - Search methods

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // update the filtered array based on the search text
    NSString *searchText = searchController.searchBar.text;

    NSMutableArray *searchResults = [NSMutableArray arrayWithArray:self.displayData];
    // strip out all the leading and trailing spaces
    NSString *strippedString = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    // break up the search terms (separated by spaces)
    NSArray *searchItems = nil;
    if (strippedString.length > 0) {
        searchItems = [strippedString componentsSeparatedByString:@" "];
    }
    
    // build all the "AND" expressions for each value in the searchString
    //
    NSMutableArray *andMatchPredicates = [NSMutableArray array];
    for (NSString *searchString in searchItems) {
        // each searchString creates an OR predicate for: name, yearIntroduced, introPrice
        //
        // example if searchItems contains "iphone 599 2007":
        //      name CONTAINS[c] "iphone"
        //      name CONTAINS[c] "599", yearIntroduced ==[c] 599, introPrice ==[c] 599
        //      name CONTAINS[c] "2007", yearIntroduced ==[c] 2007, introPrice ==[c] 2007
        //
        NSMutableArray *searchItemsPredicate = [NSMutableArray array];
        
        // Below we use NSExpression represent expressions in our predicates.
        // NSPredicate is made up of smaller, atomic parts: two NSExpressions (a left-hand value and a right-hand value)
        
        // name field matching
        NSExpression *lhs = [NSExpression expressionForKeyPath:@"skillName"];
        NSExpression *rhs = [NSExpression expressionForConstantValue:searchString];
        NSPredicate *finalPredicate = [NSComparisonPredicate
                                       predicateWithLeftExpression:lhs
                                       rightExpression:rhs
                                       modifier:NSDirectPredicateModifier
                                       type:NSContainsPredicateOperatorType
                                       options:NSCaseInsensitivePredicateOption];
        [searchItemsPredicate addObject:finalPredicate];
        
        // Add this to include the name of the user in the search query.
//        lhs = [NSExpression expressionForKeyPath:@"userName"];
//        rhs = [NSExpression expressionForConstantValue:searchString];
//        finalPredicate = [NSComparisonPredicate
//                                       predicateWithLeftExpression:lhs
//                                       rightExpression:rhs
//                                       modifier:NSDirectPredicateModifier
//                                       type:NSContainsPredicateOperatorType
//                                       options:NSCaseInsensitivePredicateOption];
//        [searchItemsPredicate addObject:finalPredicate];
        
        // at this OR predicate to our master AND predicate
        NSCompoundPredicate *orMatchPredicates = [NSCompoundPredicate orPredicateWithSubpredicates:searchItemsPredicate];
        [andMatchPredicates addObject:orMatchPredicates];
    }
    
    // match up the fields of the Product object
    NSCompoundPredicate *finalCompoundPredicate =
    [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicates];
    searchResults = [[searchResults filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
    
    // sort the results
    
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:self.sortDescriptor
                                                 ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    searchResults = [NSMutableArray arrayWithArray:[searchResults sortedArrayUsingDescriptors:sortDescriptors]];
        

        
    // hand over the filtered results to our search results table
    SearchResultsViewController *tableController = (SearchResultsViewController *)self.searchController.searchResultsController;
    tableController.filteredResults = searchResults;
    
//    This is to help fix a bug with the searchResultsTableView height not updating.
//    [tableController.tableView setFrame:[[UIScreen mainScreen] bounds]];
    [tableController.tableView reloadData];
}

- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
    [super encodeRestorableStateWithCoder:coder]; // encode the view state so it can be restored later
    
    // encode the title
    [coder encodeObject:self.title forKey:@"ViewControllerTitleKey"];
    
    UISearchController *searchController = self.searchController;
    
    // encode the search controller's active state
    BOOL searchDisplayControllerIsActive = searchController.isActive;
    [coder encodeBool:searchDisplayControllerIsActive forKey:@"SearchControllerIsActiveKey"];
    
    if (searchDisplayControllerIsActive) {
        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:@"SearchBarIsFirstResponderKey"];
    }
    [coder encodeObject:searchController.searchBar.text forKey:@"SearchBarTextKey"];
}

- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
    [super decodeRestorableStateWithCoder:coder];
    
    // restore the title
    self.title = [coder decodeObjectForKey:@"ViewControllerTitleKey"];
    
    // restore the active state:
    // we can't make the searchController active here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear

    self.searchControllerWasActive = [coder decodeBoolForKey:@"SearchControllerIsActiveKey"];
    
    // restore the first responder status:
    // we can't make the searchController first responder here since it's not part of the view
    // hierarchy yet, instead we do it in viewWillAppear

    self.searchControllerSearchFieldWasFirstResponder = [coder decodeBoolForKey:@"SearchBarIsFirstResponderKey"];
    
    // restore the text in the search field
    self.searchController.searchBar.text = [coder decodeObjectForKey:@"SearchBarTextKey"];
}

@end
