//
//  FlashCardQuizVC.m
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "FlashCardQuizVC.h"
#import "FlashCards.h"
#import "FlashCardBackVC.h"
#import "FlashCardFrontVC.h"

@interface FlashCardQuizVC ()

@end

@implementation FlashCardQuizVC


@synthesize selectedCard; //, frontCard;

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


-(IBAction)nextCard:(id)sender{
    [self goToNextCard];
    
}

-(void)goToNextCard{
    [flashCardsList cycleCards];
    frontCard.passedCard = [flashCardsList selectedCard];
    [frontCard setFields];
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (!flashCardsList){
        flashCardsList = [[FlashCards alloc]init];
    }
    [flashCardsList cycleCards];
    
    if ([[segue identifier] isEqualToString:@"flashCardShowSegue"]){
        frontCard = segue.destinationViewController;
            //[frontCard setDelegate:self];
        frontCard.passedCard = [flashCardsList selectedCard];
        [frontCard setFields];
    }
}*/


@end
