//
//  FlashCardQuizVC.m
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "FlashCardQuizVC.h"
#import "FlashCards.h"

@interface FlashCardQuizVC ()

@end

@implementation FlashCardQuizVC

@synthesize swipeRightRecognizer = _swipeRightRecognizer;
@synthesize swipeLeftRecognizer = _swipeLeftRecognizer;
@synthesize selectedCard, frontCard, backCard, currentView, otherview;

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
    cardDidFlip = NO;
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRightRecognizer setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:swipeRightRecognizer];
    [self setViews];
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
    [self setViews];
}

-(void)setViews{
    _genericName.text = selectedCard.genericName;
    _brandName.text = selectedCard.brandName;
    _therapueticClass.text = selectedCard.therapueticClass;
}


-(void)rightSwipeHandle:(UISwipeGestureRecognizer *)gestureRecognizer{
    cardDidFlip = YES;
    [UIView transitionFromView:frontCard toView:backCard duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL inFinished){
        _swipeRightRecognizer = nil;
        UISwipeGestureRecognizer *swipeLeftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(leftSwipeHandle:)];
        swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [swipeLeftRecognizer setNumberOfTouchesRequired:1];
        [self.view addGestureRecognizer:swipeLeftRecognizer];
    }];
}

-(void)leftSwipeHandle:(UISwipeGestureRecognizer *)gestureRecognizer{
    [UIView transitionFromView:frontCard toView:backCard duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL inFinished){
        _swipeLeftRecognizer = nil;
        UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
        swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
        [swipeRightRecognizer setNumberOfTouchesRequired:1];
        [self.view addGestureRecognizer:swipeRightRecognizer];
    }];
}

/*-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"flashCardSegue"]){
        if (!flashCardsList){
            flashCardsList = [[FlashCards alloc]init];
        }
        [flashCardsList cycleCards];
        _frontCard = segue.destinationViewController;
            //[frontCard setDelegate:self];
        _frontCard.passedCard = [flashCardsList selectedCard];
            //segue.destinationViewController setPassedQuestion:self.nextQuestion];
    }
}*/
    
/*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
FlashCardQuizVC *fcNextVC = [storyboard instantiateViewControllerWithIdentifier:@"FlashcardQuiz"];
UINavigationController *navController = self.navigationController;
[navController popViewControllerAnimated:NO];
[navController pushViewController:fcNextVC animated:YES];
}*/

@end
