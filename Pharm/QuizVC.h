//
//  QuizVC.h
//  PharmD
//
//  Created by PHSIT on 9/20/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "DrugAppAppDelegate.h"
#import "Scoring.h"

@interface QuizVC : UIViewController


@property (strong, nonatomic) Drug *corrAns;
@property (strong, nonatomic) Drug *wrongAns1;
@property (strong, nonatomic) Drug *wrongAns2;
@property (strong, nonatomic) Drug *wrongAns3;
@property (strong, nonatomic) NSArray *fetchedDrugsArray;
@property (strong, nonatomic) NSMutableArray *propertyList;
@property (strong, nonatomic) NSMutableArray *answerList;
@property (strong, nonatomic) NSString *propertyselect;

@property (strong, nonatomic) NSString *rightAnstxt;
@property (strong, nonatomic) NSString *wrongAnstxt1;
@property (strong, nonatomic) NSString *wrongAnstxt2;
@property (strong, nonatomic) NSString *wrongAnstxt3;

@property (strong, nonatomic) Scoring *quizScore;




@property BOOL wrongAnsSelected;



-(NSMutableArray *) listProperties;
-(NSString *) selectProperty;
-(Drug *) selectObjAnswers;



-(void) setupAnswertext;
-(void) changeView;

-(Drug *) getAnswer:(NSString *)answer;



@property (weak, nonatomic) IBOutlet UIButton *rightBut1;
@property (weak, nonatomic) IBOutlet UIButton *rightBut2;
@property (weak, nonatomic) IBOutlet UIButton *rightBut3;
@property (weak, nonatomic) IBOutlet UIButton *rightBut4;

@property (weak, nonatomic) IBOutlet UIButton *WrongBut1;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut2;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut3;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut4;

@property (weak, nonatomic) IBOutlet UILabel *Question;

@property (weak, nonatomic) IBOutlet UILabel *totalQs;
@property (weak, nonatomic) IBOutlet UILabel *totalCorr;


- (IBAction)wrongAnsButton:(id)sender;
- (IBAction)rightAnsButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *rightAns;
@property (weak, nonatomic) IBOutlet UILabel *ans1;
@property (weak, nonatomic) IBOutlet UILabel *ans2;
@property (weak, nonatomic) IBOutlet UILabel *ans3;
@property (weak, nonatomic) IBOutlet UILabel *ans4;

 
@end
