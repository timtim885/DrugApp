//
//  QuizVC.m
//  PharmD
//
//  Created by PHSIT on 9/20/13.
//  Copyright (c) 2013 Pharmacy and Health Science. All rights reserved.
//

#import "QuizVC.h"
#import "Drug.h"
//#import "DrugDB.h"
#import "Scoring.h"
#import <objc/runtime.h>


@interface QuizVC ()

@end

@implementation QuizVC

@synthesize propertyList;
@synthesize corrAns;
@synthesize wrongAns1;
@synthesize wrongAns2;
@synthesize wrongAns3;
@synthesize propertyselect;
@synthesize Question;

@synthesize rightAns;
@synthesize rightAnstxt;
@synthesize wrongAnstxt1;
@synthesize wrongAnstxt2;
@synthesize wrongAnstxt3;

@synthesize answerList;

@synthesize wrongAnsSelected;

@synthesize quizScore;


@synthesize totalCorr;
@synthesize totalQs;



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
        self.Question.text = [NSString stringWithFormat:@"What is the generic name for %@?", corrAns.brandName];
        rightAnstxt = corrAns.genericName;
        wrongAnstxt1 = wrongAns1.genericName;
        wrongAnstxt2 = wrongAns2.genericName;
        wrongAnstxt3 = wrongAns3.genericName;
        [self changeView];
    }else if([propertyselect isEqualToString:@"brandName"]){
        self.Question.text = [NSString stringWithFormat:@"What is(are) the brand name(s) for %@?", corrAns.genericName];
        rightAnstxt = corrAns.brandName;
        wrongAnstxt1 = wrongAns1.brandName;
        wrongAnstxt2 = wrongAns2.brandName;
        wrongAnstxt3 = wrongAns3.brandName;
        [self changeView];
    }else if([propertyselect isEqualToString:@"therapueticClass"]){
        self.Question.text = [NSString stringWithFormat:@"What is the therapuetic classification of %@?", corrAns.genericName];
        rightAnstxt = corrAns.therapueticClass;
        wrongAnstxt1 = wrongAns1.therapueticClass;
        wrongAnstxt2 = wrongAns2.therapueticClass;
        wrongAnstxt3 = wrongAns3.therapueticClass;
        [self changeView];
    }else if([propertyselect isEqualToString:@"commonPurpose"]){
        self.Question.text = [NSString stringWithFormat:@"What is the common purpose for %@?", corrAns.genericName];
        rightAnstxt = corrAns.commonPurpose;
        wrongAnstxt1 = wrongAns1.commonPurpose;
        wrongAnstxt2 = wrongAns2.commonPurpose;
        wrongAnstxt3 = wrongAns3.commonPurpose;
        [self changeView];
    }else if([propertyselect isEqualToString:@"dosing"]){
        self.Question.text = [NSString stringWithFormat:@"What is the recommended dosage for %@?", corrAns.genericName];
        rightAnstxt = corrAns.dosing;
        wrongAnstxt1 = wrongAns1.dosing;
        wrongAnstxt2 = wrongAns2.dosing;
        wrongAnstxt3 = wrongAns3.dosing;
        [self changeView];
    }else if([propertyselect isEqualToString:@"commonAdverseEffects"]){
        self.Question.text = [NSString stringWithFormat:@"What are typical adverse effects of %@?", corrAns.genericName];
        rightAnstxt = corrAns.commonAdverseEffects;
        wrongAnstxt1 = wrongAns1.commonAdverseEffects;
        wrongAnstxt2 = wrongAns2.commonAdverseEffects;
        wrongAnstxt3 = wrongAns3.commonAdverseEffects;
        [self changeView];
    }else if([propertyselect isEqualToString:@"blackBoxWarning"]){
        self.Question.text = [NSString stringWithFormat:@"What is the black box warning for %@?", corrAns.genericName];
        rightAnstxt = corrAns.blackBoxWarning;
        wrongAnstxt1 = wrongAns1.blackBoxWarning;
        wrongAnstxt2 = wrongAns2.blackBoxWarning;
        wrongAnstxt3 = wrongAns3.blackBoxWarning;
        [self changeView];
    }else if([propertyselect isEqualToString:@"beersList"]){
        self.Question.text = [NSString stringWithFormat:@"Is %@ on beers list?", corrAns.genericName];
        if ([wrongAns1.beersList isEqualToString: corrAns.beersList]){
            [self selectProperty];
        }else{
            rightAnstxt = corrAns.beersList;
            wrongAnstxt1 = wrongAns1.beersList;
            wrongAnstxt2 = wrongAns2.beersList;
            wrongAnstxt3 = wrongAns3.beersList;
            [self changeView];
        }
        //self.ans3.text = wrongAns2.beersList;
        //self.ans4.text = wrongAns3.beersList;
        //NSLog(@"Beers list selected!");
    }else if([propertyselect isEqualToString:@"keypoint"]){
        self.Question.text = [NSString stringWithFormat:@"What is the key point for %@?", corrAns.genericName];
        rightAnstxt = corrAns.keyPoint;
        wrongAnstxt1 = wrongAns1.keyPoint;
        wrongAnstxt2 = wrongAns2.keyPoint;
        wrongAnstxt3 = wrongAns3.keyPoint;
        [self changeView];
        //NSLog(@"Keypoint selected!");
    /*}else if([propertyselect isEqualToString:@"picture"]){
        [self selectProperty];
    }else if([propertyselect isEqualToString:@"drugID"]){
        [self selectProperty];*/
    }else{
        [self selectProperty];
    }
    
    
    
}
-(void)changeView{
    [_rightBut1 setHidden:YES];
    [_rightBut2 setHidden:YES];
    [_rightBut3 setHidden:YES];
    [_rightBut4 setHidden:YES];
    [_WrongBut1 setHidden:YES];
    [_WrongBut2 setHidden:YES];
    [_WrongBut3 setHidden:YES];
    [_WrongBut4 setHidden:YES];
    rightAns = nil;
    if([rightAnstxt isEqualToString:wrongAnstxt1] || [rightAnstxt isEqualToString:wrongAnstxt2 ]  || [rightAnstxt isEqualToString:wrongAnstxt3] || [wrongAnstxt1 isEqualToString:wrongAnstxt2] || [wrongAnstxt1 isEqualToString:wrongAnstxt3] || [wrongAnstxt2 isEqualToString:wrongAnstxt3]){
        [self selectProperty];
    }else{
    
    int corrAnsLocation = arc4random()% 4;
    if (corrAnsLocation == 0) {
        _ans1.text = rightAnstxt;
        _ans2.text = wrongAnstxt1;
        _ans3.text = wrongAnstxt2;
        _ans4.text = wrongAnstxt3;
    [_rightBut1 setHidden:NO];
     [_WrongBut2 setHidden:NO];
     [_WrongBut3 setHidden:NO];
     [_WrongBut4 setHidden:NO];
        rightAns = _ans1;
    }else if(corrAnsLocation == 1){
        _ans1.text = wrongAnstxt1;
        _ans2.text = rightAnstxt;
        _ans3.text = wrongAnstxt2;
        _ans4.text = wrongAnstxt3;
        [_WrongBut1 setHidden:NO];
        [_rightBut2 setHidden:NO];
        [_WrongBut3 setHidden:NO];
        [_WrongBut4 setHidden:NO];
        rightAns = _ans2;
    }else if(corrAnsLocation == 2){
        _ans1.text = wrongAnstxt1;
        _ans2.text = wrongAnstxt2;
        _ans3.text = rightAnstxt;
        _ans4.text = wrongAnstxt3;
        [_WrongBut1 setHidden:NO];
        [_WrongBut2 setHidden:NO];
        [_rightBut3 setHidden:NO];
        [_WrongBut4 setHidden:NO];
        rightAns = _ans3;
    }else if(corrAnsLocation == 3){
        _ans1.text = wrongAnstxt1;
        _ans2.text = wrongAnstxt2;
        _ans3.text = wrongAnstxt3;
        _ans4.text = rightAnstxt;
        [_WrongBut1 setHidden:NO];
        [_WrongBut2 setHidden:NO];
        [_WrongBut3 setHidden:NO];
        [_rightBut4 setHidden:NO];
        rightAns = _ans4;
    }
    }
}

