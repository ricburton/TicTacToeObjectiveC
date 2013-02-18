#import "Game.h"
#import "Board.h"
#import "Player.h"
#import "Computer.h"


@implementation Game

- (BOOL)startGame
{
    self.boardDelegate = [[Board alloc] init];
    self.playerDelegate = [[Player alloc] init];
    self.computerDelegate = [[Computer alloc] init];
    
    [self nextTurn:(@"Player")];
    
    return 0;
}

- (void)nextTurn:(NSString *)next {
    if ([self checkVictory]) {
        printf("GAME OVER--");
        exit(0);
    } else if ([next isEqualTo:@"Player"]) {
        int choice = [self.playerDelegate choose];
        
        if ([self checkChoice:(choice)]) {
            if ([self.boardDelegate squareEmpty:(choice)]) {
                [self.boardDelegate markSquare:@"X" atSqare:choice];
                [self.boardDelegate draw];
                [self nextTurn:(@"Computer")];
            } else {
                printf("Sorry, that space is taken.\n");
                [self nextTurn:(@"Player")];
            }
        } else {
            [self nextTurn:(@"Player")];
        }
        
    } else if ([next isEqualTo:@"Computer"]){
        int choice = [self.computerDelegate choose];
        if ([self.boardDelegate squareEmpty:(choice)]) {
            [self.boardDelegate markSquare:@"O" atSqare:choice];
            [self.boardDelegate draw];
            [self nextTurn:@"Player"];
        } else {
            [self nextTurn:@"Computer"];
        }
    }
}

- (BOOL)checkChoice:(int) choice {
    if (choice > 0 && choice <= 9) {
        return YES;
    } else if (choice > 9) {
        printf("Sorry, your choice can't be above 9.\n");
    } else if (choice < 0) {
        printf("Sorry, your choice can't be below 0.\n");
    } else {
        printf("Sorry, we need a number for your go.\n");
        return NO;
        //TODO - why does this cause an infinite loop?
        //Passing a non-integer around?
    }
    return NO;
}



- (BOOL)checkVictory {
    NSArray *winningCombos = @[@[@0, @1, @2],
    @[@3, @4, @5],
    @[@6, @7, @8],
    @[@0, @3, @6],
    @[@1, @4, @7],
    @[@2, @5, @8],
    @[@0, @4, @8],
    @[@2, @4, @6],
    ];
    
    for (NSArray *winningArray in winningCombos) {
        if ([self checkForXVictory:winningArray]) {
            return YES;
        }
        if ([self checkForOVictory:winningArray]) {
            return YES;
        }
    }
    return NO;
}

//REVIEW: Is there a better way than splitting this out into two methods?

-(BOOL)checkForXVictory:winningArray {
    NSArray *squares = [self.boardDelegate allSquares];
    
    if ([[squares objectAtIndex:[[winningArray objectAtIndex:0] integerValue]] isEqualTo:@"X"] &&
        [[squares objectAtIndex:[[winningArray objectAtIndex:1] integerValue]] isEqualTo:@"X"] &&
        [[squares objectAtIndex:[[winningArray objectAtIndex:2] integerValue]] isEqualTo:@"X"]) {
        return YES;
    }
    return NO;
}

-(BOOL)checkForOVictory:winningArray {
    NSArray *squares = [self.boardDelegate allSquares];
    
    if ([[squares objectAtIndex:[[winningArray objectAtIndex:0] integerValue]] isEqualTo:@"O"] &&
        [[squares objectAtIndex:[[winningArray objectAtIndex:1] integerValue]] isEqualTo:@"O"] &&
        [[squares objectAtIndex:[[winningArray objectAtIndex:2] integerValue]] isEqualTo:@"O"]) {
        return YES;
    }
    return NO;
}


@end
