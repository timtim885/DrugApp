//
//  Question.m
//  Pharm
//
//  Created by Tim J on 4/1/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "Question.h"
#import <objc/runtime.h>

@implementation Question

@synthesize corrAns, wrongAns1, wrongAns2, wrongAns3, propertyList, answerList, fetchedDrugsArray, propertyselect, rightAnstxt, wrongAnstxt1, wrongAnstxt2,wrongAnstxt3, questionText, wrongAnsSelected, emptyDrugList;

-(NSMutableArray *)listProperties{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([Drug class], &count);
    propertyList = [[NSMutableArray alloc]initWithCapacity: 20];
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [propertyList addObject:name];
    }
    free(properties);
    [self selectProperty];
    return propertyList;
}

-(NSString *)selectProperty{
    propertyselect = [propertyList objectAtIndex:arc4random()% propertyList.count];
    [self setupAnswertext];
    return propertyselect;
}



-(void)setupAnswertext{
    if([propertyselect isEqualToString:@"genericName"]){
        questionText = [NSString stringWithFormat:@"What is the generic name for %@?", corrAns.brandName];
        rightAnstxt = corrAns.genericName;
        wrongAnstxt1 = wrongAns1.genericName;
        wrongAnstxt2 = wrongAns2.genericName;
        wrongAnstxt3 = wrongAns3.genericName;
    }else if([propertyselect isEqualToString:@"brandName"]){
        questionText = [NSString stringWithFormat:@"What is(are) the brand name(s) for %@?", corrAns.genericName];
        rightAnstxt = corrAns.brandName;
        wrongAnstxt1 = wrongAns1.brandName;
        wrongAnstxt2 = wrongAns2.brandName;
        wrongAnstxt3 = wrongAns3.brandName;
    }else if([propertyselect isEqualToString:@"therapueticClass"]){
        questionText = [NSString stringWithFormat:@"What is the therapuetic classification of %@?", corrAns.genericName];
        rightAnstxt = corrAns.therapueticClass;
        wrongAnstxt1 = wrongAns1.therapueticClass;
        wrongAnstxt2 = wrongAns2.therapueticClass;
        wrongAnstxt3 = wrongAns3.therapueticClass;
    }else if([propertyselect isEqualToString:@"commonPurpose"]){
        questionText = [NSString stringWithFormat:@"What is the common purpose for %@?", corrAns.genericName];
        rightAnstxt = corrAns.commonPurpose;
        wrongAnstxt1 = wrongAns1.commonPurpose;
        wrongAnstxt2 = wrongAns2.commonPurpose;
        wrongAnstxt3 = wrongAns3.commonPurpose;
    }else if([propertyselect isEqualToString:@"dosing"]){
        questionText = [NSString stringWithFormat:@"What is the recommended dosage for %@?", corrAns.genericName];
        rightAnstxt = corrAns.dosing;
        wrongAnstxt1 = wrongAns1.dosing;
        wrongAnstxt2 = wrongAns2.dosing;
        wrongAnstxt3 = wrongAns3.dosing;
    }else if([propertyselect isEqualToString:@"commonAdverseEffects"]){
        questionText = [NSString stringWithFormat:@"What are typical adverse effects of %@?", corrAns.genericName];
        rightAnstxt = corrAns.commonAdverseEffects;
        wrongAnstxt1 = wrongAns1.commonAdverseEffects;
        wrongAnstxt2 = wrongAns2.commonAdverseEffects;
        wrongAnstxt3 = wrongAns3.commonAdverseEffects;
    }else if([propertyselect isEqualToString:@"blackBoxWarning"]){
        questionText = [NSString stringWithFormat:@"What is the black box warning for %@?", corrAns.genericName];
        rightAnstxt = corrAns.blackBoxWarning;
        wrongAnstxt1 = wrongAns1.blackBoxWarning;
        wrongAnstxt2 = wrongAns2.blackBoxWarning;
        wrongAnstxt3 = wrongAns3.blackBoxWarning;
    }else if([propertyselect isEqualToString:@"beersList"]){
        questionText = [NSString stringWithFormat:@"Is %@ on beers list?", corrAns.genericName];
        if ([wrongAns1.beersList isEqualToString: corrAns.beersList]){
            [self selectProperty];
        }else{
            rightAnstxt = corrAns.beersList;
            wrongAnstxt1 = wrongAns1.beersList;
            wrongAnstxt2 = wrongAns2.beersList;
            wrongAnstxt3 = wrongAns3.beersList;
        }
        //self.ans3.text = wrongAns2.beersList;
        //self.ans4.text = wrongAns3.beersList;
        //NSLog(@"Beers list selected!");
    }else if([propertyselect isEqualToString:@"keypoint"]){
        questionText = [NSString stringWithFormat:@"What is the key point for %@?", corrAns.genericName];
        rightAnstxt = corrAns.keyPoint;
        wrongAnstxt1 = wrongAns1.keyPoint;
        wrongAnstxt2 = wrongAns2.keyPoint;
        wrongAnstxt3 = wrongAns3.keyPoint;
        //NSLog(@"Keypoint selected!");
        /*}else if([propertyselect isEqualToString:@"picture"]){
         [self selectProperty];
         }else if([propertyselect isEqualToString:@"drugID"]){
         [self selectProperty];*/
    }else{
        if([rightAnstxt isEqualToString:wrongAnstxt1] || [rightAnstxt isEqualToString:wrongAnstxt2 ]  || [rightAnstxt isEqualToString:wrongAnstxt3] || [wrongAnstxt1 isEqualToString:wrongAnstxt2] || [wrongAnstxt1 isEqualToString:wrongAnstxt3] || [wrongAnstxt2 isEqualToString:wrongAnstxt3]){
            [self selectProperty];
        }else{
        }
        [self selectProperty];
    }
}


-(void)selectObjAnswers{
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    if (appDelegate.emptyDrugList == TRUE){
        self.emptyDrugList = TRUE;
    }else{
        self.emptyDrugList = FALSE;
        [self setupAnswers];
    }
        
}

-(Drug *)setupAnswers{
    wrongAnsSelected = NO;
    corrAns = [self.fetchedDrugsArray objectAtIndex:arc4random()% [self.fetchedDrugsArray count]];
    wrongAns1 = [self.fetchedDrugsArray objectAtIndex:arc4random()% [self.fetchedDrugsArray count]];
    wrongAns2 = [self.fetchedDrugsArray objectAtIndex:arc4random()% [self.fetchedDrugsArray count]];
    wrongAns3 = [self.fetchedDrugsArray objectAtIndex:arc4random()% [self.fetchedDrugsArray count]];
    if ([corrAns isEqual:wrongAns1] || [corrAns isEqual:wrongAns2] || [corrAns isEqual:wrongAns3] || [wrongAns1 isEqual:wrongAns2] || [wrongAns1 isEqual:wrongAns3] || [wrongAns2 isEqual:wrongAns3]){
        [self selectObjAnswers];
        }
    [self listProperties];
    return corrAns;
        
    }

-(void)selectedWrongAns{
    wrongAnsSelected = YES;
}



@end
