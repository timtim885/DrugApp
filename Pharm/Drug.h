//
//  Drug.h
//  Pharm
//
//  Created by PHSIT on 3/5/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Drug : NSManagedObject
@property (strong, nonatomic) NSString *genericName;
@property (strong, nonatomic) NSString *brandName;
@property (strong, nonatomic) NSString *therapueticClass;
@property (strong, nonatomic) NSString *beersList;
@property (strong, nonatomic) NSString *blackBoxWarning;
@property (strong, nonatomic) NSString *commonAdverseEffects;
@property (strong, nonatomic) NSString *commonPurpose;
@property (strong, nonatomic) NSString *dosing;
@property (strong, nonatomic) NSString *keyPoint;
@property NSNumber *series;

@end
