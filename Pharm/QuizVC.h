//
//  QuizVC.h
//  PharmD
//
//  Created by PHSIT on 9/20/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Scoring.h"
#import "Question.h"

@interface QuizVC : UIViewController


@property (strong, nonatomic) Scoring *quizScore;
@property (strong, nonatomic) Question *nextQuestion;

-(void) changeView;

@property (weak, nonatomic) IBOutlet UIButton *rightBut1;
@property (weak, nonatomic) IBOutlet UIButton *rightBut2;
@property (weak, nonatomic) IBOutlet UIButton *rightBut3;
@property (weak, nonatomic) IBOutlet UIButton *rightBut4;

@property (weak, nonatomic) IBOutlet UIButton *WrongBut1;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut2;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut3;
@property (weak, nonatomic) IBOutlet UIButton *WrongBut4;

@property (weak, nonatomic) IBOutlet UILabel *questionLbl;

@property (weak, nonatomic) IBOutlet UILabel *totalQs;
@property (weak, nonatomic) IBOutlet UILabel *totalCorr;


- (IBAction)wrongAnsButton:(id)sender;
- (IBAction)rightAnsButton:(id)sender;

-(void)makeQuestion;

@property (weak, nonatomic) IBOutlet UILabel *rightAns;
@property (weak, nonatomic) IBOutlet UILabel *ans1;
@property (weak, nonatomic) IBOutlet UILabel *ans2;
@property (weak, nonatomic) IBOutlet UILabel *ans3;
@property (weak, nonatomic) IBOutlet UILabel *ans4;

 
@end
