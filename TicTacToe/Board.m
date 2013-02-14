#import "Board.h"

#define LINE    printf("%s", [@"   |   |   \n" UTF8String]);
#define MIDLINE printf("%s", [@"---|---|---\n" UTF8String]);


@interface Board ()

- (NSString *)lineText:(NSInteger)lineNumber;

@end

@implementation Board

@synthesize grid = _grid;

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

-(BOOL)squareEmpty:(int)choice {
    if ([[self.grid objectAtIndex:choice] isNotEqualTo:@"O"] && [[self.grid objectAtIndex:choice] isNotEqualTo:@"X"]) {
        return YES;
    }
    return NO;
}

@end
