#import <Foundation/Foundation.h>
#import "PlayerProtocol.h"
#import "Board.h"

@interface Game : NSObject

@property (strong, nonatomic) Board *board;
@property (strong, nonatomic) NSArray *players;
@property (strong, nonatomic) Class <PlayerProtocol> currentPlayer;
@property (readonly, nonatomic) Class <PlayerProtocol> nextPlayer;

- (BOOL)startGame;
- (void)nextTurn:(Class <PlayerProtocol>)player;
- (BOOL)checkVictory:(Class <PlayerProtocol>)player;

@end
