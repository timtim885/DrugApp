//
//  DrugDetailTableViewController.m
//  Pharm
//
//  Created by PHSIT on 4/29/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "DrugDetailTableViewController.h"
#import "DrugAppAppDelegate.h"

@interface DrugDetailTableViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation DrugDetailTableViewController

- (IBAction)addToFlashCards:(id)sender {
    
    if ([flashCard drugIsInArray:self.selectedDrug]){
        UIAlertView *fcError = [[UIAlertView alloc] initWithTitle:@"Flashcard already added!" message:@"Drug is already in flashcard list." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [fcError show];
        
    }else{
        [flashCard addToList:self.selectedDrug];
        UIAlertView *fcAlert = [[UIAlertView alloc] initWithTitle:@"Flashcard added!" message:@"Drug added to flashcards." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [fcAlert show];
        
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)savePressed:(id)sender {
    // !self.genericNameField.text
    
    self.selectedDrug.genericName = self.genericNameField.text;
    self.selectedDrug.brandName = self.brandNameField.text;
    self.selectedDrug.therapueticClass = self.therapueticClassField.text;
    self.selectedDrug.beersList = self.beersListField.text;
    self.selectedDrug.blackBoxWarning = self.blackBoxWarningField.text;
    self.selectedDrug.commonAdverseEffects = self.commonAdverseEffectsField.text;
    self.selectedDrug.commonPurpose = self.commonPurposeField.text;
    self.selectedDrug.keyPoint = self.keyPointField.text;
    self.selectedDrug.dosing = self.dosingField.text;
    
    NSError *error;
    if(![self.managedObjectContext save:&error]){
        NSLog(@"Could not save: %@", [error localizedDescription]);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)initialSetup{
    self.genericNameField.text = self.selectedDrug.genericName;
    self.brandNameField.text = self.selectedDrug.brandName;
    self.therapueticClassField.text = self.selectedDrug.therapueticClass;
    self.beersListField.text = self.selectedDrug.beersList;
    self.blackBoxWarningField.text = self.selectedDrug.blackBoxWarning;
    self.commonAdverseEffectsField.text = self.selectedDrug.commonAdverseEffects;
    self.commonPurposeField.text = self.selectedDrug.commonPurpose;
    self.keyPointField.text = self.selectedDrug.keyPoint;
    self.dosingField.text = self.selectedDrug.dosing;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    flashCard = [[FlashCards alloc]init];
    self.genericNameField.delegate = self;
    self.brandNameField.delegate = self;
    self.therapueticClassField.delegate = self;
    self.beersListField.delegate = self;
    self.blackBoxWarningField.delegate = self;
    self.commonAdverseEffectsField.delegate = self;
    self.commonPurposeField.delegate = self;
    self.dosingField.delegate = self;
    self.keyPointField.delegate = self;
    
    [super viewDidLoad];
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    [self initialSetup];

    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
