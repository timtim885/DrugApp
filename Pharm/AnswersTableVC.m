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

@synthesize passedQuestion, delegate, rightAns, rightBut1, rightBut2, rightBut3, rightBut4, wrongBut1,wrongBut2, wrongBut3, wrongBut4, ans1, ans2, ans3, ans4;

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
    [super viewDidLoad];
    [self changeView];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewWillAppear:(BOOL)animated{
    
    //[self changeView];
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
    [[self delegate] wrongAnswer];
}

- (IBAction)rightAnsBut:(id)sender {
    [[self delegate] rightAnswer];
}

-(void)changeView{
    NSLog(@"ChangeView ran with value %@", passedQuestion);
    [rightBut1 setHidden:YES];
    [rightBut2 setHidden:YES];
    [rightBut3 setHidden:YES];
    [rightBut4 setHidden:YES];
    [wrongBut1 setHidden:YES];
    [wrongBut2 setHidden:YES];
    [wrongBut3 setHidden:YES];
    [wrongBut4 setHidden:YES];
    rightAns = nil;
    int corrAnsLocation = arc4random()% 4;
    if (corrAnsLocation == 0) {
        ans1.text = [passedQuestion rightAnstxt];
        ans2.text = [passedQuestion wrongAnstxt1];
        ans3.text = [passedQuestion wrongAnstxt2];
        ans4.text = [passedQuestion wrongAnstxt3];
        [rightBut1 setHidden:NO];
        [wrongBut2 setHidden:NO];
        [wrongBut3 setHidden:NO];
        [wrongBut4 setHidden:NO];
        rightAns = ans1;
    }else if(corrAnsLocation == 1){
        ans1.text = [passedQuestion wrongAnstxt1];
        ans2.text = [passedQuestion rightAnstxt];
        ans3.text = [passedQuestion wrongAnstxt2];
        ans4.text = [passedQuestion wrongAnstxt3];
        [wrongBut1 setHidden:NO];
        [rightBut2 setHidden:NO];
        [wrongBut3 setHidden:NO];
        [wrongBut4 setHidden:NO];
        rightAns = ans2;
    }else if(corrAnsLocation == 2){
        ans1.text = [passedQuestion wrongAnstxt1];
        ans2.text = [passedQuestion wrongAnstxt2];
        ans3.text = [passedQuestion rightAnstxt];
        ans4.text = [passedQuestion wrongAnstxt3];
        [wrongBut1 setHidden:NO];
        [wrongBut2 setHidden:NO];
        [rightBut3 setHidden:NO];
        [wrongBut4 setHidden:NO];
        rightAns = ans3;
    }else if(corrAnsLocation == 3){
        ans1.text = [passedQuestion wrongAnstxt1];
        ans2.text = [passedQuestion wrongAnstxt2];
        ans3.text = [passedQuestion wrongAnstxt3];
        ans4.text = [passedQuestion rightAnstxt];
        [wrongBut1 setHidden:NO];
        [wrongBut2 setHidden:NO];
        [wrongBut3 setHidden:NO];
        [rightBut4 setHidden:NO];
        rightAns = ans4;
    }
    
    NSLog(@"%@", rightAns.text);
}

@end
