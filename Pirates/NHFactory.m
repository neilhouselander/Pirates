//
//  NHFactory.m
//  Pirates
//
//  Created by Neil Houselander on 30/01/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import "NHFactory.h"
#import "NHTile.h"

@implementation NHFactory

//method to create the grid
-(NSArray *) createTiles
{
    //first create the tile objects
    //then add to a mutable array
    //add the mutable arrays to 1 new array
    //return the array from the method
    
    NHTile *tile1 = [[NHTile alloc]init];
    tile1.story = @"Captain, we need a fearless leader such as you to undertake a voyage. You must stop the evil pirate Boss before he steals any more treasure. Would you like a blunted sword to get started?";
    tile1.backGroundImage = [UIImage imageNamed:@"skull.jpg"];
    tile1.actionButtonName = @"Take the sword";
    tile1.storyAfterButtonPressed = @"You took the sword";
    
    NHWeapon *bluntedSword = [[NHWeapon alloc]init];
    bluntedSword.name = @"Blunted Sword";
    bluntedSword.damageDone = 7;
    tile1.weapon = bluntedSword;
   
        
    NHTile *tile2 = [[NHTile alloc]init];
    tile2.story = @"You have come across an armory. Would you like to upgrade your armor to steel armor?";
    tile2.backGroundImage = [UIImage imageNamed:@"piratePistols.jpg"];
    tile2.actionButtonName = @"Upgrade armor";
    tile2.storyAfterButtonPressed = @"You took the steel armor & are stonger for it";
    
    NHArmor *steelArmor = [[NHArmor alloc]init];
    steelArmor.name = @"Steel Armor";
    steelArmor.healthGained = 7;
    tile2.armor = steelArmor;
    
    
    NHTile *tile3 = [[NHTile alloc]init];
    tile3.story = @"A mysterious dock appears on the horizon. Should we stop and ask for directions?";
    tile3.backGroundImage = [UIImage imageNamed:@"dock.jpg"];
    tile3.actionButtonName = @"Stop at the dock";
    tile3.healthEffect = 17;
    tile3.storyAfterButtonPressed = @"You stopped & gained some much needed health";
    
    NSMutableArray *firstColumn= [[NSMutableArray alloc]init];
    [firstColumn addObject:tile1];
    [firstColumn addObject:tile2];
    [firstColumn addObject:tile3];
    
    NHTile *tile4 = [[NHTile alloc]init];
    tile4.story = @"You have found a parrot, he can be used in your armor slot! Parrots are a great defender and are fiercly loyal to their captain.";
    tile4.backGroundImage = [UIImage imageNamed:@"pirate_parrott.jpg"];
    tile4.actionButtonName = @"Use the parrott";
    tile4.storyAfterButtonPressed = @"Really? Ok you now have the super parrott armor.";
    
    NHArmor *parrottArmor = [[NHArmor alloc]init];
    parrottArmor.name = @"Parrott Armor";
    parrottArmor.healthGained = 20;
    tile4.armor = parrottArmor;
    
    NHTile *tile5 = [[NHTile alloc]init];
    tile5.story = @"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?";
    tile5.backGroundImage = [UIImage imageNamed:@"pirate_weapons.jpg"];
    tile5.actionButtonName = @"Take the pistol";
    tile5.storyAfterButtonPressed = @"You have the pistol...be careful with that thing.";
    
    NHWeapon *pistolWeapon = [[NHWeapon alloc]init];
    pistolWeapon.name = @"Pistol";
    pistolWeapon.damageDone = 12;
    tile5.weapon = pistolWeapon;
    
    NHTile *tile6 = [[NHTile alloc]init];
    tile6.story = @"You have been captured by pirates and are ordered to walk the plank";
    tile6.backGroundImage = [UIImage imageNamed:@"assassins-creed-pirates.jpg"];
    tile6.actionButtonName = @"Show no fear";
    tile6.healthEffect = -22;
    tile6.storyAfterButtonPressed = @"Not such a good move - showing no fear might sound good but hurts !";
    
    
    NSMutableArray *secondColumn = [[NSMutableArray alloc]init];
    [secondColumn addObject:tile4];
    [secondColumn addObject:tile5];
    [secondColumn addObject:tile6];
    
    NHTile *tile7 = [[NHTile alloc]init];
    tile7.story = @"You sight a pirate battle off the coast";
    tile7.backGroundImage = [UIImage imageNamed:@"pirate_battle.jpg"];
    tile7.actionButtonName = @"Fight the scum!";
    tile7.healthEffect = -15;
    tile7.storyAfterButtonPressed = @"Arrrr fight, fight, fight";
    
    NHTile *tile8 = [[NHTile alloc]init];
    tile8.story = @"The legend of the deep, the mighty kraken appears";
    tile8.backGroundImage = [UIImage imageNamed:@"kraken5.jpg"];
    tile8.actionButtonName = @"Abandon ship";
    tile8.healthEffect = -46;
    tile8.storyAfterButtonPressed = @"You jumped for it - it hurt, ouch!";
    
    NHTile *tile9 = [[NHTile alloc]init];
    tile9.story = @"You stumble upon a hidden cave of pirate treasurer";
    tile9.backGroundImage = [UIImage imageNamed:@"pirate_treasure.jpg"];
    tile9.actionButtonName = @"Take treasure";
    tile9.healthEffect = 20;
    tile9.storyAfterButtonPressed = @"Good move, treasure makes you feel good, feeling good enhances your health";
    
    NSMutableArray *thirdColumn = [[NSMutableArray alloc]init];
    [thirdColumn addObject:tile7];
    [thirdColumn addObject:tile8];
    [thirdColumn addObject:tile9];
    
    NHTile *tile10 = [[NHTile alloc]init];
    tile10.story = @"A group of pirates attempts to board your ship";
    tile10.backGroundImage = [UIImage imageNamed:@"mean_pirates.jpg"];
    tile10.actionButtonName = @"Repel the invaders";
    tile10.healthEffect = 15;
    tile10.storyAfterButtonPressed = @"The pirates have been repelled, good work Captain";
    
    NHTile *tile11 = [[NHTile alloc]init];
    tile11.story = @"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?";
    tile11.backGroundImage = [UIImage imageNamed:@"treasure2.jpg"];
    tile11.actionButtonName = @"Swim deeper";
    tile11.healthEffect = -7;
    tile11.storyAfterButtonPressed = @"Oh dear, you can only hold your breath for short period of time...glug, glug, glug";
    
    NHTile *tile12 = [[NHTile alloc]init];
    tile12.story = @"Your final faceoff with the fearsome pirate boss";
    tile12.backGroundImage = [UIImage imageNamed:@"blackbeard.png"];
    tile12.actionButtonName = @"FIGHT!";
    tile12.healthEffect = arc4random()%30 - 30;
    tile12.isTileBoss = YES;
    tile12.storyAfterButtonPressed = @"Take that pirate scum!";
    
    NSMutableArray *fourthColumn = [[NSMutableArray alloc]init];
    [fourthColumn addObject:tile10];
    [fourthColumn addObject:tile11];
    [fourthColumn addObject:tile12];
    
    NSArray *tiles = [[NSArray alloc]initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tiles;
}

-(NHCharacter *) createCharacter
{
    NHCharacter *character = [[NHCharacter alloc]init];
    character.health = arc4random()%100;
    
    NHArmor *cloakArmor = [[NHArmor alloc]init];
    cloakArmor.name = @"Cloak";
    cloakArmor.healthGained = 5;
    character.armor = cloakArmor;
    
    NHWeapon *fistWeapon = [[NHWeapon alloc]init];
    fistWeapon.name = @"Fists of fury";
    fistWeapon.damageDone = 10;
    character.weapon = fistWeapon;
    
    return character;
    
}

-(NHBoss *) createBoss
{
    NHBoss *theBoss = [[NHBoss alloc]init];
    theBoss.bossHealth = arc4random()%100;
    
    return theBoss;
    
}

@end
