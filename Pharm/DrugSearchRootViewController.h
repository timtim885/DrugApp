//
//  DrugSearchRootViewController.h
//  Pharm
//
//  Created by phsit on 5/15/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "searchContainerViewController.h"

@interface DrugSearchRootViewController : UIViewController <UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITabBar *tabBar;

//@property (weak, nonatomic) IBOutlet UITabBarItem *genericName;
//@property (weak, nonatomic) IBOutlet UITabBarItem *therClass;
//@property (weak, nonatomic) IBOutlet UITabBarItem *brandName;

//@property (strong, nonatomic) NSString *selectedItem;

@property (strong, nonatomic) searchContainerViewController *containerViewController;



@end
