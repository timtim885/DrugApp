//
//  FlashCardBackVC.m
//  Pharm
//
//  Created by PHSIT on 4/3/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "FlashCardBackVC.h"

@interface FlashCardBackVC ()

@end

@implementation FlashCardBackVC

//@synthesize passedCard;

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
    NSLog(@"viewDidLoadRAn");
    self.passedCard = [[Drug alloc]init];
    self.flashCardsList = [[FlashCards alloc] init];
    self.passedCard = [self.flashCardsList getSelectedCard];
    [self setViews];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setViews{
    
    self.genericName.text = self.passedCard.genericName;
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
