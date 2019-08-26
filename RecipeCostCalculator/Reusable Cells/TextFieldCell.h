//
//  TextFieldCell.h
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/26/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextFieldCell : UITableViewCell

@property (nonatomic, nonnull) IBOutlet UILabel * label;
@property (nonatomic, nonnull) IBOutlet UITextField * textField;

@end

NS_ASSUME_NONNULL_END
