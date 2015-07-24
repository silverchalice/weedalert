//
//  WAByAppearanceViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 1/27/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAByAppearanceViewController.h"
#import "WAAttributeQueryViewController.h"

@interface WAByAppearanceViewController ()

@end

@implementation WAByAppearanceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
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


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    WAAttributeQueryViewController *destViewController = (WAAttributeQueryViewController *)segue.destinationViewController;
    destViewController.managedObjectContext = self.managedObjectContext;
    
}

- (IBAction)resetAppearanceSearch:(UIStoryboardSegue *)segue {

}

@end
