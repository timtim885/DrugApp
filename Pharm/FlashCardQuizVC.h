//
//  FlashCardQuizVC.h
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "FlashCards.h"
#import "FlashCardFrontVC.h"

@interface FlashCardQuizVC : UIViewController

{
    FlashCards *flashCardsList;
    UISwipeGestureRecognizer *_swipeRightRecognizer;
    UISwipeGestureRecognizer *_swipeLeftRecognizer;
    BOOL cardDidFlip;
}


-(IBAction)nextCard:(id)sender;
-(void)goToNextCard;
-(void)setViews;


@property (strong, nonatomic) Drug *selectedCard;

@property (retain) UISwipeGestureRecognizer *swipeRightRecognizer;
@property (retain) UISwipeGestureRecognizer *swipeLeftRecognizer;

@property (weak, nonatomic) IBOutlet UIView *backCard;
@property (weak, nonatomic) IBOutlet UIView *frontCard;


@property(weak, nonatomic) IBOutlet UIView *currentView;
@property(weak, nonatomic) IBOutlet UIView *otherview;


//Front card properties:
@property (weak, nonatomic) IBOutlet UILabel *genericName;
@property (weak, nonatomic) IBOutlet UILabel *brandName;


//Back card properties:
@property (weak, nonatomic) IBOutlet UILabel *therapueticClass;




@end
