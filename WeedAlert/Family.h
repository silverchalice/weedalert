//
//  Family.h
//  WeedAlert
//
//  Created by Zachary Klein on 4/29/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Weed;

@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *weeds;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addWeedsObject:(Weed *)value;
- (void)removeWeedsObject:(Weed *)value;
- (void)addWeeds:(NSSet *)values;
- (void)removeWeeds:(NSSet *)values;

@end
