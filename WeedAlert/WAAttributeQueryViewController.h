//
//  WAAttributeQueryViewController.h
//  WeedAlert
//
//  Created by Zachary Klein on 2/10/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "WAWeedAppearanceQuery.h"

@interface WAAttributeQueryViewController : UIViewController

@property (strong, nonatomic) WAWeedAppearanceQuery *query;
@property NSManagedObjectContext *managedObjectContext;

@end
