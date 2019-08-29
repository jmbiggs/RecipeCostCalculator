//
//  RecipeIngredient.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "RecipeIngredient.h"

static NSString * const kTablespoonString = @"Tablespoon";
static NSString * const kTeaspoonString = @"Teaspoon";
static NSString * const kPieceString = @"Piece";
static NSString * const kCupString = @"Cup";

NSString * stringForIngredientUnit(RecipeIngredientUnit unit) {
    switch (unit) {
        case RecipeIngredientUnitTablespoon: {
            return kTablespoonString;
        }
            
        case RecipeIngredientUnitTeaspoon: {
            return kTeaspoonString;
        }
            
        case RecipeIngredientUnitCup: {
            return kCupString;
        }
            
        case RecipeIngredientUnitPiece: {
            return kPieceString;
        }

        case RecipeIngredientUnitUnknown: {
            return @"UNKNOWN";
        }
            
        default: {
            return @"";
        }
    }
}

RecipeIngredientUnit ingredientUnitForString(NSString* string) {
    if ([string isEqualToString:kTablespoonString]) {
        return RecipeIngredientUnitTablespoon;
    } else if ([string isEqualToString:kTeaspoonString]) {
        return RecipeIngredientUnitTeaspoon;
    } else if ([string isEqualToString:kCupString]) {
        return RecipeIngredientUnitCup;
    } else if ([string isEqualToString:kPieceString]) {
        return RecipeIngredientUnitPiece;
    } else {
        return RecipeIngredientUnitUnknown;
    }
}

NSUnit * unitForIngredientUnit(RecipeIngredientUnit unit) {
    switch (unit) {
        case RecipeIngredientUnitTablespoon: {
            return NSUnitVolume.tablespoons;
        }
            
        case RecipeIngredientUnitTeaspoon: {
            return NSUnitVolume.teaspoons;
        }
            
        case RecipeIngredientUnitCup: {
            return NSUnitVolume.cups;
        }
            
        case RecipeIngredientUnitPiece: {
            return nil;
        }
            
        case RecipeIngredientUnitUnknown:
        default: {
            return nil;
        }
    }
}

@implementation RecipeIngredient

- (instancetype)initWithPantryItem:(PantryItem *)pantryItem amount:(NSNumber *)amount unit:(RecipeIngredientUnit)unit
{
    self = [super init];
    if (self) {
        _pantryItem = pantryItem;
        _amount = amount;
        _amountUnit = unit;
    }
    return self;
}

- (NSNumber *)cost
{
    if (_amountUnit == RecipeIngredientUnitPiece || [_pantryItem costUnit] == PantryItemUnitPiece) {
        
        if (_amountUnit == RecipeIngredientUnitPiece && [_pantryItem costUnit] == PantryItemUnitPiece) {
            double cost = [_amount doubleValue] * [[_pantryItem cost] doubleValue];
            return @(cost);
        }
        
        // yikes
        NSLog(@"Can't calculate when one unit is 'piece'");
        return nil;
    }
    
    NSUnit * unit = unitForIngredientUnit(_amountUnit);
    NSUnit * itemUnit = unitForAmountUnit([_pantryItem costUnit]);
    
    if (!unit || !itemUnit) {
        // yikes
        NSLog(@"Ran into unimplemented unit conversion");
        return nil;
    }
    
    NSMeasurement * ingredientMeasurement = [[NSMeasurement alloc] initWithDoubleValue:[_amount doubleValue] unit:unit];
    
    // convert unit to cost unit of pantry item
    
    NSMeasurement * converted = [ingredientMeasurement measurementByConvertingToUnit:itemUnit];
    if (!converted) {
        // yike
        NSLog(@"NSMeasurement wouldn't make the unit conversion");
        return nil;
    }
    
    double convertedAmount = [converted doubleValue];
    
    // multiply by item cost
    double cost = convertedAmount * [[_pantryItem cost] doubleValue];
    return @(cost);
}

@end
