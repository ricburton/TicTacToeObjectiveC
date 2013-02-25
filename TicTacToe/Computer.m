#import "Computer.h"

@implementation Computer

+ (int)chooseFromPossibilities:(NSArray *)choices {
    printf("Computer's choice\n");
    int index = arc4random() % choices.count;
    return [[choices objectAtIndex:index] intValue];
}

+ (NSString *)marker
{
    return @"O";
}

@end
