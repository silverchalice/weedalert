//
//  WAAppDelegate.m
//  WeedAlert
//
//  Created by Zachary Klein on 5/9/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import "WAAppDelegate.h"
#import "Weed.h"
#import "WAViewController.h"
#import <CoreData/CoreData.h>
#import <HockeySDK/HockeySDK.h>

@interface WAAppDelegate ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)initializeCoreDataStack;

@end

@implementation WAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self initializeCoreDataStack];

    id navigationController = [[self window] rootViewController];
    WAViewController *controller = (WAViewController *)[navigationController topViewController];
    controller.managedObjectContext = self.managedObjectContext;
    
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"0d06a469f9f0fb7b042122a6edda0614"];
    [[BITHockeyManager sharedHockeyManager] startManager];
    [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];

    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)contextInitialized {

    [self populateCoreData];

}

- (void)initializeCoreDataStack {
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"WeedAlertModel" withExtension:@"mom"];
    ZAssert(modelURL, @"Failed to find model URL");
    
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    ZAssert(mom, @"Failed to initialize model");
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    ZAssert(psc, @"Failed to initialize persistent store coordinator");
  
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:psc];
    self.managedObjectContext = moc;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSArray *directories = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
        
        NSURL *storeUrl = [[directories lastObject] URLByAppendingPathComponent:@"WeedAlert.sqlite"];
        
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:[storeUrl path]]) {
            NSLog(@"Loading preloaded database");
            NSURL *preloadURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"WeedAlertImporter" ofType:@"sqlite"]];
            NSError* err = nil;
            
            NSLog(@"Preload URL : %@", [preloadURL description]);
            
            if (![[NSFileManager defaultManager] copyItemAtURL:preloadURL toURL:storeUrl error:&err]) {
                NSLog(@"Oops, could copy preloaded data");
            }
        }
        
        NSError *error = nil;
        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeUrl options:nil error:&error];
        if(!store) {
            ALog(@"Error adding persistent store to coordinator %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Weed"
                                                  inManagedObjectContext:moc];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
        for (Weed *weed in fetchedObjects) {
            NSLog(@"Name: %@", weed.name);
            NSLog(@"BTR: %@,%@,%@,%@,%@", weed.atr1, weed.atr2, weed.atr3, weed.atr4, weed.atr5);
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self contextInitialized];
        });
        
    });
}

- (void)populateCoreData {
    NSLog(@"Populating Core Data...");
   
    
    
}

@end
