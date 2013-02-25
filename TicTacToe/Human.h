#import <Foundation/Foundation.h>
#import "PlayerProtocol.h"

@interface Human : NSObject <PlayerProtocol>

+ (BOOL)isValidChoice:(int)choice inPossibilities:(NSArray *)possibilities;

@end
