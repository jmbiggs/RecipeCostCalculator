//
//  PantryItemDetailViewController.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PantryItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface PantryItemDetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, nullable) PantryItem * pantryItem;

@end

NS_ASSUME_NONNULL_END
