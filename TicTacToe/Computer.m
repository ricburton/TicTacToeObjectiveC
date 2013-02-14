//
//  Computer.m
//  TicTacToe
//
//  Created by Richard Burton on 2/13/13.
//  Copyright (c) 2013 Richard Burton. All rights reserved.
//

#import "Computer.h"

@implementation Computer

-(void) choose:(Board *)board inGame:(id)game {
    for (int i = 1; i <= 9; ++i){
        
        int choice = arc4random() % 9;
        
        if([board squareEmpty:choice-1]) {
            [board.grid replaceObjectAtIndex:choice-1 withObject:@"O"];
            break;
        }
    }
    printf("-----------\n");
    printf(" COMPUTER \n");
    printf("-----------\n");
    [board draw];
    
//    [game ]
}

@end
