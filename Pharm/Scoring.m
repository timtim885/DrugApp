//
//  Scoring.m
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "Scoring.h"
//#import "QuizVC.h"

@implementation Scoring

@synthesize totalCorrAns;
@synthesize totalQsAns;


-(void)totalAns{
    totalQsAns = totalQsAns + 1;
    
}


-(void)rightAns{
    totalCorrAns = totalCorrAns + 1;
    
}


@end
