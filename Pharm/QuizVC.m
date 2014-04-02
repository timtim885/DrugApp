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


@synthesize rightAns, ans1, ans2, ans3, ans4, nextQuestion, questionLbl;

@synthesize quizScore;
@synthesize totalCorr;
@synthesize totalQs;


-(void)changeView{
    [_rightBut1 setHidden:YES];
    [_rightBut2 setHidden:YES];
    [_rightBut3 setHidden:YES];
    [_rightBut4 setHidden:YES];
    [_WrongBut1 setHidden:YES];
    [_WrongBut2 setHidden:YES];
    [_WrongBut3 setHidden:YES];
    [_WrongBut4 setHidden:YES];
    rightAns = nil;
    int corrAnsLocation = arc4random()% 4;
    if (corrAnsLocation == 0) {
        ans1.text = [nextQuestion rightAnstxt];
        ans2.text = [nextQuestion wrongAnstxt1];
        ans3.text = [nextQuestion wrongAnstxt2];
        ans4.text = [nextQuestion wrongAnstxt3];
    [_rightBut1 setHidden:NO];
     [_WrongBut2 setHidden:NO];
     [_WrongBut3 setHidden:NO];
     [_WrongBut4 setHidden:NO];
        rightAns = ans1;
    }else if(corrAnsLocation == 1){
        ans1.text = [nextQuestion wrongAnstxt1];
        ans2.text = [nextQuestion rightAnstxt];
        ans3.text = [nextQuestion wrongAnstxt2];
        ans4.text = [nextQuestion wrongAnstxt3];
        [_WrongBut1 setHidden:NO];
        [_rightBut2 setHidden:NO];
        [_WrongBut3 setHidden:NO];
        [_WrongBut4 setHidden:NO];
        rightAns = ans2;
    }else if(corrAnsLocation == 2){
        ans1.text = [nextQuestion wrongAnstxt1];
        ans2.text = [nextQuestion wrongAnstxt2];
        ans3.text = [nextQuestion rightAnstxt];
        ans4.text = [nextQuestion wrongAnstxt3];
        [_WrongBut1 setHidden:NO];
        [_WrongBut2 setHidden:NO];
        [_rightBut3 setHidden:NO];
        [_WrongBut4 setHidden:NO];
        rightAns = ans3;
    }else if(corrAnsLocation == 3){
        ans1.text = [nextQuestion wrongAnstxt1];
        ans2.text = [nextQuestion wrongAnstxt2];
        ans3.text = [nextQuestion wrongAnstxt3];
        ans4.text = [nextQuestion rightAnstxt];
        [_WrongBut1 setHidden:NO];
        [_WrongBut2 setHidden:NO];
        [_WrongBut3 setHidden:NO];
        [_rightBut4 setHidden:NO];
        rightAns = ans4;
    }
}


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
    [self makeQuestion];
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
    [self makeQuestion];

    
}

- (IBAction)wrongAnsButton:(id)sender {
    [nextQuestion selectedWrongAns];
    [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
    [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionAutoreverse) animations:^{rightAns.textColor = [UIColor redColor];}completion:nil];
     }

- (IBAction)rightAnsButton:(id)sender {
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

-(void)makeQuestion{
    nextQuestion = [[Question alloc] init];
    if (quizScore == nil){
        quizScore = [[Scoring alloc] init];
    }
    [nextQuestion selectObjAnswers];
    questionLbl.text = [nextQuestion questionText];
    [self changeView];
}







@end
