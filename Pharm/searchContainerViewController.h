//
//  searchContainerViewController.h
//  Pharm
//
//  Created by Tim J on 5/30/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenSearchViewController.h"
#import "BraSearchViewController.h"
#import "TherClassSearchViewController.h"

@interface searchContainerViewController : UIViewController

@property (strong, nonatomic) NSString *selectedItem;

@property (strong, nonatomic) NSString *currentSegueIdentifier;
@property (assign, nonatomic) BOOL transitionInProgress;

@property (strong, nonatomic) UIViewController *currentlySelectedViewController;

@property (strong, nonatomic) GenSearchViewController *firstViewController;
@property (strong, nonatomic) BraSearchViewController *secondViewController;
@property (strong, nonatomic) TherClassSearchViewController *thirdViewController;

@property BOOL viewDidLoadFirstRun;

-(void)swapViewControllers;

@end
