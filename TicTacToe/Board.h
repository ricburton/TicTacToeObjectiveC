#import <Foundation/Foundation.h>

@interface Board : NSObject

@property (strong, nonatomic) NSMutableArray *grid;
@property (readonly, nonatomic) NSArray *possibleChoices;
@property (readonly, nonatomic) NSArray *winningCombos;

- (void)markSquare:(NSString *)mark atSqare:(int)choice;

@end
