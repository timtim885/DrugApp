//
//  DrugSearchRootViewController.h
//  Pharm
//
//  Created by phsit on 5/15/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BraSearchViewController.h"
#import "GenSearchViewController.h"
#import "TherClassSearchViewController.h"

@interface DrugSearchRootViewController : UIViewController <UITabBarDelegate>
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UITabBarItem *genericName;
@property (weak, nonatomic) IBOutlet UITabBarItem *therClass;
@property (weak, nonatomic) IBOutlet UITabBarItem *brandName;

@property (strong, nonatomic) GenSearchViewController *genericView;
@property (strong, nonatomic) BraSearchViewController *brandView;
@property (strong, nonatomic) TherClassSearchViewController *therClassView;

@property (strong, nonatomic) UIViewController *placeHolderView;




@property (strong, nonatomic) IBOutlet UIView *subView;



@end