-(Drug *) selectObjAnswers{
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

    unsigned int varCount;
    
    /*Ivar *vars = class_copyIvarList([Drug class], &varCount);
    NSMutableArray *propertyList
    for (int i = 0;i < varCount; i++){
        Ivar var = vars[i];
        
        const char* name = ivar_getName(var);
        const char* typeEncoding = ivar_getTypeEncoding(var);
    
    }
    
    
    
}*/






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
    DrugAppAppDelegate  *appDelegate = [UIApplication sharedApplication].delegate;
    self.fetchedDrugsArray = [appDelegate getAllDrugEntries];
    if (quizScore == nil){
        quizScore = [[Scoring alloc] init];
    }
    [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
    [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
    //totalQuestionsAns.text = @"%d", totalQsAns;
    //numOfCorrAns.text = @"%d", totalCorrAns;
    //NSUInteger randomIndex = arc4random() % [drugs count];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self selectObjAnswers];
    
}

- (IBAction)wrongAnsButton:(id)sender {
    wrongAnsSelected = YES;
    [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
    [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionAutoreverse) animations:^{rightAns.textColor = [UIColor redColor];}completion:nil];
    //[UIView animateWithDuration:0.90 animations:^{rightAns.textColor = [UIColor blackColor];}];
    //[UIView animateWithDuration:0.90 animations:^{rightAns.textColor = [UIColor redColor];}];
    //[UIView animateWithDuration:0.90 animations:^{rightAns.textColor = [UIColor blackColor];}];
    //_rightBut1.backgroundColor = (__bridge UIColor *)([UIColor whiteColor].CGColor);
    //[UIView animateWithDuration:2.0 animations:^{
    //    _rightBut1.backgroundColor = (__bridge UIColor *)([UIColor redColor].CGColor);
    //} completion:NULL];
     }

- (IBAction)rightAnsButton:(id)sender {
    if (wrongAnsSelected == YES) {
        [quizScore totalAns];
        [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
        [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
        //NSLog(@"Right answer!");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        QuizVC *quizNextVC = [storyboard instantiateViewControllerWithIdentifier:@"QuizVCon"];

        [quizNextVC setQuizScore:self.quizScore];
        //[self.navigationController pushViewController:quizNextVC animated:YES];
        UINavigationController *navController = self.navigationController;
        [navController popViewControllerAnimated:NO];
        [navController pushViewController:quizNextVC animated:YES];
    }else{
        [quizScore rightAns];
        [quizScore totalAns];
        [totalQs setText:[NSString stringWithFormat:@"%ld", [quizScore totalQsAns]]];
        [totalCorr setText: [NSString stringWithFormat:@"%ld", [quizScore totalCorrAns]]];
        //NSLog(@"Right answer!");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        QuizVC *quizNextVC = [storyboard instantiateViewControllerWithIdentifier:@"QuizVCon"];
        [quizNextVC setQuizScore:self.quizScore];
        //[self.navigationController pushViewController:quizNextVC animated:YES];
        UINavigationController *navController = self.navigationController;

        [navController popViewControllerAnimated:NO];
        [navController pushViewController:quizNextVC animated:YES];
    }

}
@end
