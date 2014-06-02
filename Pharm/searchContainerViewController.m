//
//  searchContainerViewController.m
//  Pharm
//
//  Created by Tim J on 5/30/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "searchContainerViewController.h"


#define SegueIdentifierFirst @"embedGenSearch"
#define SegueIdentifierSecond @"embedBraSearch"
#define SegueIdentifierThird @"embedTherClassSearch"

@interface searchContainerViewController ()





@end

@implementation searchContainerViewController

static BOOL viewDidLoadFirstRun;

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
    self.transitionInProgress = NO;
    if (!viewDidLoadFirstRun){
        viewDidLoadFirstRun = YES;
        self.currentSegueIdentifier = SegueIdentifierFirst;
        //self.currentlySelectedViewController = self.firstViewController;
        //self.selectedItem = @"Generic Name";
        //[self swapViewControllers];

    }else{
        
    }
    //viewDidLoadFirstRun = YES;
    //self.currentSegueIdentifier = SegueIdentifierFirst;
    //self.currentlySelectedViewController = self.firstViewController;
    //[self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)swapViewControllers{
    {
        if (self.transitionInProgress) {
            return;
        }
        

        //self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:SegueIdentifierFirst]) ? SegueIdentifierSecond : SegueIdentifierFirst;
        
        
        if ([self.selectedItem isEqualToString:@"Generic Name"]){
            if ([self.currentSegueIdentifier  isEqual: SegueIdentifierFirst]) {
                
            }
            else{
                self.transitionInProgress = YES;
                self.currentSegueIdentifier = SegueIdentifierFirst;
                [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
            }
        }
        if ([self.selectedItem isEqualToString:@"Brand Name"]){
            if ([self.currentSegueIdentifier  isEqual: SegueIdentifierSecond]) {
                
            }
            else{
                self.transitionInProgress = YES;
                self.currentSegueIdentifier = SegueIdentifierSecond;
                [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
            }
        }
        if ([self.selectedItem isEqualToString:@"Therapuetic Class"]){
            if ([self.currentSegueIdentifier  isEqual: SegueIdentifierThird]) {
                
            }
            else{
                self.transitionInProgress = YES;
                self.currentSegueIdentifier = SegueIdentifierThird;
                [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
            }
        }
    }
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]){
        if (!self.firstViewController){
            self.firstViewController = segue.destinationViewController;
        }
        if (!viewDidLoadFirstRun){
                NSLog(@"Ran else on firstident");
                // If this is the very first time we're loading this we need to do
                // an initial load and not a swap.
                [self addChildViewController:segue.destinationViewController];
                UIView* destView = ((UIViewController *)segue.destinationViewController).view;
                destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
                destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self.view addSubview:destView];
                [segue.destinationViewController didMoveToParentViewController:self];
                self.currentlySelectedViewController = self.firstViewController;
        }
        else{
            [self swapFromViewController:self.currentlySelectedViewController toViewController:self.firstViewController];
            self.currentlySelectedViewController = self.firstViewController;
        }
            
            
        
    }

    if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        if (!self.secondViewController) {
            self.secondViewController = segue.destinationViewController;
        }
        [self swapFromViewController:self.currentlySelectedViewController toViewController:self.secondViewController];
        self.currentlySelectedViewController = self.secondViewController;
    }
    if ([segue.identifier isEqualToString:SegueIdentifierThird]) {
        if (!self.thirdViewController) {
            self.thirdViewController = segue.destinationViewController;
        }
        [self swapFromViewController:self.currentlySelectedViewController toViewController:self.thirdViewController];
        self.currentlySelectedViewController = self.thirdViewController;
    }

    
    /*if (([segue.identifier isEqualToString:SegueIdentifierThird]) && !self.thirdViewController) {
        self.thirdViewController = segue.destinationViewController;
    }*/
    //self.currentlySelectedViewController = segue.destinationViewController;
    
    // If we're going to the first view controller.
    /*if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {

        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:self.currentlySelectedViewController toViewController:self.firstViewController];
            self.currentlySelectedViewController = self.firstViewController;
        }
        else {
            NSLog(@"Ran else on firstident");
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            UIView* destView = ((UIViewController *)segue.destinationViewController).view;
            destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
            destView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:destView];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentlySelectedViewController = self.firstViewController;
        }
    }*/
    /*// By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:self.currentlySelectedViewController toViewController:self.secondViewController];
        self.currentlySelectedViewController = self.secondViewController;
    }
    
    else if ([segue.identifier isEqualToString:SegueIdentifierThird]) {
        [self swapFromViewController:self.currentlySelectedViewController toViewController:self.thirdViewController];
        self.currentlySelectedViewController = self.thirdViewController;

    }*/
    self.transitionInProgress = NO;
    NSLog(@"currentlySelectedViewController is %@", self.currentlySelectedViewController);
    NSLog(@"currentSegueIdentifier is %@", self.currentSegueIdentifier);
    NSLog(@"selectedItem is %@", self.selectedItem);

    
}



- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
            [self transitionFromViewController:fromViewController toViewController:toViewController duration:1.0 options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
            [fromViewController removeFromParentViewController];
            [toViewController didMoveToParentViewController:self];
            self.transitionInProgress = NO;
        }];
    
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
