//
//  PantryItem.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "PantryItem.h"

NSString * stringForAmountUnit(PantryItemUnit unit) {
    switch (unit) {
        case PantryItemUnitOunces: {
            return @"Ounces";
        }
            
        case PantryItemUnitPounds: {
            return @"Pounds";
        }
            
        case PantryItemUnitPiece: {
            return @"Pieces";
        }
            
        case PantryItemUnitUnknown: {
            return @"UNKNOWN";
        }
            
        default: {
            return @"";
        }
    }
}

@implementation PantryItem

- (instancetype)initWithName:(NSString *)name cost:(NSNumber *)cost unit:(PantryItemUnit)unit
{
    self = [super init];
    if (self) {
        _name = name;
        _cost = cost;
        _costUnit = unit;
    }
    return self;
}

@end
