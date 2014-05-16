//
//  DrugSearchRootViewController.m
//  Pharm
//
//  Created by phsit on 5/15/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "DrugSearchRootViewController.h"

@interface DrugSearchRootViewController ()

@end

@implementation DrugSearchRootViewController

@synthesize genericName = _genericName, brandName = _brandName, therClass = _therClass, subView = _subView, genericView = _genericView, brandView = _brandView, therClassView = _therClassView;

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
    self.genericView = [self.storyboard instantiateViewControllerWithIdentifier:@"genericView"];
    NSLog(@"genericView is %@", self.genericView);
    
    //self.subView = self.genericView.view;
    [self.subView addSubview:self.genericView.view];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    GenSearchViewController *genericSearchView = [[GenSearchViewController alloc]init];
    self.subView = genericSearchView.view;
    [self.view addSubview:self.subView];
    [self.subView setNeedsDisplay];
    
    /*if (item == self.genericName) {
        GenSearchViewController *genericSearchView = [[GenSearchViewController alloc]init];
        self.subView = genericSearchView.view;
        [self.subView setNeedsDisplay];
    }
    if (item == self.brandName) {
        BraSearchViewController *brandSearchView = [[BraSearchViewController alloc]init];
        [self.view addSubview:brandSearchView.view];
    }
    if (item == self.therClass){
        TherClassSearchViewController *therClassSearchView = [[TherClassSearchViewController alloc]init];
        [self.view addSubview:therClassSearchView.view];
    }
    NSLog(@"selected %@", item);
    */
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
