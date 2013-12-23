//
//  WAViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 5/9/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import "WAViewController.h"
#import "WAWeedListViewController.h"

@interface WAViewController ()

@end

@implementation WAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //Silencing performSelector leak warning because Daniel said so
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [self performSelector:NSSelectorFromString([segue.identifier stringByAppendingString:@":"]) withObject:segue];
}
    


- (void)byNameSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Entering byNameSegue...");
    WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
    destViewController.navigationItem.title = @"Weeds by Name";
    destViewController.managedObjectContext = self.managedObjectContext;
}

- (void)byAppearanceSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Entering byAppearanceSegue...");
    WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
        destViewController.navigationItem.title = @"Weeds by Appearance";
    destViewController.managedObjectContext = self.managedObjectContext;
}

- (void)byRegionSegue:(UIStoryboardSegue *)segue {
    NSLog(@"Entering byRegionSegue...");
    WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
        destViewController.navigationItem.title = @"Weeds by Region";
    destViewController.managedObjectContext = self.managedObjectContext;
}

-(IBAction)exitList:(UIStoryboardSegue *)segue {
    
}

@end
