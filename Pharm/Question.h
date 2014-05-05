//
//  Question.h
//  Pharm
//
//  Created by Tim J on 4/1/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DrugAppAppDelegate.h"
#import "Drug.h"

@interface Question : NSObject
@property Drug *corrAns;
@property Drug *wrongAns1;
@property Drug *wrongAns2;
@property Drug *wrongAns3;
@property NSArray *fetchedDrugsArray;
@property NSMutableArray *propertyList;
@property NSMutableArray *answerList;
@property NSString *propertyselect;

@property NSString *questionText;

@property NSString *rightAnstxt;
@property NSString *wrongAnstxt1;
@property NSString *wrongAnstxt2;
@property NSString *wrongAnstxt3;

@property BOOL wrongAnsSelected;


@property BOOL emptyDrugList;
-(NSMutableArray *)listProperties;
-(NSString *)selectProperty;
-(void)selectObjAnswers;
-(void)setupAnswertext;
-(void)selectedWrongAns;
-(Drug *)setupAnswers;

@end
