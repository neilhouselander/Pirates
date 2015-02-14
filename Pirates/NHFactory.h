//
//  NHFactory.h
//  Pirates
//
//  Created by Neil Houselander on 30/01/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NHCharacter.h"
#import "NHBoss.h"

@interface NHFactory : NSObject

-(NSArray *) createTiles;
-(NHCharacter *) createCharacter;
-(NHBoss *) createBoss;

@end
