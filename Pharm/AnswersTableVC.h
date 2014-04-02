//
//  AnswersTableVC.h
//  Pharm
//
//  Created by PHSIT on 4/1/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drug.h"
#import "Question.h"

@protocol answerTableDelegate <NSObject>

-(void)wrongAnswer;
-(void)rightAnswer;

@end


@interface AnswersTableVC : UITableViewController

{
    id <answerTableDelegate> delegate;
}


@property (weak, nonatomic) IBOutlet UIButton *wrongBut1;
@property (weak, nonatomic) IBOutlet UIButton *wrongBut2;
@property (weak, nonatomic) IBOutlet UIButton *wrongBut3;
@property (weak, nonatomic) IBOutlet UIButton *wrongBut4;


@property (weak, nonatomic) IBOutlet UIButton *rightBut1;
@property (weak, nonatomic) IBOutlet UIButton *rightBut2;
@property (weak, nonatomic) IBOutlet UIButton *rightBut3;
@property (weak, nonatomic) IBOutlet UIButton *rightBut4;


@property (weak, nonatomic) IBOutlet UILabel *ans1;
@property (weak, nonatomic) IBOutlet UILabel *ans2;
@property (weak, nonatomic) IBOutlet UILabel *ans3;
@property (weak, nonatomic) IBOutlet UILabel *ans4;

@property (weak, nonatomic) IBOutlet UILabel *rightAns;

@property (retain) id delegate;

@property (strong, nonatomic) Question *passedQuestion;


- (IBAction)wrongAnsBut:(id)sender;
- (IBAction)rightAnsBut:(id)sender;





-(void)changeView;

@end
