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


@interface FlashCardQuizVC : UIViewController

{
    FlashCards *flashCardsList;
}


-(IBAction)nextCard:(id)sender;
-(void)goToNextCard;


//@property (strong, nonatomic) Drug *selectedCard;

//@property (strong, nonatomic) FlashCardFrontVC *frontCard;
//@property (strong, nonatomic) FlashCardBackVC *backCard;






@end
