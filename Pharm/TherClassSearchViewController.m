//
//  TherClassSearchViewController.m
//  Pharm
//
//  Created by PHSIT on 3/17/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//
//
//  BraSearchViewController.m
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "TherClassSearchViewController.h"
#import "DrugAppAppDelegate.h"
#import "Drug.h"
#import "DrugDetailTableViewController.h"
#import "TherClassDrugListVC.h"

@interface TherClassSearchViewController ()
@property (nonatomic, strong) NSArray *fetchedDrugsArray;
@property (nonatomic, strong) NSArray *filteredDrugsSearch;




@end

@implementation TherClassSearchViewController

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
    self.fetchedDrugsArray = [appDelegate getUniqueClassDrugEntries];
    [self.tableView reloadData];
    
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getUniqueClassDrugEntries];
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
        
        NSDictionary *dict = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        cell.textLabel.text = [dict objectForKey:@"therapueticClass"];
        //cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.therapueticClass];
        
    }else{
        NSDictionary *dict = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        //Drug *drug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        //cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.therapueticClass];
        cell.textLabel.text = [dict objectForKey:@"therapueticClass"];
        
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TherClassDrugListVC *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"TherClassDrugList"];
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        NSDictionary *dict = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        detailController.selectedDrug = [dict objectForKey:@"therapueticClass"];
        
    }else{
        NSDictionary *dict = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        detailController.selectedDrug = [dict objectForKey:@"therapueticClass"];
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
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"therapueticClass contains[c] %@", searchText];
    self.filteredDrugsSearch = [self.fetchedDrugsArray filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
    
}
@end

