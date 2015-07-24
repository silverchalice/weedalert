//
//  WAByNameTableViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 1/25/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAByNameTableViewController.h"
#import "WAWeedListViewController.h"

@interface WAByNameTableViewController () <UISearchBarDelegate>

@property (strong, nonatomic) NSString *searchQuery;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation WAByNameTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 26;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"NameCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%c", (int)indexPath.row + 65];
    
    return cell;
}


#pragma mark - Navigation



// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    [self.searchBar resignFirstResponder];
    
    WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
    destViewController.managedObjectContext = self.managedObjectContext;
    
    if([segue.identifier isEqualToString:@"searchSegue"]) {
        NSString *query = [NSString stringWithFormat:@"%@", self.searchQuery];
        NSPredicate *namesLikeString = [NSPredicate predicateWithFormat:@"name LIKE[cd] $query OR searchNames LIKE[cd] $query OR properName LIKE[cd] $query"];
        destViewController.navigationItem.title = @"Search Results";
        destViewController.filterPredicate = [namesLikeString predicateWithSubstitutionVariables:@{@"query": query}];
    } else {
            destViewController.navigationItem.title = @"Weeds by Name";
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *letter = [NSString stringWithFormat:@"%c", (int)indexPath.row + 65];
        NSPredicate *nameBeginsWith = [NSPredicate predicateWithFormat:@"name BEGINSWITH[cd] $letter"];
        
        destViewController.filterPredicate = [nameBeginsWith predicateWithSubstitutionVariables:@{@"letter": letter}];
    }
    
}


#pragma mark - UISearchBarDelegate


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    NSLog(@"Search string: %@", searchBar.text);
    
    self.searchQuery = [NSString stringWithFormat:@"*%@*", searchBar.text];
    [searchBar resignFirstResponder];
    [self performSegueWithIdentifier:@"searchSegue" sender:searchBar];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

@end
