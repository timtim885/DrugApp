//
//  FlashCards.h
//  Pharm
//
//  Created by PHSIT on 3/18/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Drug.h"

@interface FlashCards : NSObject

{
    long nextCard;
    long maxCards;
}


-(Drug *)getSelectedCard;
-(void)setSelectedCard:(Drug *)drug;


-(void)addToList:(Drug *)drug;
-(void)cycleCards;
-(NSUInteger)countCards;
-(NSMutableArray *)getList;
-(BOOL)drugIsInArray:(Drug *)drug;



@end
