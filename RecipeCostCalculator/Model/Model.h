//
//  Model.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/26/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Recipe.h"
#import "PantryItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

+ (instancetype)sharedModel;

- (NSArray<Recipe*>*)recipes;

- (NSArray<PantryItem*>*)pantryItems;

- (void)addPantryItem:(PantryItem*)pantryItem;

- (void)removePantryItem:(PantryItem*)pantryItem;

- (void)addRecipe:(Recipe*)recipe;

- (void)removeRecipe:(Recipe*)recipe;

- (void)save;

@end

NS_ASSUME_NONNULL_END
