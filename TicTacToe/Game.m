#import "Game.h"
#import "Human.h"
#import "Computer.h"

@implementation Game

- (id)init
{
    self = [super init];
    if (self) {
        self.board = [[Board alloc] init];
        self.players = [NSArray arrayWithObjects:[Human class], [Computer class], nil];
        self.currentPlayer = [self.players objectAtIndex:0];
    }
    return self;
}

- (BOOL)startGame
{
    [self nextTurn:(self.currentPlayer)];
    return 0;
}

- (void)nextTurn:(Class <PlayerProtocol>)player {
    int choice = [player chooseFromPossibilities:self.board.possibleChoices];
    [self.board markSquare:[player marker] atSqare:choice];

    if ([self checkVictory:player]) {
        printf("GAME OVER--");
        exit(0);
    } else {
        [self nextTurn:self.nextPlayer];
    }
}

- (BOOL)checkVictory:(Class <PlayerProtocol>)player{
    
    for (NSArray *winningArray in self.board.winningCombos) {
        if ([[self.board.grid objectAtIndex:[[winningArray objectAtIndex:0] integerValue]] isEqualTo:[player marker]] &&
            [[self.board.grid objectAtIndex:[[winningArray objectAtIndex:1] integerValue]] isEqualTo:[player marker]] &&
            [[self.board.grid objectAtIndex:[[winningArray objectAtIndex:2] integerValue]] isEqualTo:[player marker]]) {
            return YES;
        }
    }
    return NO;
}

- (Class <PlayerProtocol>)nextPlayer
{
    NSInteger index = [self.players indexOfObject:self.currentPlayer];
    self.currentPlayer = [self.players objectAtIndex:(index + 1) % self.players.count];
    return self.currentPlayer;
}

@end
