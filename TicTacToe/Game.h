#import <Foundation/Foundation.h>
#import "Board.h"
#import "Player.h"
#import "Computer.h"

@interface Game : NSObject

@property (strong, nonatomic) Board *gameBoard;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) Computer *computer;

- (BOOL)startGame;
- (void)nextTurn:(NSString *)next;
- (BOOL)checkVictory;
- (BOOL)checkForXVictory:(id)array;
- (BOOL)checkForOVictory:(id)array;

@end
