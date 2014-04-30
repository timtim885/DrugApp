//
//  FlashCardFrontVC.h
//  Pharm
//
//  Created by PHSIT on 4/3/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Drug.h"
#import "FlashCardBackVC.h"


@interface FlashCardFrontVC : UIViewController

{
    UISwipeGestureRecognizer *_swipeRightRecognizer;
}

//@property (strong, nonatomic) FlashCardBackVC *backView;
@property (strong, nonatomic) Drug *passedCard;
@property (weak, nonatomic) IBOutlet UILabel *genericName;
@property (weak, nonatomic) IBOutlet UILabel *brandName;

//@property (retain) UISwipeGestureRecognizer *swipeRightRecognizer;

-(void)setFields;



@end
