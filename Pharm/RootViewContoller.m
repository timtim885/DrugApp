//
//  RootViewContoller.m
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "RootViewContoller.h"
#import "Drug.h"
#import "DrugAppAppDelegate.h"
#import "QuizVC.h"


@interface RootViewContoller ()
@end

@implementation RootViewContoller

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToQuiz:(id)sender {
    DrugAppAppDelegate *appDelegate = [[DrugAppAppDelegate alloc] init];
    if (![appDelegate getAllDrugEntries].count || ![appDelegate getAllDrugEntries] ) {
        UIAlertView *nulFCAlert = [[UIAlertView alloc] initWithTitle:@"Empty drugs list!" message:@"Your current list of drugs is empty.  Please add drugs to the list." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [nulFCAlert show];
    }else if ([appDelegate getAllDrugEntries].count < 10 ){
        UIAlertView *nulFCAlert = [[UIAlertView alloc] initWithTitle:@"Not enough drugs in list!" message:@"Your current list of drugs is to small to generate quiz questions.  You are required to have at least 10 drugs in your list. Please add drugs to your list." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [nulFCAlert show];

    }else{
    [self performSegueWithIdentifier:@"goQuizIdentifier" sender:self];
    }
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier  isEqual: @"goQuizIdentifier"]){
        NSLog(@"Ran prepareforsegue");
        QuizVC *quiz = [segue destinationViewController];
        [quiz.quizScore setZeroes];
    }
}
    
    
@end
