//
//  RecipeIngredient.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "RecipeIngredient.h"

@implementation RecipeIngredient

- (instancetype)initWithPantryItem:(PantryItem *)pantryItem amount:(NSNumber *)amount unit:(PantryItemUnit)unit
{
    self = [super init];
    if (self) {
        _pantryItem = pantryItem;
        _amount = amount;
        _amountUnit = unit;
    }
    return self;
}

@end
