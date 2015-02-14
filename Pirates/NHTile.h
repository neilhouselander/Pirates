//
//  NHTile.h
//  Pirates
//
//  Created by Neil Houselander on 30/01/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NHWeapon.h"
#import "NHArmor.h"

@interface NHTile : NSObject

@property (strong, nonatomic)NSString *story;
@property (strong, nonatomic) NSString *storyAfterButtonPressed;
@property (strong,nonatomic) UIImage *backGroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) NHWeapon *weapon;
@property (strong, nonatomic) NHArmor  *armor;
@property (nonatomic) int healthEffect;
@property (nonatomic) BOOL isTileBoss;
@property (nonatomic) BOOL beenToThisTileBefore;





@end
