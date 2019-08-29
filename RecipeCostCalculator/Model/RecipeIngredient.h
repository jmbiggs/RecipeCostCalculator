//
//  RecipeIngredient.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PantryItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RecipeIngredientUnit) {
    RecipeIngredientUnitTablespoon,
    RecipeIngredientUnitTeaspoon,
    RecipeIngredientUnitCup,
    RecipeIngredientUnitPiece,
    RecipeIngredientUnitCount,
    RecipeIngredientUnitUnknown,
};

NSString * stringForIngredientUnit(RecipeIngredientUnit unit);
RecipeIngredientUnit ingredientUnitForString(NSString* string);
NSUnit * unitForIngredientUnit(RecipeIngredientUnit unit);

@interface RecipeIngredient : NSObject

@property (nonatomic, nonnull) PantryItem * pantryItem;
@property (nonatomic, nonnull) NSNumber * amount;
@property (nonatomic) RecipeIngredientUnit amountUnit;

- (instancetype)initWithPantryItem:(PantryItem*)pantryItem amount:(NSNumber*)amount unit:(RecipeIngredientUnit)unit;

- (instancetype)init __attribute__((unavailable("use - initWithPantryItem:amount:unit instead")));

- (NSNumber*)cost;

@end

NS_ASSUME_NONNULL_END
