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

@synthesize /*genericName = _genericName, brandName = _brandName, therClass = _therClass, */tabBar = _tabBar, /*selectedItem = _selectedItem, */containerViewController = _containerViewController;

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
    NSLog(@"containerView is currently %@", self.containerViewController);

    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%@",item.title);
    self.containerViewController.selectedItem = item.title;
    [self.containerViewController swapViewControllers];
    //if (item.tag == 0){

    //}
    
    /*if (item.tag == 2){
        //self.brandView.view.frame = self.subView.bounds;
        self.containerViewController.selectedItem = @"brandName";
        [self.containerViewController swapViewControllers];
    }
    
    if (item.tag  == 1){
        self.containerViewController.selectedItem = @"therClass";
        [self.containerViewController swapViewControllers];
    }
    else{
        NSLog(@"%@", item.title);
        NSLog(@"Error");
        self.containerViewController.selectedItem = @"genericName";
        [self.containerViewController swapViewControllers];
        
    }*/
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"embedSearchSegue"]){
        self.containerViewController = segue.destinationViewController;
        self.containerViewController.selectedItem = @"Generic Name";
        [self.containerViewController swapViewControllers];
    }
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