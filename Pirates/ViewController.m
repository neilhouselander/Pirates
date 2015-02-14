//
//  ViewController.m
//  Pirates
//
//  Created by Neil Houselander on 27/01/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import "ViewController.h"
#import "NHFactory.h"
#import "NHTile.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create an instance of the factory, set the array property (tiles) by using the factory method that returns the 12 tiles - so now they are stored in self.tiles
    NHFactory *factory = [[NHFactory alloc]init];
    self.tiles = [factory createTiles];
    
    //create character
    self.character = [factory createCharacter];
    
    //create boss
    self.boss = [factory createBoss];
    
    //set the current point in the story to the index in the array 0,0 i.e. the first column (first index 0) then the 1st item in the column array (0 = tile1)
    self.currentPoint = CGPointMake(0,0);
    
    [self updateCharacterStatsForArmor:nil withWeapon:nil withHealthEffect:0];
    [self updateTile];
    [self updateButtons];
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark action methods

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    NHTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
     if (tile.isTileBoss)
    {
        self.boss.bossHealth = self.boss.bossHealth - self.character.damageDone;
    }
    
    [self updateCharacterStatsForArmor:tile.armor withWeapon:tile.weapon withHealthEffect:tile.healthEffect];
    
    //update the tile property so we know have been here
    tile.beenToThisTileBefore = YES;
    
    //update the tile
    [self updateTile];
    
    //update the story with the action done
    self.storyLabel.text = tile.storyAfterButtonPressed;
    

    
    //fire the alertview if health goes below 0
    if (self.character.health < 0)
    {
        UIAlertView *deathAlert = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died, restart the game" delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles:nil];
        [deathAlert show];

    }
    else if (self.boss.bossHealth < 0)
    {
        UIAlertView *deathAlert = [[UIAlertView alloc] initWithTitle:@"VICTORY !" message:@"You have defeated the evil pirate boss !" delegate:self cancelButtonTitle:@"Start Over" otherButtonTitles:nil];
        [deathAlert show];
    }
   

    
}

//all directional buttons - simply update the current point struct using CGPointMake function (updates the x & y values) then run the update buttons (to hide or unhide buttons) then the update tile to pull any info from the tile object now selcted

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y +1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint= CGPointMake(self.currentPoint.x, self.currentPoint.y -1);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButtons];
    [self updateTile];
}

- (IBAction)resetButton:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark helper methods
//helper methods note not declared in header file so only usable in this class

-(BOOL)tileExistsAtPoint: (CGPoint)point
{
    if (point.y >= 0 && point.x >= 0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count])
        //if the point x value is greater than 0 & the y AND x is less than number of arrays in the main array AND y is less than the number of arrays within the array within the main array then return NO the button should not be hidden
    {
        return NO;
        
    }else
    {
        return YES;
    }
}


-(void)updateButtons
{
    self.westButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.eastButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.northButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
    self.southButton.hidden = [self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
}


-(void) updateTile
//create a new tile (has the 3 properties) and set equal to the tile that comes from the array property item at the current point x y values - initially 0,0. Then update the view objects with that tiles values
{
    NHTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x]objectAtIndex:self.currentPoint.y];
    //get me the column object at index: current point x (a float value), then get me the tile object in that column at current point y
    
    //now update all the view items with data from the character & tile model
    self.storyLabel.text = tileModel.story;
    self.backGroundImage.image = tileModel.backGroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damageDone];
    self.armorNameLabel.text = self.character.armor.name;
    self.weaponNameLabel.text = self.character.weapon.name;
    
    //check not boss tile - if not then hide the button once used
     if (tileModel.isTileBoss)
    {
        [self.actionButtonLabel setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
        [self.actionButtonLabel setHidden:NO];
    }
    else
    {
        if (tileModel.beenToThisTileBefore)
        {
            [self.actionButtonLabel setHidden:YES];
        }
        else
        {
            [self.actionButtonLabel setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
            [self.actionButtonLabel setHidden:NO];
        }
    }
    
    //hide the boss labels if we are not on the boss tile
    if (tileModel.isTileBoss)
    {
        self.mainBossLabel.hidden = NO;
        self.damageStaticLabel.hidden = NO;
        self.bossHealthStaticLabel.hidden = NO;
        self.bossHealthActual.hidden = NO;
        self.bossDamageActual.hidden = NO;
        self.bossHealthActual.text = [NSString stringWithFormat:@"%i", self.boss.bossHealth];
        self.bossDamageActual.text = [NSString stringWithFormat:@"%i", tileModel.healthEffect];
    }
    else
    {
        self.mainBossLabel.hidden = YES;
        self.damageStaticLabel.hidden = YES;
        self.bossHealthStaticLabel.hidden = YES;
        self.bossHealthActual.hidden = YES;
        self.bossDamageActual.hidden = YES;
        self.bossHealthActual.text = [NSString stringWithFormat:@"%i", self.boss.bossHealth];
        self.bossDamageActual.text = [NSString stringWithFormat:@"%i", tileModel.healthEffect];
     }
}

//method to update all the stats

-(void) updateCharacterStatsForArmor: (NHArmor *)armor withWeapon: (NHWeapon *)weapon withHealthEffect: (int)healthEffect
{
    if (armor != nil)
    {
        self.character.health = self.character.health - self.character.armor.healthGained + armor.healthGained;
        self.character.armor = armor;
    }
    else if (weapon != nil)
    {
        self.character.damageDone = self.character.damageDone - self.character.weapon.damageDone + weapon.damageDone;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0)
    {
        self.character.health = self.character.health + healthEffect;
    }
    else
    {
        self.character.health = self.character.health + self.character.armor.healthGained;
        self.character.damageDone = self.character.damageDone + self.character.weapon.damageDone;
    }
}
//trying to figure out how to make alert view reset the game
-(void)alertView:(UIAlertView *) alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        self.character = nil;
        self.boss = nil;
        [self viewDidLoad];
    }
}
@end
