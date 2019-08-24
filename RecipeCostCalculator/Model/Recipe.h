//
//  Recipe.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PantryItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property (nonatomic, nonnull) NSArray<PantryItem*>* ingredients;

@end

NS_ASSUME_NONNULL_END
