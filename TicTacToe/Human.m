#import "Human.h"

@implementation Human

+ (int)chooseFromPossibilities:(NSArray *)choices {
    int choice;
    
    printf("Please enter a number from 1 to 9:");
    scanf("%i", &choice);
    
    while (![[self class] isValidChoice:choice inPossibilities:choices]) {
        printf("Please enter a number from 1 to 9:");
        scanf("%i", &choice);
    }
    
    return choice;
}

+ (NSString *)marker
{
    return @"X";
}

+ (BOOL)isValidChoice:(int)choice inPossibilities:(NSArray *)possibilities
{
    if (choice > 9) {
        printf("Sorry, your choice can't be above 9.\n");
        return NO;
    } else if (choice <= 0) {
        printf("Sorry, your choice can't be below 1.\n");
        return NO;
    } else if (![possibilities containsObject:[NSNumber numberWithInt:choice]]) {
        printf("That space is taken.\n");
        return NO;
    }
    return YES;
}

@end
