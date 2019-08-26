//
//  PantryItemDetailViewController.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "PantryItemDetailViewController.h"

#import "Model.h"
#import "PickerCell.h"
#import "TextFieldCell.h"

#import "NSNumberFormatter+RCC.h"

typedef NS_ENUM(NSInteger, PantryItemDetailRow) {
    PantryItemDetailRowName,
    PantryItemDetailRowCost,
    PantryItemDetailRowUnit,
    PantryItemDetailRowCount,
};

@interface PantryItemDetailViewController () <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (nonatomic, nonnull) IBOutlet UITableView * tableView;

@end

@implementation PantryItemDetailViewController
{
    NSString * _currentName;
    NSNumber * _currentCost;
    PantryItemUnit _currentUnit;
    
    UITextField * _nameField;
    UITextField * _costField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TextFieldCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"textFieldCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"PickerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pickerCell"];
    
    if (!_pantryItem) {
        _currentName = @"";
        _currentCost = @(0.00);
        _currentUnit = 0;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_tableView reloadData];
}

- (void)setPantryItem:(PantryItem *)pantryItem
{
    _pantryItem = pantryItem;
    if (_pantryItem) {
        _currentName = [_pantryItem name];
        _currentCost = [_pantryItem cost];
        _currentUnit = [_pantryItem costUnit];
    }
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (BOOL)entriesAreValid
{
    // TODO: implement
    return TRUE;
}

#pragma mark - selector

- (IBAction)cancelPressed:(id)sender
{
    [self dismiss];
}

- (IBAction)savePressed:(id)sender
{
    if (![self entriesAreValid]) {
        // TODO: show popup
        return;
    }
    
    if (_pantryItem) {
        [_pantryItem setName:_currentName];
        [_pantryItem setCost:_currentCost];
        [_pantryItem setCostUnit:_currentUnit];
    } else {
        PantryItem * newPantryItem = [[PantryItem alloc] initWithName:_currentName cost:_currentCost unit:_currentUnit];
        [[Model sharedModel] addPantryItem:newPantryItem];
    }
    
    [[Model sharedModel] save];
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
    
    [[cell textField] setText:_currentName];
    [[cell textField] setKeyboardType:UIKeyboardTypeDefault];
    [[cell textField] setDelegate:self];
    _nameField = [cell textField];
    
    return cell;
}

- (UITableViewCell*)cellForCostRow {
    TextFieldCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"textFieldCell"];
    
    [[cell label] setText:@"Cost:"];
    
    [[cell textField] setText:[[NSNumberFormatter sharedDecimalFormatter] stringFromNumber:_currentCost]];
    [[cell textField] setKeyboardType:UIKeyboardTypeDecimalPad];
    [[cell textField] setDelegate:self];
    _costField = [cell textField];
    
    return cell;
}

- (UITableViewCell*)cellForUnitRow {
    PickerCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"pickerCell"];
    
    [[cell label] setText:@"Per:"];
    
    [[cell picker] setDelegate:self];
    [[cell picker] setDataSource:self];
    [[cell picker] selectRow:_currentUnit inComponent:0 animated:FALSE];
    
    return cell;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField isEqual:_nameField]) {
        _currentName = [textField text];
    } else if ([textField isEqual:_costField]) {
        _currentCost = [[NSNumberFormatter sharedDecimalFormatter] numberFromString:[textField text]];
    }
    
    return TRUE;
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
    _currentUnit = row;
}

@end
