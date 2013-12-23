//
//  Family.h
//  WeedAlert
//
//  Created by Zachary Klein on 10/3/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Family : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *weeds;
@end

@interface Family (CoreDataGeneratedAccessors)

- (void)addWeedsObject:(NSManagedObject *)value;
- (void)removeWeedsObject:(NSManagedObject *)value;
- (void)addWeeds:(NSSet *)values;
- (void)removeWeeds:(NSSet *)values;

@end
