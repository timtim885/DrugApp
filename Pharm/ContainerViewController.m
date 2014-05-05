//
//  ContainerViewController.m
//  Pharm
//
//  Created by PHSIT on 4/30/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()
@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (assign, nonatomic) BOOL transitionInProgress;

-(void)rightSwipe;

@end

@implementation ContainerViewController

@synthesize currentSegueIdentifier = _currentSegueIdentifier, transitionInProgress = _transitionInProgress, frontView = _frontView, backView = _backView;

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
    NSLog(@"Root view contoller viewdidLoad ran");
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = @"embedFirst";
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    //self.swipeRightRecognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe)];
    //self.swipeRightRecognizer.numberOfTouchesRequired = 1;
    //self.swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    //[self.view addGestureRecognizer:self.swipeRightRecognizer];
    
    // Do any additional setup after loading the view.
}
/*-(void)rightSwipe{
    if ([self.currentSegueIdentifier  isEqual: @"embedFirst"]){
        [self performSegueWithIdentifier:@"embedSecond" sender:self];
    }else{
        [self performSegueWithIdentifier:@"embedFirst" sender:self];
    }
        
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:@"embedFirst"]) && !self.frontView) {
        self.frontView = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:@"embedSecond"]) && !self.backView) {
        self.backView = segue.destinationViewController;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:@"embedFirst"]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.frontView];
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
    else if ([segue.identifier isEqualToString:@"embedSecond"]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.backView];
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers
{
    if (self.transitionInProgress) {
        return;
    }
    
    self.transitionInProgress = YES;
    self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:@"embedFirst"]) ? @"embedSecond" : @"embedFirst";
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
