//
//  ContainerViewController.h
//  Pharm
//
//  Created by PHSIT on 4/30/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCardBackVC.h"
#import "FlashCardFrontVC.h"
#import "FlashCards.h"
#import "Drug.h"





@interface ContainerViewController : UIViewController

@property (strong, nonatomic) FlashCardBackVC *backView;
@property (strong, nonatomic) FlashCardFrontVC *frontView;

//@property (strong, nonatomic) Drug *selectedDrug;
//@property (strong, nonatomic) FlashCards *flashCardList;

@property (retain) UISwipeGestureRecognizer *swipeRightRecognizer;

@end
