//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"

@interface LPGViewController () <UIGestureRecognizerDelegate>

@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    _petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _petImageView.userInteractionEnabled = YES;
    
    _petImageView.image = [UIImage imageNamed:@"default"];
    
    _appleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    _appleImageView.userInteractionEnabled = YES;
    
   _bucketImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bucket"]];
    
  
    
    [_bucketImageView setFrame:CGRectMake(230, 470, _bucketImageView.image.size.width / 4, _bucketImageView.image.size.height / 4)];
    
      [_appleImageView setFrame:CGRectMake(_bucketImageView.frame.origin.x, _bucketImageView.frame.origin.y, _appleImageView.image.size.width / 9, _appleImageView.image.size.height / 9)];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    _tapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:_tapGesture];
    
    _applesAteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    
    _applesAte = 0;
    
    _applesAteLabel.text = [NSString stringWithFormat:@"Apples Ate: %d", _applesAte];
    
    [self.view addSubview:_applesAteLabel];
    
    _stateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 200, 0, 200, 200)];
    
    _pet = [Pet new];
    
    _stateLabel.text = [NSString stringWithFormat:@"Current State: %@", _pet.currentState];
    
    [self.view addSubview:_stateLabel];

    [self.view addSubview:_petImageView];
    
    [self.view addSubview:_bucketImageView];
    
      [_bucketImageView addSubview:_appleImageView];
    
    if([_pet.currentState  isEqual: @"Tired"]) {
        [_petImageView setImage:[UIImage imageNamed:@"sleeping"]];
    }
    if([_pet.currentState  isEqual: @"Grumpy"]) {
        [_petImageView setImage:[UIImage imageNamed:@"grumpy"]];
    }
    if([_pet.currentState isEqual:@"Hungry"]) {
        [_petImageView setImage:[UIImage imageNamed:@"default"]];
    }
    
    [self prepareGestureRecognizers];
    
    _apple = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple"]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_applesAteLabel
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_applesAteLabel
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_bucketImageView
                                                          attribute:NSLayoutAttributeRightMargin
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRightMargin
                                                         multiplier:1.0
                                                           constant:-20.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_bucketImageView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:1.0]];

    
}

-(void)prepareGestureRecognizers{
    [self preparePanGestureRecognizer];
    [self preparePinchGestureRecognizer];
    
}

-(void)pinched:(UIPinchGestureRecognizer*) recognizer{
    CGPoint location = [recognizer locationInView:self.view];
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan:
            break;
        case UIGestureRecognizerStateChanged:
            break;
        case UIGestureRecognizerStateEnded:
            break;
            
    }
}
    -(void)panned:(UIPanGestureRecognizer*) recognizer {
        CGPoint location = [recognizer locationInView:self.view];
        CGPoint gestureTranslation = [recognizer translationInView:self];
        CGPoint gestureVelocity = [recognizer velocityInView:self];
      
        [_apple setFrame:CGRectMake(_bucketImageView.frame.origin.x, _bucketImageView.frame.origin.y, _appleImageView.image.size.width / 9, _appleImageView.image.size.height / 9)];
    _apple.tag = 1;
        
        if(![_apple isDescendantOfView:self.view]){
            
            [self.view addSubview: _apple];
            
        }
        switch (recognizer.state) {
            case UIGestureRecognizerStateBegan:
                _apple.center = location;
                break;
            case UIGestureRecognizerStateChanged:
                _apple.center = location;
                break;
            case UIGestureRecognizerStateEnded:
                _apple.center = location;
                if([self checkCollision] == YES) {
                    _applesAte = _applesAte + 1;
                    _pet.hungerLevel = _pet.hungerLevel - 10;
                    [_apple removeFromSuperview];
            _applesAteLabel.text = [NSString stringWithFormat:@"Apples Ate: %d", _applesAte];
                } else {
                     [self dropApple];
                }
                break;
                
        }
        [_pet updateState];
        _stateLabel.text = [NSString stringWithFormat:@"Current State: %@", _pet.currentState];
        _currentLocation = location;
     
    }

-(BOOL)checkCollision{
    if(CGRectIntersectsRect(_apple.frame, _petImageView.frame)){
        return YES;
    }
    
    return NO;
}

-(void)dropApple{
       [UIView animateWithDuration:0.8 animations:^{
        _apple.center = (CGPointMake(_apple.center.x, self.view.frame.size.height - self.view.frame.origin.y + 100));
    }];
}

-(void)handleTapGesture:(UITapGestureRecognizer *)sender{
    if(sender.state == UIGestureRecognizerStateRecognized) {
        NSLog(@"tapped twice");
    }
}

-(void)preparePanGestureRecognizer{
    
    self.panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned:)];
    [self.view addGestureRecognizer:self.panGesture];
    
}


-(void)preparePinchGestureRecognizer{
    self.pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinched:)];
    [self.petImageView addGestureRecognizer:self.pinchGesture];
}


@end
