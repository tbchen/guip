//
//  GameScene.m
//  guip
//
//  Created by chentb on 14-8-12.
//  Copyright (c) 2014年 chentb. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene{
    GBButton *_classicButton;
}

-(void)didMoveToView:(SKView *)view {
    CGSize buttonSize = CGSizeMake(self.size.width/4, self.size.height/6);
    //Classic
    _classicButton =[GBButton buttonWithColor:[UIColor whiteColor] size:buttonSize text:@"Pause"];
    _classicButton.position = CGPointMake(self.size.width/2, _classicButton.size.height);
    _classicButton.delegate = self;
    [self addChild:_classicButton];
    
//    CGPoint location = [touch locationInNode:self];
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
    sprite.xScale = 0.5;
    sprite.yScale = 0.5;
    sprite.position = CGPointMake(self.size.width/2, self.size.height - sprite.size.height);
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    
    [sprite runAction:[SKAction repeatActionForever:action]];
    
    [self addChild:sprite];
}

-(void)onClick:(id)sender{
    [self.gameDelegate pause:sender];
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
