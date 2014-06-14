//
//  DrugAppAppDelegate.h
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrugAppAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property BOOL emptyDrugList;
@property BOOL classFetchError;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

-(NSArray *)getAllDrugEntries;
-(NSArray *)getUniqueClassDrugEntries;

@end
