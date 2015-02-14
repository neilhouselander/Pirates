//
//  NHCharacter.h
//  Pirates
//
//  Created by Neil Houselander on 06/02/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NHWeapon.h"
#import "NHArmor.h"

@interface NHCharacter : NSObject

@property (nonatomic) int damageDone;
@property (nonatomic) int health;
@property (strong, nonatomic) NHArmor *armor;
@property (strong, nonatomic) NHWeapon *weapon;


@end
