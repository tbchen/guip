//
//  GBBall.m
//  balls
//
//  Created by chentb on 14-5-7.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "GBBall.h"

@implementation GBBall
-(instancetype)init{
    self = [super init];
    if (self) {
        // SKShapeNode *asteroid = [[SKShapeNode alloc] init];
        CGMutablePathRef myPath = CGPathCreateMutable();
        CGPathAddArc(myPath, NULL, 0,0, 20, 0, M_PI*2, YES);
        self.path = myPath;
        CGPathRelease(myPath);
        self.strokeColor = [SKColor clearColor];
        self.fillColor = [SKColor brownColor];
        
        self.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:20];
        self.physicsBody.restitution = 0;
        self.physicsBody.density = 20;
        //self.physicsBody.dynamic = NO;
        //asteroid.physicsBody.categoryBitMask = asteroidCategory;
        //asteroid.physicsBody.collisionBitMask = shipCategory | asteroidCategory | edgeCategory;
        //asteroid.physicsBody.contactTestBitMask = planetCategory;
    }
    return self;
}
@end
