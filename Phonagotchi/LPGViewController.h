//
//  LPGViewController.h
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pet.h"

@interface LPGViewController : UIViewController

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) CGPoint currentLocation;
@property (nonatomic, assign) int applesAte;
@property (nonatomic) NSString* stateString;
@property (nonatomic, strong)  UILabel *applesAteLabel;
@property (nonatomic, strong)  UILabel *stateLabel;
@property (nonatomic, strong) Pet *pet;

@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic, strong) UIPinchGestureRecognizer *pinchGesture;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong)  UIImageView* apple;

-(void)prepareGestureRecognizers;
-(void)preparePanGestureRecognizer;
-(void)preparePinchGestureRecognizer;
-(BOOL)checkCollision;
-(void)dropApple;
-(void)handleTapGesture:(UITapGestureRecognizer*)sender;

@end
