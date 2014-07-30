//
//  AddDrugViewController.m
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "AddDrugViewController.h"
#import "Drug.h"
#import "DrugAppAppDelegate.h"

@interface AddDrugViewController ()
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end


@implementation AddDrugViewController

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
    self.genericNameField.delegate = self;
    self.brandNameField.delegate = self;
    self.therapueticClassField.delegate = self;
    self.beersListField.delegate = self;
    self.blackBoxWarningField.delegate = self;
    self.commonAdverseEffectsField.delegate = self;
    self.commonPurposeField.delegate = self;
    self.dosingField.delegate = self;
    self.keyPointField.delegate = self;    DrugAppAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addDrugEntry:(id)sender {
    //if(!self.genericNameField.text || [self.genericNameField.text  isEqual: @""])
    if([self checkforBlankFields] == NO){
    Drug *newDrug = [NSEntityDescription insertNewObjectForEntityForName:@"Drug" inManagedObjectContext:self.managedObjectContext];
    newDrug.genericName = self.genericNameField.text;
    newDrug.brandName = self.brandNameField.text;
    newDrug.therapueticClass = self.therapueticClassField.text;
    newDrug.beersList = self.beersListField.text;
    newDrug.blackBoxWarning = self.blackBoxWarningField.text;
    newDrug.commonAdverseEffects = self.commonAdverseEffectsField.text;
    newDrug.commonPurpose = self.commonPurposeField.text;
    newDrug.dosing = self.dosingField.text;
    newDrug.keyPoint = self.keyPointField.text;
    _series = [NSNumber numberWithInt:001];
    newDrug.series = _series;
    
    
    NSError *error;
    if(![self.managedObjectContext save:&error]){
        NSLog(@"Couldn't save: %@", [error localizedDescription]);
    }
    
    self.genericNameField.text = @"";
    self.brandNameField.text = @"";
    self.therapueticClassField.text = @"";
    self.beersListField.text = @"";
    self.blackBoxWarningField.text = @"";
    self.commonAdverseEffectsField.text = @"";
    self.commonPurposeField.text = @"";
    self.dosingField.text = @"";
    self.keyPointField.text = @"";
    
    [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSInteger nextTag = textField.tag +1;
    
    UIResponder *nextResponder = [textField.superview viewWithTag:nextTag];
    if(nextResponder){
        [nextResponder becomeFirstResponder];
    }
    else{
        [textField resignFirstResponder];
    }
    return NO;
}

-(BOOL)checkforBlankFields{
    fieldName = [[NSString alloc]init];
    if(!self.genericNameField.text || [self.genericNameField.text  isEqual: @""]){
        fieldName = @"Generic Name";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.brandNameField.text || [self.brandNameField.text  isEqual: @""]){
        fieldName = @"Brand Name";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.therapueticClassField.text || [self.therapueticClassField.text  isEqual: @""]){
        fieldName = @"Therapuetic Class";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.commonPurposeField.text || [self.commonPurposeField.text  isEqual: @""]){
        fieldName = @"Common Purpose";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.keyPointField.text || [self.keyPointField.text  isEqual: @""]){
        fieldName = @"Key Point";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.dosingField.text || [self.dosingField.text  isEqual: @""]){
        fieldName = @"Dosing";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.commonAdverseEffectsField.text || [self.commonAdverseEffectsField.text  isEqual: @""]){
        fieldName = @"Common Adverse Effects";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.blackBoxWarningField.text || [self.blackBoxWarningField.text  isEqual: @""]){
        fieldName = @"Black Box Warning";
        [self blankFieldsAlert];
        return YES;
    }
    if(!self.beersListField.text || [self.beersListField.text  isEqual: @""]){
        fieldName = @"Beer's List";
        [self blankFieldsAlert];
        return YES;
    }else{
           return NO;
    }

}

-(void)blankFieldsAlert{
    NSString *errorName = [NSString stringWithFormat:@"%@ field is blank.  No fields can be blank.", fieldName];
    UIAlertView *fcError = [[UIAlertView alloc] initWithTitle:@"Blank Field!" message:errorName delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [fcError show];
    
}
@end
