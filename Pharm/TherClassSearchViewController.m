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

@interface TherClassSearchViewController ()
@property (nonatomic, strong) NSArray *fetchedDrugsArray;
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
    cell.textLabel.text = [NSString stringWithFormat:@"%@",drug.therapueticClass];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DrugDetailTableViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier:@"DrugDetailVCIdentifier"];
    detailController.selectedDrug = [self.fetchedDrugsArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:detailController animated:YES];
    
}
@end

