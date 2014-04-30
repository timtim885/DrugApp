//
//  QuizVC.m
//  PharmD
//
//  Created by PHSIT on 9/20/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "QuizVC.h"


@interface QuizVC ()

@end

@implementation QuizVC


@synthesize nextQuestion, questionLbl;

@synthesize quizScore;
@synthesize totalCorr;
@synthesize totalQs;

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
    //[self makeQuestion];
    [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
    [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //[self makeQuestion];
    
}


-(void)makeQuestion{
    nextQuestion = [[Question alloc] init];
    if (quizScore == nil){
        quizScore = [[Scoring alloc] init];
    }
    [nextQuestion selectObjAnswers];
    questionLbl.text = [nextQuestion questionText];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [self makeQuestion];
    if ([segue.identifier isEqualToString:@"ansTableSegue"]){
        AnswersTableVC *embed = segue.destinationViewController;
        [embed setDelegate:self];
        embed.passedQuestion = nextQuestion;
        //segue.destinationViewController setPassedQuestion:self.nextQuestion];

        
    }
}


#pragma answerTableDelegate methods

-(void)wrongAnswer {
    [nextQuestion selectedWrongAns];
    [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
    [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
}

- (void)rightAnswer{
    if ([nextQuestion wrongAnsSelected] == YES) {
        [quizScore totalAns];
        [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
        [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
        //NSLog(@"Right answer!");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        QuizVC *quizNextVC = [storyboard instantiateViewControllerWithIdentifier:@"QuizVCon"];
        
        [quizNextVC setQuizScore:self.quizScore];
        UINavigationController *navController = self.navigationController;
        [navController popViewControllerAnimated:NO];
        [navController pushViewController:quizNextVC animated:YES];
    }else{
        [quizScore rightAns];
        [quizScore totalAns];
        [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
        [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
        //NSLog(@"Right answer!");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        QuizVC *quizNextVC = [storyboard instantiateViewControllerWithIdentifier:@"QuizVCon"];
        [quizNextVC setQuizScore:self.quizScore];
        UINavigationController *navController = self.navigationController;
        
        [navController popViewControllerAnimated:NO];
        [navController pushViewController:quizNextVC animated:YES];
    }
    
}







@end
