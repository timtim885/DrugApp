//
//  FlashcardsRootVC.m
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "FlashcardsRootVC.h"
#import "FlashCards.h"

@interface FlashcardsRootVC ()

@end

@implementation FlashcardsRootVC

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
    flashCardsList = [[FlashCards alloc] init];
    [self checkForEmptyFCList];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)studyFCList:(id)sender {
    if(![flashCardsList getList] || ![flashCardsList countCards]){
        UIAlertView *nulFCAlert = [[UIAlertView alloc] initWithTitle:@"Empty Flashcards List!" message:@"Your current list of flashcards is empty.  Please add drugs to your flashcard list before selecting study." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [nulFCAlert show];
        [self performSegueWithIdentifier:@"listFCs" sender:self];
    }
        else{
            [self performSegueWithIdentifier:@"studyFCs" sender:self];
        }
}

-(void)checkForEmptyFCList{
    if(![flashCardsList getList] || ![flashCardsList countCards]){
        UIAlertView *nulFCAlert = [[UIAlertView alloc] initWithTitle:@"Empty Flashcards List!" message:@"Your current list of flashcards is empty.  Please add drugs to your flashcard list." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [nulFCAlert show];
    }
    
}

@end
