//
//  Recipe.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RecipeIngredient.h"

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property (nonatomic, nonnull) NSString * name;
@property (nonatomic, nonnull, readonly) NSArray<RecipeIngredient*>* ingredients;

- (instancetype)initWithName:(NSString*)name ingredients:(NSArray<RecipeIngredient*>*)ingredients;

- (instancetype)init __attribute__((unavailable("use - initWithName:ingredients instead")));

- (void)addIngredient:(RecipeIngredient*)ingredient;
- (void)removeIngredient:(RecipeIngredient*)ingredient;

- (NSNumber*)calculatedCost;

@end

NS_ASSUME_NONNULL_END
