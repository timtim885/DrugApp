//
//  FlashCardListVC.h
//  PharmD
//
//  Created by PHSIT on 10/8/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCards.h"

@interface FlashCardListVC : UIViewController  <UITableViewDataSource, UITableViewDelegate>

{
    FlashCards *flashCard;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)editList:(id)sender;

@end
