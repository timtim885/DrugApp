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

//@property (nonatomic, strong) NSMutableArray *flashcardsList;

//@property (nonatomic, strong) Drug *flashcard;
@property (weak, nonatomic) IBOutlet UILabel *genericName;
@property (weak, nonatomic) IBOutlet UILabel *brandName;

-(IBAction)nextCard:(id)sender;

@end
