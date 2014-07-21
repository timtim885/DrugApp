//
//  TherClassDrugListVC.h
//  Pharm
//
//  Created by phsit on 7/8/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"

@interface TherClassDrugListVC : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate, NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSString *selectedDrug;

-(void)createTherClassList;


@end
