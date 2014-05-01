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
static Drug *selectedCard;



-(void)addToList:(Drug *)drug{
    if (!flashcardList){
        flashcardList = [[NSMutableArray alloc] init];
        [flashcardList addObject:drug];
    
    }else{
        [flashcardList addObject:drug];
    }
    
}

-(NSMutableArray *)getList{
    if (!flashcardList){
        flashcardList = [[NSMutableArray alloc] init];
    }
    
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

-(void)setSelectedCard:(Drug *)drug{
    selectedCard = drug;
}

-(Drug *)getSelectedCard{
    if(!selectedCard){
        [self setSelectedCard:[[Drug alloc] init]];
        //[self cycleCards];
    }
    return selectedCard;
}






-(void)cycleCards{
    if(!maxCards){
        maxCards = [flashcardList count];
        nextCard = 0;
        [self setSelectedCard:[self.getList objectAtIndex:nextCard]];
    }else{
        nextCard++;
        if (nextCard >= maxCards){
            nextCard = 0;
        }
        [self setSelectedCard:[self.getList objectAtIndex:nextCard]];
    }
    //return selectedCard;
}

/*-(Drug *)getSelectedCard{
    if (!selectedCard) {
        [self cycleCards];
        return selectedCard;
    }
    return selectedCard;
    
}*/


@end
