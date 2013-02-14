#import "Player.h"

@implementation Player

-(void) choose:(Board *)board inGame:(Game *)game{
    int choice;
    printf("Please enter a number from 1 to 9:");
    scanf("%i", &choice);
    
    if (choice > 0 && choice <= 9) {
        if ([board squareEmpty:choice-1]) {
            printf("Thanks!\n");
            [board.grid replaceObjectAtIndex:choice - 1 withObject:@"X"];
            [board draw];
            return;
        } else {
            printf("That square is taken \n");
        }
    } else if (choice > 9) {
        printf("Sorry, your choice can't be above 9.\n");
        [game nextTurn:@"Human"];
    } else if (choice < 0) {
        printf("Sorry, your choice can't be below 0.\n");
        [game nextTurn:@"Human"];
    } else {
        printf("Sorry, we need a number for your go.\n");
        [game nextTurn:@"Human"];
    }
}

@end
