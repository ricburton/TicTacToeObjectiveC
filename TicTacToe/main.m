#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "Game.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Game *game = [[Game alloc] init];
        [game startGame];
    }
    return 0;
}

