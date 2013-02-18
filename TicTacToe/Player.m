#import "Player.h"

@implementation Player

- (int) choose {
    int choice;
    
    printf("Please enter a number from 1 to 9:");
    scanf("%i", &choice);
    
    return choice;
}

@end
