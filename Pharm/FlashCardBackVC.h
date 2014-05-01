//
//  FlashCardBackVC.h
//  Pharm
//
//  Created by PHSIT on 4/3/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "FlashCards.h"

@interface FlashCardBackVC : UIViewController

@property (strong, nonatomic) Drug *passedCard;
@property (strong, nonatomic) FlashCards *flashCardsList;
@property (weak, nonatomic) IBOutlet UILabel *genericName;

-(void)setViews;

@end
