//
//  WAByRegionTableViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 1/25/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAByRegionTableViewController.h"
#import "WAWeedListViewController.h"

@interface WAByRegionTableViewController ()

@end

@implementation WAByRegionTableViewController

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


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
    destViewController.managedObjectContext = self.managedObjectContext;
    NSNumber *region = @0;
    
    if([segue.identifier isEqualToString:@"westernRegion"]) {
        region = @1;
        destViewController.navigationItem.title = @"Weeds in Western US";
    } else if([segue.identifier isEqualToString:@"northCentralRegion"]) {
        region = @2;
        destViewController.navigationItem.title = @"Weeds in North Central US";
    } else if([segue.identifier isEqualToString:@"southernRegion"]) {
        region = @4;
        destViewController.navigationItem.title = @"Weeds in Southern US";
    } else if([segue.identifier isEqualToString:@"northeastRegion"]) {
        region = @8;
        destViewController.navigationItem.title = @"Weeds in Northeast US";
    }
    
    
    NSPredicate *regionEquals = [NSPredicate predicateWithFormat:@"region >= $region"];
    destViewController.filterPredicate = [regionEquals predicateWithSubstitutionVariables:@{@"region": region}];

    
}


@end
