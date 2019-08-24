//
//  Recipe.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe
{
    NSMutableArray<RecipeIngredient*>* _mutableIngredients;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mutableIngredients = [NSMutableArray array];
    }
    return self;
}

- (void)addIngredient:(RecipeIngredient *)ingredient
{
    [_mutableIngredients addObject:ingredient];
}

- (void)removeIngredient:(RecipeIngredient *)ingredient
{
    [_mutableIngredients removeObject:ingredient];
}

- (NSArray<RecipeIngredient *> *)ingredients
{
    return _mutableIngredients;
}

- (NSNumber *)calculatedCost
{
    return nil;
}

@end
