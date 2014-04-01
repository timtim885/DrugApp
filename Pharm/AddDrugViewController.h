//
//  AddDrugViewController.h
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddDrugViewController : UITableViewController <UITextFieldDelegate>
{
    NSString *fieldName;
}

@property (weak, nonatomic) IBOutlet UITextField *genericNameField;
@property (weak, nonatomic) IBOutlet UITextField *brandNameField;
@property (weak, nonatomic) IBOutlet UITextField *therapueticClassField;
@property (weak, nonatomic) IBOutlet UITextField *commonPurposeField;
@property (weak, nonatomic) IBOutlet UITextField *keyPointField;
@property (weak, nonatomic) IBOutlet UITextField *dosingField;
@property (weak, nonatomic) IBOutlet UITextField *commonAdverseEffectsField;
@property (weak, nonatomic) IBOutlet UITextField *blackBoxWarningField;
@property (weak, nonatomic) IBOutlet UITextField *beersListField;
@property NSNumber *series;

- (IBAction)addDrugEntry:(id)sender;

-(BOOL)checkforBlankFields;
-(void)blankFieldsAlert;

@end
