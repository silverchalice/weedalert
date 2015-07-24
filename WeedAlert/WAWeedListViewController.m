//
//  WAWeedListViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 10/1/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import "WAWeedListViewController.h"
#import "Weed.h"
#import "WAWeedDetailViewController.h"

@interface WAWeedListViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic)  NSFetchedResultsController *fetchedResultsController;

@end

@implementation WAWeedListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {

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


- (NSFetchedResultsController *)fetchedResultsController {
    
    if(!_fetchedResultsController) {
        NSManagedObjectContext *moc = self.managedObjectContext;
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Weed"];
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        
        [fetchRequest setSortDescriptors:@[sort]];
        
        if(self.filterPredicate) {
            NSLog(@"setting filterPredicate: %@", [self.filterPredicate description]);
            [fetchRequest setPredicate:self.filterPredicate];
        }
        
        NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:moc sectionNameKeyPath:nil cacheName:@"Master"];
        _fetchedResultsController.delegate = self;
        
        _fetchedResultsController = fetchedResultsController;
    }
    
    NSError *error = nil;
    ZAssert([_fetchedResultsController performFetch:&error], @"Unresolved error %@\n%@", [error localizedDescription], [error userInfo]);
    
    return _fetchedResultsController;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"weedDetail"]) {

        UITableViewCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Weed *weed = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        WAWeedDetailViewController *detailViewController = (WAWeedDetailViewController *)segue.destinationViewController;
        [detailViewController setWeed:weed];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
 
    return ([self.fetchedResultsController.fetchedObjects count] > 0 ? [sectionInfo numberOfObjects] : 1);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    
    if([self.fetchedResultsController.fetchedObjects count] == 0) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NoResults"];
        cell.textLabel.text = @"No Results Found";
        
    } else {
        Weed *weed = [self.fetchedResultsController objectAtIndexPath:indexPath];
        cell = [self.tableView dequeueReusableCellWithIdentifier:@"WeedCell"];
        
        if(!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WeedCell"];
        }
        
        UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
        UILabel *properNameLabel = (UILabel *)[cell viewWithTag:101];
        UIImageView *weedImageView = (UIImageView *)[cell viewWithTag:102];
        
        nameLabel.text = weed.name;
        properNameLabel.text = weed.properName;
        weedImageView.image = [weed primaryImage];
    }
    

    return cell;
}




@end
