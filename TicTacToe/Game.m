#import "Game.h"

@implementation Game

- (Board *)gameBoard
{
    if (!_gameBoard) _gameBoard = [[Board alloc] init];
    return _gameBoard;
}

- (BOOL)startGame
{
    self.gameBoard = [[Board alloc] init];
    self.player    = Player.new;
    self.computer  = Computer.new;
    
    [self.player choose:self.gameBoard inGame:self];
    return 0;
}

- (void)nextTurn:(NSString *)next {
    if ([self checkVictory]) {
        printf("GAME OVER--");
        exit(0); //FIXME: Why does GAME OVER repeat?
    } else if ([next isEqualTo:@"Human"]) {
        [self.player choose:self.gameBoard inGame:self];
        printf("Human");
    } else if ([next isEqualTo:@"Computer"]){
        [self.computer choose:self.gameBoard inGame:self];
        printf("Computer");
    }
}

-(BOOL)checkVictory {
    NSArray *winningCombos = @[@[@0, @1, @2],
    @[@3, @4, @5],
    @[@6, @7, @8],
    @[@0, @3, @6],
    @[@1, @4, @7],
    @[@2, @5, @8],
    @[@0, @4, @8],
    @[@2, @4, @6],
    ];
    
    for (NSArray *array in winningCombos) {
        if ([self checkForXVictory:array]) {
            return YES;
        }
        if ([self checkForOVictory:array]) {
            return YES;
        }
    }
    return NO;
}

//REVIEW: Is there a better way than splitting this out into two methods?

-(BOOL)checkForXVictory:(id)array {
    if ([[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:0] integerValue]] isEqualTo:@"X"] &&
        [[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:1] integerValue]] isEqualTo:@"X"] &&
        [[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:2] integerValue]] isEqualTo:@"X"]) {
        return YES;
    }
    return NO;
}

-(BOOL)checkForOVictory:(id)array {
    if ([[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:0] integerValue]] isEqualTo:@"O"] &&
        [[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:1] integerValue]] isEqualTo:@"O"] &&
        [[self.gameBoard.grid objectAtIndex:[[array objectAtIndex:2] integerValue]] isEqualTo:@"O"]) {
        return YES;
    }
    return NO;
}


@end
