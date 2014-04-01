//
//  FlashcardsRootVC.h
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCards.h"

@interface FlashcardsRootVC : UIViewController
{
    FlashCards *flashCardsList;
}
-(void)checkForEmptyFCList;
- (IBAction)studyFCList:(id)sender;


@end
