//
//  TextCell.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextCell : UITableViewCell

@property (nonatomic, nonnull) IBOutlet UILabel * primaryLabel;
@property (nonatomic, nonnull) IBOutlet UILabel * secondaryLabel;

@end

NS_ASSUME_NONNULL_END
