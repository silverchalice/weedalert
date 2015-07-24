//
//  WAAttributeQueryViewController.m
//  WeedAlert
//
//  Created by Zachary Klein on 2/10/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAAttributeQueryViewController.h"
#import "WAWeedListViewController.h"

@interface WAAttributeQueryViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation WAAttributeQueryViewController

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
    
    self.navigationItem.backBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (WAWeedAppearanceQuery *)query {
    
    if(!_query) {
        _query = [[WAWeedAppearanceQuery alloc] init];
    }
        
    return _query;
}


- (IBAction)updateAttributeATR1Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr1 = [NSNumber numberWithLong:[self.query.atr1 intValue] + sender.tag];
    } else {
        self.query.atr1 = [NSNumber numberWithLong:[self.query.atr1 intValue] - sender.tag];
    }
}


- (IBAction)updateAttributeATR2Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr2 = [NSNumber numberWithLong:[self.query.atr2 intValue] + sender.tag];
    } else {
        self.query.atr2 = [NSNumber numberWithLong:[self.query.atr2 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR3Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr3 = [NSNumber numberWithLong:[self.query.atr3 intValue] + sender.tag];
    } else {
        self.query.atr3 = [NSNumber numberWithLong:[self.query.atr3 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR4Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr4 = [NSNumber numberWithLong:[self.query.atr4 intValue] + sender.tag];
    } else {
        self.query.atr4 = [NSNumber numberWithLong:[self.query.atr4 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR5Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr5 = [NSNumber numberWithLong:[self.query.atr5 intValue] + sender.tag];
    } else {
        self.query.atr5 = [NSNumber numberWithLong:[self.query.atr5 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR6Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr6 = [NSNumber numberWithLong:[self.query.atr6 intValue] + sender.tag];
    } else {
        self.query.atr6 = [NSNumber numberWithLong:[self.query.atr6 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR7Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr7 = [NSNumber numberWithLong:[self.query.atr7 intValue] + sender.tag];
    } else {
        self.query.atr7 = [NSNumber numberWithLong:[self.query.atr7 intValue] - sender.tag];
    }
}

- (IBAction)updateAttributeATR8Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.atr8 = [NSNumber numberWithLong:[self.query.atr8 intValue] + sender.tag];
    } else {
        self.query.atr8 = [NSNumber numberWithLong:[self.query.atr8 intValue] - sender.tag];
    }
}






- (IBAction)updateAttributeBTR1Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.btr1 = [NSNumber numberWithLong:[self.query.btr1 intValue] + sender.tag];
    } else {
        self.query.btr1 = [NSNumber numberWithLong:[self.query.btr1 intValue] - sender.tag];
    }
    
    NSLog(@"BTR1: %@", self.query.btr1);
}

- (IBAction)updateAttributeBTR2Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.btr2 = [NSNumber numberWithLong:[self.query.btr2 intValue] + sender.tag];
    } else {
        self.query.btr2 = [NSNumber numberWithLong:[self.query.btr2 intValue] - sender.tag];
    }
    
    NSLog(@"BTR2: %@", self.query.btr2);
}

- (IBAction)updateAttributeBTR3Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.btr3 = [NSNumber numberWithLong:[self.query.btr3 intValue] + sender.tag];
    } else {
        self.query.btr3 = [NSNumber numberWithLong:[self.query.btr3 intValue] - sender.tag];
    }
    
    NSLog(@"BTR3: %@", self.query.btr3);
}

- (IBAction)updateAttributeBTR4Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.btr4 = [NSNumber numberWithLong:[self.query.btr4 intValue] + sender.tag];
    } else {
        self.query.btr4 = [NSNumber numberWithLong:[self.query.btr4 intValue] - sender.tag];
    }
    
    NSLog(@"BTR4: %@", self.query.btr4);
}

- (IBAction)updateAttributeBTR5Value:(UISwitch *)sender {
    if (sender.on) {
        self.query.btr5 = [NSNumber numberWithLong:[self.query.btr5 intValue] + sender.tag];
    } else {
        self.query.btr5 = [NSNumber numberWithLong:[self.query.btr5 intValue] - sender.tag];
    }
    
    NSLog(@"BTR5: %@", self.query.btr5);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"]) {
        NSLog(@"Next!");
        WAAttributeQueryViewController *destViewController = (WAAttributeQueryViewController *)segue.destinationViewController;
        destViewController.managedObjectContext = self.managedObjectContext;
        destViewController.query = self.query;
    } else if ([segue.identifier isEqualToString:@"search"]) {
        NSLog(@"Search!");
        
        WAWeedListViewController *destViewController = (WAWeedListViewController *)segue.destinationViewController;
        destViewController.managedObjectContext = self.managedObjectContext;
        
        destViewController.filterPredicate = [self.query generateAttributeQueryPredicate];
        
    }
}


@end
