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
#import "AnswersTableVC.h"

@interface QuizVC : UIViewController <answerTableDelegate>


@property (strong, nonatomic) Scoring *quizScore;
@property (strong, nonatomic) Question *nextQuestion;



@property (weak, nonatomic) IBOutlet UILabel *questionLbl;

@property (weak, nonatomic) IBOutlet UILabel *totalQs;
@property (weak, nonatomic) IBOutlet UILabel *totalCorr;

-(void)makeQuestion;

 
@end
