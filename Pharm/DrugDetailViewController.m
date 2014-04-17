//
//  DrugDetailViewController.m
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "DrugDetailViewController.h"
#import "DrugAppAppDelegate.h"

@interface DrugDetailViewController ()
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end


@implementation DrugDetailViewController
//@synthesize flashCard;

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
    
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)savePressed:(id)sender {
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

- (IBAction)addToFlashCards:(id)sender {
    
    if ([flashCard drugIsInArray:self.selectedDrug]){
        UIAlertView *fcError = [[UIAlertView alloc] initWithTitle:@"Flashcard already added!" message:@"Drug is already in flashcard list." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [fcError show];
        
    }else{
        [flashCard addToList:self.selectedDrug];
        UIAlertView *fcAlert = [[UIAlertView alloc] initWithTitle:@"Flashcard added!" message:@"Drug added to flashcards." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [fcAlert show];
        
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
