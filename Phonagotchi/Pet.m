//
//  Pet.m
//  Phonagotchi
//
//  Created by Mark Meritt on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import "Pet.h"

@implementation Pet

//0 - NOT SATISFIED
//100 - SATISFIED

-(instancetype) init {
    
    if(self = [super init]) {
        _currentState = @"";
    _hungerLevel = 0;
    _sleepLevel = 100;
    _grumpyLevel = 100;
        [self updateState];
    
    }
    return self;
}

-(void)petting:(float)vel{
    if (vel < 2.0) {
        NSLog(@"You are petting too fast.");
    }
}

-(void)updateState {
    if(_sleepLevel <= 50) {
        _currentState = @"Tired";
    }
    if(_hungerLevel <= 50) {
        _currentState = @"Hungry";
    }
    if(_grumpyLevel <= 50) {
        _currentState = @"Grumpy";
    }
}

@end
