//
//  WAWeedAppearanceQuery.h
//  WeedAlert
//
//  Created by Zachary Klein on 2/7/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAWeedAppearanceQuery : NSObject

@property (nonatomic, strong) NSNumber *atr1;
@property (nonatomic, strong) NSNumber *atr2;
@property (nonatomic, strong) NSNumber *atr3;
@property (nonatomic, strong) NSNumber *atr4;
@property (nonatomic, strong) NSNumber *atr5;
@property (nonatomic, strong) NSNumber *atr6;
@property (nonatomic, strong) NSNumber *atr7;
@property (nonatomic, strong) NSNumber *atr8;

@property (nonatomic, strong) NSNumber *btr1;
@property (nonatomic, strong) NSNumber *btr2;
@property (nonatomic, strong) NSNumber *btr3;
@property (nonatomic, strong) NSNumber *btr4;
@property (nonatomic, strong) NSNumber *btr5;

- (NSPredicate *)generateAttributeQueryPredicate;

@end
