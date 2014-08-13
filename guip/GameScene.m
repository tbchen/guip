//
//  GameScene.m
//  guip
//
//  Created by chentb on 14-8-12.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "GameScene.h"
#import <pop/POP.h>
#import "GBBall.h"
#import "SKTEffects.h"
#import "UIColor+CustomColors.h"

@implementation GameScene{
    GBButton *_classicButton;
}

-(void)didMoveToView:(SKView *)view {
    CGSize buttonSize = CGSizeMake(self.size.width/4, self.size.height/6);
    //Classic
    _classicButton =[GBButton buttonWithColor:[UIColor customBlueColor] size:buttonSize text:@"Pause"];
    _classicButton.position = CGPointMake(self.size.width/2, _classicButton.size.height);
    _classicButton.delegate = self;
    [_classicButton setFontSize:20];
    [self addChild:_classicButton];
    
//    CGPoint location = [touch locationInNode:self];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    sprite.xScale = 0.5;
    sprite.yScale = 0.5;
    sprite.position = CGPointMake(self.size.width/2, self.size.height - sprite.size.height);
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    
    [sprite runAction:[SKAction repeatActionForever:action]];
    
    [self addChild:sprite];
    
    self.backgroundColor = [UIColor customGrayColor];
}

-(void)onClick:(id)sender{
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"pause" object:nil];
    //SKAction* action = [SKAction moveToY:self.size.height / 2 duration:0.3];
    //show pause dialog
    CGSize dialogSize = CGSizeMake(self.size.width/2, self.size.height/2);
    GBDialog* pauseDialog = [[GBDialog alloc]initWithColor:[UIColor customGreenColor] size:dialogSize];
    pauseDialog.position = CGPointMake(self.size.width / 2,  self.size.height / 2 * 3);
    pauseDialog.zPosition = 100;
    [self addChild:pauseDialog];
    POPSpringAnimation *positionAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    positionAnimation.toValue = @(self.size.height / 2);
    positionAnimation.springBounciness = 12;
    positionAnimation.velocity = @2000;
    [positionAnimation setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        self.paused = YES;
        //self.userInteractionEnabled = NO;
    }];
    
//    POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//    scaleAnimation.springBounciness = 20;
//    scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
    
  //  [pauseDialog pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    [pauseDialog pop_addAnimation:positionAnimation forKey:@"positionAnimation"];
//
//    SKTMoveEffect *moveEffect = [SKTMoveEffect effectWithNode:pauseDialog duration:0.5 startPosition:pauseDialog.position endPosition:CGPointMake(pauseDialog.position.x + 10, pauseDialog.position.y + 10)];
//    SKTScaleEffect *scaleEffect = [SKTScaleEffect effectWithNode:pauseDialog duration:0.5 startScale:CGPointMake(1.0, 1.0) endScale:CGPointMake(1.5, 1.5)];
//    moveEffect.timingFunction = SKTTimingFunctionBackEaseOut;
//    [pauseDialog runAction:[SKAction actionWithEffect:scaleEffect]];
//    CGFloat initialScale = pauseDialog.xScale;
//    SKAction *scaleAction = [SKAction customActionWithDuration:1.0 actionBlock:^(SKNode *node, CGFloat elapsedTime) {
//        CGFloat t = elapsedTime/1.0;
//        CGFloat p = t*t;
//        CGFloat s = initialScale*(1-p) + 1.5 * p;
//        [node setScale:s];
//    }];
//    [pauseDialog runAction:scaleAction];
    
    
//    [pauseDialog runAction:action completion:^{
//        //POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
//        //scaleAnimation.springBounciness = 20;
//        //scaleAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(1.2, 1.4)];
//        //[_classicButton pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//        
//        
//    }];
   // [self test];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    //for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
    //}
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
