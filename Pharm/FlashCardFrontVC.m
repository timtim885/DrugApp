//
//  FlashCardFrontVC.m
//  Pharm
//
//  Created by PHSIT on 4/3/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "FlashCardFrontVC.h"

@interface FlashCardFrontVC ()

@end

@implementation FlashCardFrontVC

@synthesize swipeRightRecognizer = _swipeRightRecognizer;
@synthesize passedCard, backView;

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
    UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
    swipeRightRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [swipeRightRecognizer setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:swipeRightRecognizer];
    [self setFields];
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"flashCardFlipSegue"]){
        backView = segue.destinationViewController;
        //[frontCard setDelegate:self];
        backView.passedCard = self.passedCard;
        NSLog(@"%@", backView.passedCard.genericName);
        [backView setViews];
        //segue.destinationViewController setPassedQuestion:self.nextQuestion];
    }
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
