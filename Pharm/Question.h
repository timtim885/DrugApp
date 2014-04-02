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
@property (strong, nonatomic) Drug *corrAns;
@property (strong, nonatomic) Drug *wrongAns1;
@property (strong, nonatomic) Drug *wrongAns2;
@property (strong, nonatomic) Drug *wrongAns3;
@property (strong, nonatomic) NSArray *fetchedDrugsArray;
@property (strong, nonatomic) NSMutableArray *propertyList;
@property (strong, nonatomic) NSMutableArray *answerList;
@property (strong, nonatomic) NSString *propertyselect;

@property (strong, nonatomic) NSString *questionText;

@property (strong, nonatomic) NSString *rightAnstxt;
@property (strong, nonatomic) NSString *wrongAnstxt1;
@property (strong, nonatomic) NSString *wrongAnstxt2;
@property (strong, nonatomic) NSString *wrongAnstxt3;

@property BOOL wrongAnsSelected;


-(NSMutableArray *)listProperties;
-(NSString *)selectProperty;
-(Drug *)selectObjAnswers;
-(void)setupAnswertext;
-(void)selectedWrongAns;

@end
