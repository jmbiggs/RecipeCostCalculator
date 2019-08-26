//
//  PantryItemDetailViewController.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "PantryItemDetailViewController.h"

#import "PickerCell.h"
#import "TextFieldCell.h"

#import "NSNumberFormatter+RCC.h"

typedef NS_ENUM(NSInteger, PantryItemDetailRow) {
    PantryItemDetailRowName,
    PantryItemDetailRowCost,
    PantryItemDetailRowUnit,
    PantryItemDetailRowCount,
};

@interface PantryItemDetailViewController () <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, nonnull) IBOutlet UITableView * tableView;

@end

@implementation PantryItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TextFieldCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"textFieldCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"PickerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pickerCell"];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

#pragma mark - selector

- (IBAction)cancelPressed:(id)sender
{
    [self dismiss];
}

- (IBAction)savePressed:(id)sender
{
    // TODO: update model
    [self dismiss];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return PantryItemDetailRowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case PantryItemDetailRowName: {
            return [self cellForNameRow];
        }
            
        case PantryItemDetailRowCost: {
            return [self cellForCostRow];
        }
            
        case PantryItemDetailRowUnit: {
            return [self cellForUnitRow];
        }
            
        default: {
            NSLog(@"UNIMPLEMENTED CASE FOR PANTRY DETAIL ROW");
            return nil;
        }
    }
}

#pragma mark - cells

- (UITableViewCell*)cellForNameRow {
    TextFieldCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
    
    [[cell label] setText:@"Item name:"];
    
    if (_pantryItem) {
        [[cell textField] setText:[_pantryItem name]];
    }
    [[cell textField] setKeyboardType:UIKeyboardTypeDefault];
    
    return cell;
}

- (UITableViewCell*)cellForCostRow {
    TextFieldCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
    
    [[cell label] setText:@"Cost:"];
    
    if (_pantryItem) {
        [[cell textField] setText:[[NSNumberFormatter sharedDecimalFormatter] stringFromNumber:[_pantryItem cost]]];
    } else {
        [[cell textField] setText:@"0.00"];
    }
    [[cell textField] setKeyboardType:UIKeyboardTypeDecimalPad];
    
    return cell;
}

- (UITableViewCell*)cellForUnitRow {
    PickerCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"pickerCell"];
    
    [[cell label] setText:@"Per:"];
    
    [[cell picker] setDelegate:self];
    [[cell picker] setDataSource:self];
    if (_pantryItem) {
        [[cell picker] selectRow:[_pantryItem costUnit] inComponent:0 animated:FALSE];
    }
    
    return cell;
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return PantryItemUnitCount;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return stringForAmountUnit(row);
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // TODO: handle
}

@end
