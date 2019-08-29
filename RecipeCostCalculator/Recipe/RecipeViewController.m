//
//  RecipeViewController.m
//  RecipeCostCalculator
//
//  Created by Michael Biggs on 8/24/19.
//  Copyright © 2019 Michael Biggs. All rights reserved.
//

#import "RecipeViewController.h"

#import "Model.h"
#import "Recipe.h"
#import "TextCell.h"

#import "NSNumberFormatter+RCC.h"

@interface RecipeViewController ()

@property (nonatomic, nonnull) IBOutlet UITableView * tableView;

@end

@implementation RecipeViewController
{
    NSArray<Recipe*>* _recipes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"textCell"];
    
    _recipes = [[Model sharedModel] recipes];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_recipes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TextCell * cell = [tableView dequeueReusableCellWithIdentifier:@"textCell"];
    
    Recipe * recipe = [_recipes objectAtIndex:[indexPath row]];
    
    [[cell primaryLabel] setText:[recipe name]];
    [[cell secondaryLabel] setText:[[NSNumberFormatter sharedCurrencyFormatter] stringFromNumber:[recipe calculatedCost]]];
    
    return cell;
}

@end
