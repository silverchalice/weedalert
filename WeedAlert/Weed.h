//
//  Weed.h
//  WeedAlert
//
//  Created by Zachary Klein on 5/8/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Family, Product;

@interface Weed : NSManagedObject

@property (nonatomic, retain) NSString * akaNames;
@property (nonatomic, retain) NSNumber * atr1;
@property (nonatomic, retain) NSNumber * atr2;
@property (nonatomic, retain) NSNumber * atr3;
@property (nonatomic, retain) NSNumber * atr4;
@property (nonatomic, retain) NSNumber * atr5;
@property (nonatomic, retain) NSNumber * atr6;
@property (nonatomic, retain) NSNumber * atr7;
@property (nonatomic, retain) NSNumber * atr8;
@property (nonatomic, retain) NSNumber * btr1;
@property (nonatomic, retain) NSNumber * btr2;
@property (nonatomic, retain) NSNumber * btr3;
@property (nonatomic, retain) NSNumber * btr4;
@property (nonatomic, retain) NSNumber * btr5;
@property (nonatomic, retain) NSString * controlTip;
@property (nonatomic, retain) NSNumber * germ3;
@property (nonatomic, retain) NSNumber * germ4;
@property (nonatomic, retain) NSNumber * germ5;
@property (nonatomic, retain) NSNumber * germ6;
@property (nonatomic, retain) NSNumber * germ7;
@property (nonatomic, retain) NSNumber * germ8;
@property (nonatomic, retain) NSNumber * germ9;
@property (nonatomic, retain) NSNumber * germ10;
@property (nonatomic, retain) NSString * herbUse;
@property (nonatomic, retain) NSNumber * leafType;
@property (nonatomic, retain) NSString * longDescription;
@property (nonatomic, retain) NSNumber * look1;
@property (nonatomic, retain) NSNumber * look2;
@property (nonatomic, retain) NSNumber * look3;
@property (nonatomic, retain) NSNumber * look4;
@property (nonatomic, retain) NSNumber * look5;
@property (nonatomic, retain) NSString * management;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * properName;
@property (nonatomic, retain) NSNumber * region;
@property (nonatomic, retain) NSString * searchNames;
@property (nonatomic, retain) NSString * shortDesc;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) NSNumber * waId;
@property (nonatomic, retain) Family *family;
@property (nonatomic, retain) NSSet *products;
@end

@interface Weed (CoreDataGeneratedAccessors)

- (void)addProductsObject:(Product *)value;
- (void)removeProductsObject:(Product *)value;
- (void)addProducts:(NSSet *)values;
- (void)removeProducts:(NSSet *)values;
- (UIImage *)primaryImage;
- (NSArray *)images;
@end
