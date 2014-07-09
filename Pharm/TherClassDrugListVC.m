//
//  TherClassDrugListVC.m
//  Pharm
//
//  Created by phsit on 7/8/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "TherClassDrugListVC.h"
#import "DrugAppAppDelegate.h"
#import "Drug.h"
#import "DrugDetailTableViewController.h"

@interface TherClassDrugListVC ()
@property (nonatomic, strong) NSArray *fetchedDrugsArray;
@property (nonatomic, strong) NSArray *filteredDrugsSearch;

@end

@implementation TherClassDrugListVC




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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





#pragma mark - TableView methods

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
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.genericName];
        
    }else{
        
        Drug *drug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.genericName];
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

@end