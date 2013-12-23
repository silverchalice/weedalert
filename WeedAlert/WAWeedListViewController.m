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
}


- (NSFetchedResultsController *)fetchedResultsController {
    if(!_fetchedResultsController) {
        NSManagedObjectContext *moc = self.managedObjectContext;
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Weed"];
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        
        [fetchRequest setSortDescriptors:@[sort]];
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
    
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    Weed *weed = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeedCell"];
    cell.textLabel.text = weed.name;
    
    return cell;
}

- (IBAction)exitDetailView:(UIStoryboardSegue *)sender {
    
}


@end
