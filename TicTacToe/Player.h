#import <Foundation/Foundation.h>
#import "Board.h"
#import "Game.h"

//@class Game;

@interface Player : NSObject

-(void) choose:(Board *)board inGame:(Game *)game;

@end
