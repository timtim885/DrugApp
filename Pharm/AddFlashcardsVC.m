//
//  AddFlashcards.m
//  Pharm
//
//  Created by phsit on 6/10/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "AddFlashcardsVC.h"
#import "DrugAppAppDelegate.h"
#import "Drug.h"
#import "DrugDetailTableViewController.h"

@interface AddFlashcardsVC ()
@property (nonatomic, strong) NSArray *fetchedDrugsArray;
@property (nonatomic, strong) NSArray *filteredDrugsSearch;

@property (nonatomic, strong) Drug *selectedDrug;

@end


@implementation AddFlashcardsVC
@synthesize flashCard = _flashCard;

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
    self.flashCard = [[FlashCards alloc] init];
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
    if (!self.flashCard){
        self.flashCard = [[FlashCards alloc] init];
    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"flashCardCell"
                                                                 forIndexPath:indexPath];
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        
        Drug *drug = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.genericName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", drug.brandName];
        if ([self.flashCard drugIsInArray:drug]){
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }else{
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            //cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    }else{
        
        Drug *drug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.genericName];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", drug.brandName];
        if ([self.flashCard drugIsInArray: drug]){
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
        }else{
            [cell setAccessoryType:UITableViewCellAccessoryNone];
            //cell.accessoryType = UITableViewCellAccessoryNone;
        }

    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"flashCardCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        self.selectedDrug = [self.filteredDrugsSearch objectAtIndex:indexPath.row];
        
    }else{
        self.selectedDrug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
    }
    
    
    if ([self.flashCard drugIsInArray:self.selectedDrug]){
        [self.flashCard removeFromList:self.selectedDrug];
        [cell setAccessoryType:UITableViewCellAccessoryNone];
        //cell.accessoryType = UITableViewCellAccessoryNone;
        /*
        UIAlertView *fcError = [[UIAlertView alloc] initWithTitle:@"Flashcard already added!"
                                                          message:@"Drug is already in flashcard list."
                                                         delegate:nil
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
            [fcError show];*/
            
    }else{
            [self.flashCard addToList:self.selectedDrug];
            /*UIAlertView *fcAlert = [[UIAlertView alloc] initWithTitle:@"Flashcard added!" message:@"Drug added to flashcards." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [fcAlert show];*/
            
            [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
            //cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
            
        }


    [self.tableView reloadData];
        
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
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"genericName contains[c] %@", searchText];
    _filteredDrugsSearch = [self.fetchedDrugsArray filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
    
}


- (IBAction)Add:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
