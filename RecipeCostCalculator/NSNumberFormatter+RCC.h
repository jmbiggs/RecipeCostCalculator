//
//  NSNumberFormatter+RCC.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/26/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumberFormatter (RCC)

+ (NSNumberFormatter*)sharedCurrencyFormatter;
+ (NSNumberFormatter*)sharedDecimalFormatter;

@end

NS_ASSUME_NONNULL_END
