//
//  FlashCardQuizVC.m
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "FlashCardQuizVC.h"
#import "ContainerViewController.h"

@interface FlashCardQuizVC ()
@property (nonatomic, weak) ContainerViewController *containerViewController;
@end

@implementation FlashCardQuizVC


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
    UISwipeGestureRecognizer *gestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerRight:)];
    [gestureRecognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:gestureRecognizerRight];
    UISwipeGestureRecognizer *gestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandlerLeft:)];
    [gestureRecognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:gestureRecognizerLeft];
}

-(void)swipeHandlerRight:(UISwipeGestureRecognizer *)recognizer{
    self.containerViewController.gestureDirection = @"right";
    [self.containerViewController swapViewControllers];
}

-(void)swipeHandlerLeft:(UISwipeGestureRecognizer *)recognizer{
    self.containerViewController.gestureDirection = @"left";
    [self.containerViewController swapViewControllers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)nextCard:(id)sender{
    [self.containerViewController nextCard];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"embedContainer"]){
        self.containerViewController = segue.destinationViewController;
    }
    
}




@end
