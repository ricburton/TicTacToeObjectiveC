#import "Computer.h"

@implementation Computer

- (int) choose {
    printf("Computer's choice\n");
    int choice = arc4random() %9+1;
    return choice;
}

@end
