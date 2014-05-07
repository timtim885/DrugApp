//
//  FlashCardBackVC.h
//  Pharm
//
//  Created by phsit on 5/7/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"


@interface FlashCardBackVC : UIViewController

-(void)setupViewWithDrug:(Drug *)selectedDrug;

@property (weak, nonatomic) IBOutlet UILabel *brandNameLbl;

@end
