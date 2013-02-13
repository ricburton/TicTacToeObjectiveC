#import <Foundation/Foundation.h>
#include <stdlib.h>

#define LINE    printf("%s", [@"   |   |   \n" UTF8String]);
#define MIDLINE printf("%s", [@"---|---|---\n" UTF8String]);

@interface Board : NSObject

@property NSMutableArray *choices;
@property (nonatomic)  NSMutableArray *grid;
@property enum winner {human, computer};
@property NSString *turn;

-(void) createGrid;
-(void) draw;
-(void) play;

-(void) humanTurn;
-(void) computerTurn;
-(void) nextTurn;

-(BOOL)squareEmpty:(int)choice;
-(BOOL)checkForXVictory:array;
-(BOOL)checkForOVictory:array;

@end

@implementation Board
{
}

-(void) createGrid {
    NSMutableArray *grid = [NSMutableArray array];
    for (int i = 1; i <= 9; ++i) {
        NSNumber *num = [NSNumber numberWithInteger:i];
        [grid addObject:num];
    }
    self.grid = grid;
}

-(void) humanTurn {
    int choice;
    printf("Please enter a number from 1 to 9:");
    scanf("%i", &choice);  
    
    if (choice > 0 && choice <= 9) {
        if ([self squareEmpty:choice-1]) {
            printf("Thanks!\n");
            [self.grid replaceObjectAtIndex:choice - 1 withObject:@"X"];
            [self draw];
            [self computerTurn];
        } else {
            printf("That square is taken \n");
        }
    } else if (choice > 9) {
        printf("Sorry, your choice can't be above 9.");
    } else if (choice < 0) {
        printf("Sorry, your choice can't be below 0.");
    } else {
        printf("Sorry, we need a number for your go");
    }
    self.turn = @"Computer";
    [self nextTurn];
}

-(void) computerTurn {
    for (int i = 1; i <= 9; ++i){
        
        int choice = arc4random() % 9;
        
        if([self squareEmpty:choice-1]) {
            [self.grid replaceObjectAtIndex:choice-1 withObject:@"O"];
            break;
        }
    }
    printf("-----------\n");
    printf(" COMPUTER \n");
    printf("-----------\n");
    [self draw];
    
    self.turn = @"Human";
    [self nextTurn];
}

-(void) nextTurn {
    if ([self checkVictory]) {
        printf("GAME OVER--");
        exit(0); //FIXME: Why does GAME OVER repeat?
    } else if ([self.turn isEqualTo:@"Human"]) {
        [self humanTurn];
        printf("Human");
    } else if ([self.turn isEqualTo:@"Computer"]){
        [self computerTurn];
        printf("Computer");
    }
}

-(BOOL)squareEmpty:(int)choice {
    if ([[self.grid objectAtIndex:choice] isNotEqualTo:@"O"] && [[self.grid objectAtIndex:choice] isNotEqualTo:@"X"]) {
        return YES;
            }
    return NO;
    
    //FIX: Intermittent(!) error:
    //  2013-02-13 15:12:06.967 TicTacToe[33213:303] *** Terminating app due to uncaught exception 'NSRangeException', reason: '*** -[__NSArrayM objectAtIndex:]: index 18446744073709551615 beyond bounds [0 .. 8]'
    //*** First throw call stack:

}

-(BOOL)checkVictory {
    NSArray *winningCombos = @[@[@0, @1, @2],
                             @[@3, @4, @5],
                             @[@6, @7, @8],
                             @[@0, @3, @6],
                             @[@1, @4, @7],
                             @[@2, @5, @8],
                             @[@0, @4, @8],
                             @[@2, @4, @6],
                            ];
    
    for (NSArray *array in winningCombos) {
        if ([self checkForXVictory:array]) {
            return YES;
        }
        if ([self checkForOVictory:array]) {
            return YES;
        }
    }
    return NO;
}

//REVIEW: Is there a better way than splitting this out into two methods?

-(BOOL)checkForXVictory:(id)array {
    if ([[self.grid objectAtIndex:[[array objectAtIndex:0] integerValue]] isEqualTo:@"X"] &&
        [[self.grid objectAtIndex:[[array objectAtIndex:1] integerValue]] isEqualTo:@"X"] &&
        [[self.grid objectAtIndex:[[array objectAtIndex:2] integerValue]] isEqualTo:@"X"]) {
        return YES;
    }
    return NO;
}

-(BOOL)checkForOVictory:(id)array {
    if ([[self.grid objectAtIndex:[[array objectAtIndex:0] integerValue]] isEqualTo:@"O"] &&
        [[self.grid objectAtIndex:[[array objectAtIndex:1] integerValue]] isEqualTo:@"O"] &&
        [[self.grid objectAtIndex:[[array objectAtIndex:2] integerValue]] isEqualTo:@"O"]) {
        return YES;
    }
    return NO;
}

-(void) play {
    [self createGrid];
    [self draw];
    printf("Welcome to Tic Tac Toe!\nYou will be X.\n");
    [self humanTurn];
}

-(void) draw {
    //REVIEW: Looks repetitive. Is there a neater way?
    NSString *firstLineText = [NSString stringWithFormat:@" %@ + %@ + %@ \n", [self.grid objectAtIndex:0], [self.grid objectAtIndex:1], [self.grid objectAtIndex:2]];
    NSString *secondLineText = [NSString stringWithFormat:@" %@ + %@ + %@ \n", [self.grid objectAtIndex:3], [self.grid objectAtIndex:4], [self.grid objectAtIndex:5]];
    NSString *thirdLineText = [NSString stringWithFormat:@" %@ + %@ + %@ \n", [self.grid objectAtIndex:6], [self.grid objectAtIndex:7], [self.grid objectAtIndex:8]];
    
    LINE
    printf("%s",[firstLineText UTF8String] );
    MIDLINE
    printf("%s",[secondLineText UTF8String] );
    MIDLINE
    printf("%s",[thirdLineText UTF8String] );
    LINE
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Board *board = Board.new;
        [board play];
    }
    return 0;
}

