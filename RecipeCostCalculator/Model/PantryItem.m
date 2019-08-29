//
//  PantryItem.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "PantryItem.h"

static NSString * const kOunceString = @"Ounce";
static NSString * const kPoundString = @"Pound";
static NSString * const kPieceString = @"Piece";
static NSString * const kLiterString = @"Liter";
static NSString * const kGallonString = @"Gallon";

NSString * stringForAmountUnit(PantryItemUnit unit) {
    switch (unit) {
        case PantryItemUnitOunces: {
            return kOunceString;
        }
            
        case PantryItemUnitPounds: {
            return kPoundString;
        }
            
        case PantryItemUnitPiece: {
            return kPieceString;
        }
            
        case PantryItemUnitLiters: {
            return kLiterString;
        }
            
        case PantryItemUnitGallons: {
            return kGallonString;
        }

        case PantryItemUnitUnknown: {
            return @"UNKNOWN";
        }
            
        default: {
            return @"";
        }
    }
}

PantryItemUnit amountUnitForString(NSString* string) {
    if ([string isEqualToString:kOunceString]) {
        return PantryItemUnitOunces;
    } else if ([string isEqualToString:kPieceString]) {
        return PantryItemUnitPiece;
    } else if ([string isEqualToString:kPoundString]) {
        return PantryItemUnitPounds;
    } else if ([string isEqualToString:kGallonString]) {
        return PantryItemUnitGallons;
    } else if ([string isEqualToString:kLiterString]) {
        return PantryItemUnitLiters;
    } else {
        return PantryItemUnitUnknown;
    }
}

NSUnit * unitForAmountUnit(PantryItemUnit unit) {
    switch (unit) {
        case PantryItemUnitOunces: {
            return NSUnitMass.ounces;
        }
            
        case PantryItemUnitPounds: {
            return NSUnitMass.poundsMass;
        }
            
        case PantryItemUnitPiece: {
            return nil;
        }
            
        case PantryItemUnitLiters: {
            return NSUnitVolume.liters;
        }
            
        case PantryItemUnitGallons: {
            return NSUnitVolume.gallons;
        }
            
        case PantryItemUnitUnknown:
        default: {
            return nil;
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
