//
//  ContainerViewController.m
//  Pharm
//
//  Created by phsit on 5/7/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "ContainerViewController.h"
#import "FlashCardFrontVC.h"
#import "FlashCardBackVC.h"

#define SegueIdentifierFirst @"embedFirst"
#define SegueIdentifierSecond @"embedSecond"

@interface ContainerViewController ()

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (strong, nonatomic) FlashCardFrontVC *firstViewController;
@property (strong, nonatomic) FlashCardBackVC *secondViewController;
@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

@synthesize gestureDirection = _gestureDirection, selectedDrug = _selectedDrug, flashCardsList = _flashCardsList;


- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.flashCardsList){
    self.flashCardsList = [[FlashCards alloc] init];
    }
    self.selectedDrug = [self.flashCardsList getSelectedCard];
    NSLog(@"flashcardlist is equal to %@ and selected drug is %@", self.flashCardsList, self.selectedDrug);
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:SegueIdentifierFirst]) && !self.firstViewController) {
        self.firstViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:SegueIdentifierSecond]) && !self.secondViewController) {
        self.secondViewController = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.firstViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.secondViewController];
    }
    [segue.destinationViewController setupViewWithDrug:self.selectedDrug];
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    if ([self.gestureDirection isEqualToString:@"right"]) {
        [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:^(BOOL finished) {
            [fromViewController removeFromParentViewController];
            [toViewController didMoveToParentViewController:self];
            self.transitionInProgress = NO;
        }];
    }else{
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
    }
}

- (void)swapViewControllers
{
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:SegueIdentifierFirst]) ? SegueIdentifierSecond : SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

-(void) nextCard{
    [self.flashCardsList cycleCards];
    self.selectedDrug = [self.flashCardsList getSelectedCard];
    [self.firstViewController setupViewWithDrug:self.selectedDrug];
    [self.secondViewController setupViewWithDrug:self.selectedDrug];
}



@end

