#import <Foundation/Foundation.h>
#import "Board.h"
#import "Game.h"

@interface Computer : NSObject
-(void) choose:(Board *) board inGame:(Game *) game;
@end
