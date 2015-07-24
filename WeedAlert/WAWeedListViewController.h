//
//  WAWeedListViewController.h
//  WeedAlert
//
//  Created by Zachary Klein on 10/1/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface WAWeedListViewController : UITableViewController

@property NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSPredicate *filterPredicate;

@end
