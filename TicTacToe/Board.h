#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (strong, nonatomic) NSMutableArray *grid;

- (void)draw;
- (BOOL)squareEmpty:(int)choice;

@end
