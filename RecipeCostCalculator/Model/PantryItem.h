//
//  PantryItem.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PantryItemUnit) {
    PantryItemUnitOunces,
    PantryItemUnitPounds,
    PantryItemUnitPiece,
    PantryItemUnitCount,
    PantryItemUnitUnknown,
};

NSString * stringForAmountUnit(PantryItemUnit unit);

@interface PantryItem : NSObject

@property (nonatomic, nonnull) NSString * name;
@property (nonatomic, nonnull) NSNumber * cost;
@property (nonatomic) PantryItemUnit costUnit;

- (instancetype)initWithName:(NSString*)name cost:(NSNumber*)cost unit:(PantryItemUnit)unit;

- (instancetype)init __attribute__((unavailable("use - initWithName:cost:unit instead")));

@end

NS_ASSUME_NONNULL_END
