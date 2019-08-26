//
//  Model.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/26/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "Model.h"

@implementation Model
{
    NSMutableArray<PantryItem*>* _mutablePantryItems;
    NSMutableArray<Recipe*>* _mutableRecipes;
}

+ (instancetype)sharedModel
{
    static Model * model = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        model = [[Model alloc] init];
    });
    return model;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mutableRecipes = [NSMutableArray array];
        _mutablePantryItems = [NSMutableArray array];
        
        [self populateBogusData];
    }
    return self;
}

- (NSArray<PantryItem *> *)pantryItems
{
    return _mutablePantryItems;
}

- (NSArray<Recipe *> *)recipes
{
    return _mutableRecipes;
}

- (void)addPantryItem:(PantryItem *)pantryItem
{
    [_mutablePantryItems addObject:pantryItem];
}

- (void)removePantryItem:(PantryItem *)pantryItem
{
    [_mutablePantryItems removeObject:pantryItem];
}

- (void)addRecipe:(Recipe *)recipe
{
    [_mutableRecipes addObject:recipe];
}

- (void)removeRecipe:(Recipe *)recipe
{
    [_mutableRecipes removeObject:recipe];
}

- (void)save
{
    // TODO: implement
}

- (void)populateBogusData
{
    PantryItem * peppers = [[PantryItem alloc] initWithName:@"Red Peppers" cost:@(1.50) unit:PantryItemUnitPounds];
    PantryItem * bananas = [[PantryItem alloc] initWithName:@"Bananas" cost:@(0.10) unit:PantryItemUnitPiece];
    PantryItem * garlicPowder = [[PantryItem alloc] initWithName:@"Garlic Powder" cost:@(0.75) unit:PantryItemUnitOunces];
    
    [_mutablePantryItems addObjectsFromArray:@[peppers, bananas, garlicPowder]];
}

@end
