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

@interface RecipeIngredient : NSObject

@property (nonatomic, nonnull) PantryItem * pantryItem;
@property (nonatomic, nonnull) NSNumber * amount;
@property (nonatomic) PantryItemUnit amountUnit;

@end

NS_ASSUME_NONNULL_END
