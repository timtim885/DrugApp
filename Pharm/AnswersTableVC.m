//
//  AnswersTableVC.m
//  Pharm
//
//  Created by PHSIT on 4/1/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "AnswersTableVC.h"

@interface AnswersTableVC ()

@end

@implementation AnswersTableVC

@synthesize passedQuestion, rightAns, delegate;

/*rightBut1=_rightBut1, rightBut2=_rightBut2, rightBut3=_rightBut3, rightBut4=_rightBut4, wrongBut1=_wrongBu,wrongBut2=wrongBut2, wrongBut3, wrongBut4, ans1, ans2, ans3, ans4;*/

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self changeView];
    [super viewDidLoad];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self changeView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)wrongAnsBut:(id)sender {
    [UIView animateWithDuration:0.25 delay:0.0 options:(UIViewAnimationOptionAutoreverse) animations:^{rightAns.textColor = [UIColor redColor];}completion:nil];
    //[[self delegate] wrongAnswer];
}

- (IBAction)rightAnsBut:(id)sender {
    //[[self delegate] rightAnswer];
}

-(void)changeView{
    NSLog(@"ChangeView ran with value %@", passedQuestion);
    [_rightBut1 setHidden:YES];
    [_rightBut2 setHidden:YES];
    [_rightBut3 setHidden:YES];
    [_rightBut4 setHidden:YES];
    [_wrongBut1 setHidden:YES];
    [_wrongBut2 setHidden:YES];
    [_wrongBut3 setHidden:YES];
    [_wrongBut4 setHidden:YES];
    rightAns = nil;
    int corrAnsLocation = arc4random()% 4;
    if (corrAnsLocation == 0) {
        _ans1.text = [passedQuestion rightAnstxt];
        _ans2.text = [passedQuestion wrongAnstxt1];
        _ans3.text = [passedQuestion wrongAnstxt2];
        _ans4.text = [passedQuestion wrongAnstxt3];
        [_rightBut1 setHidden:NO];
        [_wrongBut2 setHidden:NO];
        [_wrongBut3 setHidden:NO];
        [_wrongBut4 setHidden:NO];
        rightAns = _ans1;
    }else if(corrAnsLocation == 1){
        _ans1.text = [passedQuestion wrongAnstxt1];
        _ans2.text = [passedQuestion rightAnstxt];
        _ans3.text = [passedQuestion wrongAnstxt2];
        _ans4.text = [passedQuestion wrongAnstxt3];
        [_wrongBut1 setHidden:NO];
        [_rightBut2 setHidden:NO];
        [_wrongBut3 setHidden:NO];
        [_wrongBut4 setHidden:NO];
        rightAns = _ans2;
    }else if(corrAnsLocation == 2){
        _ans1.text = [passedQuestion wrongAnstxt1];
        _ans2.text = [passedQuestion wrongAnstxt2];
        _ans3.text = [passedQuestion rightAnstxt];
        _ans4.text = [passedQuestion wrongAnstxt3];
        [_wrongBut1 setHidden:NO];
        [_wrongBut2 setHidden:NO];
        [_rightBut3 setHidden:NO];
        [_wrongBut4 setHidden:NO];
        rightAns = _ans3;
    }else if(corrAnsLocation == 3){
        _ans1.text = [passedQuestion wrongAnstxt1];
        _ans2.text = [passedQuestion wrongAnstxt2];
        _ans3.text = [passedQuestion wrongAnstxt3];
        _ans4.text = [passedQuestion rightAnstxt];
        [_wrongBut1 setHidden:NO];
        [_wrongBut2 setHidden:NO];
        [_wrongBut3 setHidden:NO];
        [_rightBut4 setHidden:NO];
        rightAns = _ans4;
    }
    
    NSLog(@"%@", rightAns.text);
}

@end
