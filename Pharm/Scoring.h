//
//  Scoring.h
//  PharmD
//
//  Created by PHSIT on 10/15/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scoring : NSObject

/*{
    long totalQsAns;
    long totalCorrAns;
}*/

@property (nonatomic, assign) long totalQsAns;
@property (nonatomic, assign) long totalCorrAns;

-(void)totalAns;
-(void)rightAns;


@end
