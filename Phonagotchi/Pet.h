//
//  Pet.h
//  Phonagotchi
//
//  Created by Mark Meritt on 2016-07-07.
//  Copyright © 2016 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pet : NSObject

@property (nonatomic, readonly) BOOL isHungry;
@property (nonatomic, readonly) BOOL isGrumpy;
@property (nonatomic, readonly) BOOL isSleepy;
@property (nonatomic, strong) NSString* currentState;

@property (nonatomic, assign) int hungerLevel;
@property (nonatomic, assign) int sleepLevel;
@property (nonatomic, assign) int grumpyLevel;

-(void)petting: (float)vel;
-(void)updateState;

@end
