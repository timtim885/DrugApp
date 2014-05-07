//
//  ContainerViewController.h
//  Pharm
//
//  Created by phsit on 5/7/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "FlashCards.h"

@interface ContainerViewController : UIViewController

@property (strong, nonatomic) Drug *selectedDrug;
@property (strong, nonatomic) FlashCards *flashCardsList;

@property (strong, nonatomic) NSString *gestureDirection;

- (void)swapViewControllers;
- (void)nextCard;

@end