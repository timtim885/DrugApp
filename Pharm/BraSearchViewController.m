//
//  BraSearchViewController.m
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "BraSearchViewController.h"
#import "DrugAppAppDelegate.h"
#import "Drug.h"
#import "DrugDetailTableViewController.h"

@interface BraSearchViewController ()
@property (nonatomic, strong) NSArray *fetchedDrugsArray;
@property (nonatomic, strong) NSArray *filteredDrugsSearch;




@end

@implementation BraSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[_tableView setTableHeaderView: _searchBar];
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    [self.tableView reloadData];
    
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDelegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.searchDisplayController.searchResultsTableView){
        return [self.filteredDrugsSearch count];
    }else{
        return [self.fetchedDrugsArray count];
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"drugCellIdentifier";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                                                 forIndexPath:indexPath];
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        
        Drug *drug = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.brandName];
        
    }else{
        
        Drug *drug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.brandName];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Ran.");
    DrugDetailTableViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"DrugDetailVCIdentifier"];
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        detailController.selectedDrug = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        
    }else{
        detailController.selectedDrug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
    }
    
    [self.navigationController pushViewController:detailController animated:YES];
}





/*//FIX THE BROKEN AS HELL SEARCHDISPLAYCONTROLLER!!!
 -(void)setCorrectSearchBarFrames{
 CGRect searchDisplayFrame = self.searchDisplayController.searchResultsTableView.frame;
 searchDisplayFrame.origin.y = 40.0;
 searchDisplayFrame.origin.x = 00.0;
 self.searchDisplayController.searchResultsTableView.frame = searchDisplayFrame;
 
 }
 
 -(void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller{
 controller.active = YES;
 //[self.view addSubview:controller.searchBar];
 [self.view bringSubviewToFront:controller.searchBar];
 [self setCorrectSearchBarFrames];
 
 }
 
 -(void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller{
 controller.active = YES;
 //[self.view addSubview:controller.searchBar];
 [self.view bringSubviewToFront:controller.searchBar];
 [self setCorrectSearchBarFrames];
 
 
 
 }*/



#pragma UISearchBarDelegate Methods


-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"brandName contains[c] %@", searchText];
    _filteredDrugsSearch = [self.fetchedDrugsArray filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
    
}

@end

/*@property (nonatomic, strong) NSArray *fetchedDrugsArray;
@end

@implementation BraSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    [self.tableView reloadData];
    
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.fetchedDrugsArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"drugCellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    Drug *drug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.brandName];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DrugDetailTableViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"DrugDetailVCIdentifier"];
    detailController.selectedDrug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
    
}
@end*/
