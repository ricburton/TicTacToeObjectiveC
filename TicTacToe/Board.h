#import <Foundation/Foundation.h>
#import "Game.h"

@interface Board : NSObject <BoardDelegate>

@property (strong, nonatomic) NSMutableArray *grid;

@end
