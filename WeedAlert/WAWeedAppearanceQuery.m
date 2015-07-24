//
//  WAWeedAppearanceQuery.m
//  WeedAlert
//
//  Created by Zachary Klein on 2/7/14.
//  Copyright (c) 2014 Silver Chalice, LLC. All rights reserved.
//

#import "WAWeedAppearanceQuery.h"

@implementation WAWeedAppearanceQuery

- (id)init {
    
    if(!self) {
        self = [super init];
    }
    
    self.atr1 = @0;
    self.atr2 = @0;
    self.atr3 = @0;
    self.atr4 = @0;
    self.atr5 = @0;
    self.atr6 = @0;
    self.atr7 = @0;
    self.atr8 = @0;
    
    self.btr1 = @0;
    self.btr2 = @0;
    self.btr3 = @0;
    self.btr4 = @0;;
    self.btr5 = @0;
    
    return self;
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@", self.atr1, self.atr2, self.atr3, self.atr4, self.atr5, self.atr6, self.atr7, self.atr8, self.btr1, self.btr2, self.btr3, self.btr4, self.btr5];
}

- (NSPredicate *)generateAttributeQueryPredicate {
    
    NSString *query = @"";
    
    
    if([self.atr1 intValue] > 0) {
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr1 = %@", self.atr1]];
    }
    
    if([self.atr2 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr2 = %@", self.atr2]];
    }
    
    if([self.atr3 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr3 = %@", self.atr3]];
    }
    
    if([self.atr4 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr4 = %@", self.atr4]];
    }
    
    if([self.atr5 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr5 = %@", self.atr5]];
    }
    
    if([self.atr6 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr6 = %@", self.atr6]];
    }
    
    if([self.atr7 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr7 = %@", self.atr7]];
    }
    
    if([self.atr8 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"atr8 = %@", self.atr8]];
    }
    
    if([self.btr1 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"btr1 = %@", self.btr1]];
    }
    
    if([self.btr2 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"btr2 = %@", self.btr2]];
    }
    
    if([self.btr3 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"btr3 = %@", self.btr3]];
    }
    
    if([self.btr4 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"btr4 = %@", self.btr4]];
    }
    
    if([self.btr5 intValue] > 0) {
        if ([query length] > 1) {
            query = [query stringByAppendingString:@" AND "];
        }
        query = [query stringByAppendingString:[NSString stringWithFormat:@"btr5 = %@", self.btr5]];
    }

    if([query length] > 1) {
        NSPredicate *attributeQuery = [NSPredicate predicateWithFormat:query];
        
        return attributeQuery;
    } else {
        return nil;
    }
}

@end
