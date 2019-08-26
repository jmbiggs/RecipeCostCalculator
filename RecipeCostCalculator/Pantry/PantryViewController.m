//
//  PantryViewController.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "PantryViewController.h"

#import "TextCell.h"
#import "PantryItem.h"
#import "PantryItemDetailViewController.h"

#import "NSNumberFormatter+RCC.h"

@interface PantryViewController ()

@property (nonatomic, nonnull) IBOutlet UITableView * tableView;
@property (nonatomic, nonnull) IBOutlet UINavigationItem * navigationItem;

@end

@implementation PantryViewController
{
    NSArray<PantryItem*>* _pantryItems;
    PantryItem * _selectedItem;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * addBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    
    [_navigationItem setRightBarButtonItem:addBarButtonItem];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pantryCell"];
    
    [self loadPantryItems];
    [_tableView reloadData];
}

- (void)loadPantryItems
{
    [self populateBogusData];
}

- (void)populateBogusData
{
    PantryItem * peppers = [[PantryItem alloc] initWithName:@"Red Peppers" cost:@(1.50) unit:PantryItemUnitPounds];
    PantryItem * bananas = [[PantryItem alloc] initWithName:@"Bananas" cost:@(0.10) unit:PantryItemUnitPiece];
    PantryItem * garlicPowder = [[PantryItem alloc] initWithName:@"Garlic Powder" cost:@(0.75) unit:PantryItemUnitOunces];
    
    _pantryItems = @[peppers, bananas, garlicPowder];
}

#pragma mark - selector

- (void)addButtonPressed
{
    _selectedItem = nil;
    [self performSegueWithIdentifier:@"PantryItemDetail" sender:nil];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedItem = [_pantryItems objectAtIndex:[indexPath row]];
    [_tableView deselectRowAtIndexPath:indexPath animated:FALSE];
    [self performSegueWithIdentifier:@"PantryItemDetail" sender:nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_pantryItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextCell * cell = [_tableView dequeueReusableCellWithIdentifier:@"pantryCell"];
    PantryItem * pantryItem = [_pantryItems objectAtIndex:[indexPath row]];
    
    NSString * costString = [[NSNumberFormatter sharedCurrencyFormatter] stringFromNumber:[pantryItem cost]];
    NSString * unitString = stringForAmountUnit([pantryItem costUnit]);
    
    [[cell primaryLabel] setText:[pantryItem name]];
    [[cell secondaryLabel] setText:[NSString stringWithFormat:@"%@ / %@", costString, unitString]];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: implement
    
    
    return;
}

#pragma mark - UINavigationController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController * destinationController = (UINavigationController*)[segue destinationViewController];
    PantryItemDetailViewController * destinationVC = (PantryItemDetailViewController*)[[destinationController viewControllers] firstObject];
    [destinationVC setPantryItem:_selectedItem];
}

@end
