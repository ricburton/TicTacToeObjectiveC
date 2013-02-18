#import <Foundation/Foundation.h>

@protocol BoardDelegate <NSObject>

- (void)draw;
- (BOOL)squareEmpty:(int)choice;
- (void)markSquare:(NSString *)mark atSqare:(int)choice;
- (NSArray *)allSquares;

@end

@protocol PlayerDelegate <NSObject>

- (int)choose;

@end

@protocol ComputerDelegate <NSObject>

- (int)choose;

@end

@interface Game : NSObject

@property (strong, nonatomic) id <BoardDelegate> boardDelegate;
@property (strong, nonatomic) id <PlayerDelegate> playerDelegate;
@property (strong, nonatomic) id <ComputerDelegate> computerDelegate;

- (BOOL)startGame;
- (void)nextTurn:(NSString *)next;
- (BOOL)checkChoice;
- (BOOL)checkVictory;
- (BOOL)checkForXVictory:winningArray;
- (BOOL)checkForOVictory:winningArray;

@end
