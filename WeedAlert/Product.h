//
//  Product.h
//  WeedAlert
//
//  Created by Zachary Klein on 5/8/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Weed;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * proId;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *weeds;
@end

@interface Product (CoreDataGeneratedAccessors)

- (void)addWeedsObject:(Weed *)value;
- (void)removeWeedsObject:(Weed *)value;
- (void)addWeeds:(NSSet *)values;
- (void)removeWeeds:(NSSet *)values;

@end
