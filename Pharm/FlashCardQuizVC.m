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

    flashCardsList = [[FlashCards alloc]init];
    [flashCardsList cycleCards];
    _genericName.text = [flashCardsList selectedCard].genericName;
    _brandName.text = [flashCardsList selectedCard].brandName;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)nextCard:(id)sender{
    [flashCardsList cycleCards];
    _genericName.text = [flashCardsList selectedCard].genericName;
    _brandName.text = [flashCardsList selectedCard].brandName;
    
}

    
/*UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
FlashCardQuizVC *fcNextVC = [storyboard instantiateViewControllerWithIdentifier:@"FlashcardQuiz"];
UINavigationController *navController = self.navigationController;
[navController popViewControllerAnimated:NO];
[navController pushViewController:fcNextVC animated:YES];
}*/

@end
