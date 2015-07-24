//
//  Weed.m
//  WeedAlert
//
//  Created by Zachary Klein on 5/8/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "Weed.h"
#import "Family.h"
#import "Product.h"


@implementation Weed

@dynamic akaNames;
@dynamic atr1;
@dynamic atr2;
@dynamic atr3;
@dynamic atr4;
@dynamic atr5;
@dynamic atr6;
@dynamic atr7;
@dynamic atr8;
@dynamic btr1;
@dynamic btr2;
@dynamic btr3;
@dynamic btr4;
@dynamic btr5;
@dynamic controlTip;
@dynamic germ3;
@dynamic germ4;
@dynamic germ5;
@dynamic germ6;
@dynamic germ7;
@dynamic germ8;
@dynamic germ9;
@dynamic germ10;
@dynamic herbUse;
@dynamic leafType;
@dynamic longDescription;
@dynamic look1;
@dynamic look2;
@dynamic look3;
@dynamic look4;
@dynamic look5;
@dynamic management;
@dynamic name;
@dynamic properName;
@dynamic region;
@dynamic searchNames;
@dynamic shortDesc;
@dynamic status;
@dynamic summary;
@dynamic waId;
@dynamic family;
@dynamic products;


- (UIImage *)primaryImage {
    
    return [[self images] objectAtIndex:0];
}

- (NSArray *)images {
    NSString *weedId =  [self.waId stringValue];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *defaultPath = [[NSBundle mainBundle] resourcePath];
    NSError *error;
    
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath:defaultPath
                                                                  error:&error];
    
    NSString *match = [NSString stringWithFormat:@"%@??.png", weedId];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF like %@", match];
    
    NSArray *results = [directoryContents filteredArrayUsingPredicate:predicate];
    NSMutableArray *images = [[NSMutableArray alloc] init];
    [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [images addObject:[UIImage imageNamed:(NSString *)obj]];
    }];
    return images;
}


@end
