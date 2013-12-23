//
//  Weed.h
//  WeedAlert
//
//  Created by Zachary Klein on 10/3/13.
//  Copyright (c) 2013 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Family;

@interface Weed : NSManagedObject

@property (nonatomic, retain) NSString * akaNames;
@property (nonatomic, retain) NSString * controlTip;
@property (nonatomic, retain) NSString * herbUse;
@property (nonatomic, retain) NSString * longDescription;
@property (nonatomic, retain) NSString * management;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * properName;
@property (nonatomic, retain) NSString * searchNames;
@property (nonatomic, retain) NSString * summary;
@property (nonatomic, retain) Family *family;

@end
