//
//  DrugDetailViewController.h
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "FlashCards.h"


@interface DrugDetailViewController : UIViewController <UITextFieldDelegate>

{
    FlashCards *flashCard;
}

@property (weak, nonatomic) IBOutlet UITextField *genericNameField;
@property (weak, nonatomic) IBOutlet UITextField *brandNameField;
@property (weak, nonatomic) IBOutlet UITextField *therapueticClassField;
@property (weak, nonatomic) IBOutlet UITextField *beersListField;
@property (weak, nonatomic) IBOutlet UITextField *blackBoxWarningField;
@property (weak, nonatomic) IBOutlet UITextField *commonAdverseEffectsField;
@property (weak, nonatomic) IBOutlet UITextField *commonPurposeField;
@property (weak, nonatomic) IBOutlet UITextField *dosingField;
@property (weak, nonatomic) IBOutlet UITextField *keyPointField;


@property (nonatomic, strong) Drug *selectedDrug;

//@property (nonatomic, strong) FlashCards *flashCard;

- (IBAction)savePressed:(id)sender;
- (IBAction)addToFlashCards:(id)sender;

@end