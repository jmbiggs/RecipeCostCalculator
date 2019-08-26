//
//  NSNumberFormatter+RCC.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/26/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "NSNumberFormatter+RCC.h"

@implementation NSNumberFormatter (RCC)

+ (NSNumberFormatter*)sharedCurrencyFormatter
{
    static NSNumberFormatter * currencyFormatter = nil;
    static dispatch_once_t dispatchToken;
    dispatch_once(&dispatchToken, ^{
        currencyFormatter = [[NSNumberFormatter alloc] init];
        [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    });
    
    return currencyFormatter;
}

+ (NSNumberFormatter*)sharedDecimalFormatter
{
    static NSNumberFormatter * formatter = nil;
    static dispatch_once_t dispatchToken;
    dispatch_once(&dispatchToken, ^{
        formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setMinimumFractionDigits:2];
    });
    
    return formatter;
}

@end
