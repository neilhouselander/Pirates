//
//  ViewController.h
//  Pirates
//
//  Created by Neil Houselander on 27/01/2015.
//  Copyright (c) 2015 Neil Houselander. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NHCharacter.h"
#import "NHBoss.h"


@interface ViewController : UIViewController

//ivars

@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic)NSArray *tiles;
@property (strong, nonatomic) NHCharacter *character;
@property (strong, nonatomic) NHBoss *boss;

//view outlets
@property (strong, nonatomic) IBOutlet UIImageView *backGroundImage;
@property (strong, nonatomic) IBOutlet UILabel *healthLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorNameLabel;
@property (strong, nonatomic) IBOutlet UIButton *actionButtonLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;
@property (strong, nonatomic) IBOutlet UILabel *mainBossLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageStaticLabel;
@property (strong, nonatomic) IBOutlet UILabel *bossHealthStaticLabel;
@property (strong, nonatomic) IBOutlet UILabel *bossHealthActual;
@property (strong, nonatomic) IBOutlet UILabel *bossDamageActual;


//actions
- (IBAction)actionButtonPressed:(UIButton *)sender;
- (IBAction)northButtonPressed:(UIButton *)sender;
- (IBAction)eastButtonPressed:(UIButton *)sender;
- (IBAction)southButtonPressed:(UIButton *)sender;
- (IBAction)westButtonPressed:(UIButton *)sender;
- (IBAction)resetButton:(UIButton *)sender;

@end

