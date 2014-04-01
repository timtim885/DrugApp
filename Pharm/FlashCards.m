//
//  FlashCards.m
//  Pharm
//
//  Created by PHSIT on 3/18/14.
//  Copyright (c) 2014 UOP. All rights reserved.
//

#import "FlashCards.h"

@implementation FlashCards

static NSMutableArray *flashcardList;


-(void)addToList:(Drug *)drug{
    if (!flashcardList){
        [self initList];
    
    }
        [flashcardList addObject:drug];
    
}

-(NSMutableArray *)getList{
    return flashcardList;
}

-(NSUInteger)countCards{
    return [flashcardList count];
}

-(BOOL)drugIsInArray:(Drug *)drug{
    return [flashcardList containsObject:drug];
}


/*+(FlashCards *) masterFlashList{
    static FlashCards *masterFlashList = nil;
    if (!masterFlashList){
        masterFlashList = [[super allocWithZone:nil]init];
    }
    return masterFlashList;
}
+(id) allocWithZone:(NSZone *)zone{
    return [self masterFlashList];
}

-(id) init{
    self = [super init];
    if (self){
        flashcardList = [NSMutableArray new];
    }
    return self;
}*/

-(void)initList{
    flashcardList = [[NSMutableArray alloc] init];
}



-(Drug *)cycleCards{
    if(!maxCards){
        maxCards = [flashcardList count];
        nextCard = 0;
        _selectedCard = [flashcardList objectAtIndex:nextCard];
    }else{
        nextCard++;
        if (nextCard >= maxCards){
            nextCard = 0;
        }
        _selectedCard = [flashcardList objectAtIndex:nextCard];
    }
    return _selectedCard;
}


@end
