#import "Board.h"

#define LINE    printf("%s", [@"   |   |   \n" UTF8String]);
#define MIDLINE printf("%s", [@"---|---|---\n" UTF8String]);


@interface Board ()

- (NSString *)lineText:(NSInteger)lineNumber;

- (void)draw;

@end

@implementation Board
@synthesize grid = _grid;
@synthesize winningCombos = _winningCombos;

- (id)init
{
    self = [super init];
    if (self) {
        self.grid = [NSMutableArray arrayWithCapacity:10];
        for (int i = 1; i <= 9; ++i) {
            NSNumber *num = [NSNumber numberWithInteger:i];
            [self.grid addObject:num];
        }
        [self draw];
    }
    return self;
}

- (NSArray *)winningCombos {
    if (!_winningCombos) {
        _winningCombos = @[@[@0, @1, @2],
                           @[@3, @4, @5],
                           @[@6, @7, @8],
                           @[@0, @3, @6],
                           @[@1, @4, @7],
                           @[@2, @5, @8],
                           @[@0, @4, @8],
                           @[@2, @4, @6]
                           ];
    }
    return _winningCombos;
}

- (void)draw
{
    LINE
    printf("%s",[[self lineText:0] UTF8String] );
    MIDLINE
    printf("%s",[[self lineText:1] UTF8String] );
    MIDLINE
    printf("%s",[[self lineText:2] UTF8String] );
    LINE
}

- (NSString *)lineText:(NSInteger)lineNumber
{
    return [NSString stringWithFormat:@" %@ + %@ + %@ \n", [self.grid objectAtIndex:3 * lineNumber], [self.grid objectAtIndex:3 * lineNumber + 1], [self.grid objectAtIndex:3 * lineNumber + 2]];
}

- (void)markSquare:(NSString *)mark atSqare:(int)choice {
    [self.grid replaceObjectAtIndex:choice - 1 withObject:mark];
    [self draw];
}

- (NSArray *)possibleChoices
{
    NSMutableArray *possibilities = [NSMutableArray arrayWithCapacity:9];
    for (id obj in self.grid) {
        if ([obj isKindOfClass:[NSNumber class]]) {
            [possibilities addObject:obj];
        }
    }
    return [possibilities copy];
}

@end
