//
//  PlayerProtocol.h
//  TicTacToe
//
//  Created by Colin Regan on 2/25/13.
//  Copyright (c) 2013 Richard Burton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PlayerProtocol <NSObject>

+ (int)chooseFromPossibilities:(NSArray *)choices;
+ (NSString *)marker;

@end
