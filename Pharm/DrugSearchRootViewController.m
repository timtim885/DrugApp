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

@synthesize genericName = _genericName, brandName = _brandName, therClass = _therClass, subView = _subView, genericView = _genericView, brandView = _brandView, therClassView = _therClassView, placeHolderView = _placeHolderView;

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
    self.brandView = [self.storyboard instantiateViewControllerWithIdentifier:@"brandView"];
    self.therClassView = [self.storyboard instantiateViewControllerWithIdentifier:@"therClassView"];
    
    self.genericView.view.frame = self.subView.bounds;
    self.placeHolderView = self.genericView;
    //self.subView = self.genericView.view;
    //[self.view insertSubview:self.placeHolderView.view belowSubview:self.tabBar];
    self.placeHolderView.view.autoresizingMask = self.subView.autoresizingMask;
    [self.subView addSubview:self.placeHolderView.view];
    //[self changeConstraints];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    if (item == self.genericName){
    //self.genericView.view.frame = self.subView.bounds;
    [self.placeHolderView.view removeFromSuperview];
    self.genericView.view.frame = self.subView.bounds;
    self.genericView.view.autoresizingMask = self.subView.autoresizingMask;
    [self.subView addSubview:self.genericView.view];
    self.placeHolderView = self.genericView;

    }
    
    if (item == self.brandName){
        //self.brandView.view.frame = self.subView.bounds;
        [self.placeHolderView.view removeFromSuperview];
        self.brandView.view.frame = self.subView.bounds;
        self.brandView.view.autoresizingMask = self.subView.autoresizingMask;
        [self.subView addSubview:self.brandView.view];
        self.placeHolderView = self.brandView;
    }
    
    if (item == self.therClass){
        //self.therClassView.view.frame = self.subView.bounds;
        [self.placeHolderView.view removeFromSuperview];
        self.therClassView.view.frame = self.subView.bounds;
        self.therClassView.view.autoresizingMask = self.subView.autoresizingMask;
        [self.subView addSubview:self.therClassView.view];
        self.placeHolderView = self.therClassView;
        
    }
    else{
        
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
