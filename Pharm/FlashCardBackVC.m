//
//  FlashCardBackVC.m
//  Pharm
//
//  Created by phsit on 5/7/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "FlashCardBackVC.h"

@interface FlashCardBackVC ()

@end

@implementation FlashCardBackVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setupViewWithDrug:(Drug *)selectedDrug{
    self.brandNameLbl.text = selectedDrug.brandName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
